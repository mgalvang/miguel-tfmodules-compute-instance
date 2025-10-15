

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

  tags = ["http-server", "https-server", "allow-tcp"]

  metadata_startup_script = <<-EOT
    #!/bin/bash

    # Crear grupo y usuario ansible
    groupadd -f g_ansible
    id -u ansible &>/dev/null || useradd -m -s /bin/bash -g g_ansible ansible

    # Crear carpeta .ssh y agregar clave pública para conexión SSH
    mkdir -p /home/ansible/.ssh
    echo "${var.public_ssh_key}" > /home/ansible/.ssh/authorized_keys
    chown -R ansible:g_ansible /home/ansible/.ssh
    chmod 700 /home/ansible/.ssh
    chmod 600 /home/ansible/.ssh/authorized_keys

    # Dar permiso sudo sin contraseña al usuario ansible
    echo "ansible ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/ansible
    chmod 440 /etc/sudoers.d/ansible
  EOT

}
