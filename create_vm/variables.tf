variable "project_id" {
  description = "ID del proyecto de GCP"
  type        = string
}

variable "region" {
  description = "Región donde se desplegarán los recursos"
  type        = string
  default     = "europe-west1"
}

variable "vm_name" {
  description = "Nombre de la CR"
  type        = string
  default     = "vm-prueba-tf-miguel"
}

variable "service_account_email" {
  description = "Cuenta de servicio para los nodos"
  type        = string
}
