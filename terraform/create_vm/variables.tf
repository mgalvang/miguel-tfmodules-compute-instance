variable "project_id" {
  description = "ID del proyecto de GCP"
  type        = string
}

variable "zone" {
  description = "Zona donde se desplegarán los recursos"
  type        = string
}
variable "region" {
  description = "Region donde se desplegarán los recursos"
  type        = string
}
variable "name" {
  description = "Nombre de la VM"
  type        = string
}
variable machine_type {
  description = "Tipo de Maquina"
  type = string
}
variable os_image {
  type = string
}
variable network {
  type = string
}
variable subnetwork {
  type = string
}
variable "service_account_email" {
  description = "Cuenta de servicio para los nodos"
  type        = string
}
variable "tags" {
  description = "Etiquetas para la instancia"
  type        = list(string)
}