terraform {
    backend "gcs" { 
      bucket  = "terraform-jb-bucket"
      prefix  = "prod"
    }
}

provider "google" {
  project = var.project
  region = var.region
}
