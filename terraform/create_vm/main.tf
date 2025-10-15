
resource "tls_private_key" "ansible_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "google_compute_instance" "default" {
  name     = var.name
  machine_type = var.machine_type
  zone = var.zone

  boot_disk {
    initialize_params {
      image = var.os_image
    }
  }

  network_interface {
    network = var.network
    subnetwork = var.subnetwork
  }

  service_account {
    email = var.service_account_email
    scopes = ["cloud-platform"]
  }

  tags = var.tags

  metadata_startup_script = <<-EOT
    #!/bin/bash

    groupadd -f g_ansible
    id -u ansible &>/dev/null || useradd -m -s /bin/bash -g g_ansible ansible

    mkdir -p /home/ansible/.ssh
    echo "${tls_private_key.ansible_key.public_key_openssh}" > /home/ansible/.ssh/authorized_keys
    chown -R ansible:g_ansible /home/ansible/.ssh
    chmod 700 /home/ansible/.ssh
    chmod 600 /home/ansible/.ssh/authorized_keys

    echo "ansible ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/ansible
    chmod 440 /etc/sudoers.d/ansible
  EOT
}

resource "local_file" "private_key" {
  content          = tls_private_key.ansible_key.private_key_pem
  filename         = "${path.module}/ansible_key.pem"
  file_permission  = "0600"
}