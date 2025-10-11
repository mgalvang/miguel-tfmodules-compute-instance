variable "project_id" {
  description = "ID del proyecto de GCP"
  type        = string
}

variable "region" {
  description = "Región donde se desplegarán los recursos"
  type        = string
  default     = "europe-west1-b"
}

variable "cluster_name" {
  description = "Nombre del cluster GKE"
  type        = string
  default     = "gke-prueba-tf-miguel"
}

variable "node_pool_name" {
  description = "Nombre del pool de nodos"
  type        = string
  default     = "tf-node-pool"
}

variable "machine_type" {
  description = "Tipo de máquina para los nodos"
  type        = string
  default     = "e2-medium"
}

variable "service_account_email" {
  description = "Cuenta de servicio para los nodos"
  type        = string
}
