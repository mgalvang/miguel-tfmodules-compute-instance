output "instance_name" {
  value = google_compute_instance.default.name
}

output "zone" {
  value = google_compute_instance.default.zone
}

output "project_id" {
  value = var.project_id
}

output "ansible_ssh_private_key_path" {
  value = var.private_key_path
  description = "Ruta local a la clave privada SSH para Ansible"
}
