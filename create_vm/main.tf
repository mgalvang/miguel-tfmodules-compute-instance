

resource "google_compute_instance" "default" {
  name     = var.name
  machine_type = var.machine_type
  location = var.region

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
}
