variable "project_id" {
  description = "ID del proyecto de GCP"
  type        = string
    default     = ""

}

variable "zone" {
  description = "Zona donde se desplegarán los recursos"
  type        = string
  default     = "europe-west1-b"
}
variable "region" {
  description = "Región de GCP extraída de la zona"
  type        = string
}
variable "name" {
  description = "Nombre de la VM"
  type        = string
  default     = "vm-prueba-tf-miguel"
}
variable machine_type {
  description = "Tipo de Maquina"
  type = string
  default = "n1-standard-1"
}
variable os_image {
  type = string
  default = ""
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