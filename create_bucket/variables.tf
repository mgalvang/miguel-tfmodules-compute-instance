variable "project_id" {
  description = "ID del proyecto de GCP"
  type        = string
}

variable "region" {
  description = "Región donde se desplegarán los recursos"
  type        = string
  default     = "europe-west1-b"
}
variable "bucket_name" {
  description: "Nombre del bucket"
  type: "string"
  default: "bucket-prueba-tf-miguel"
}