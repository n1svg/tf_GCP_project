terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = ">= 4.0.0"
    }
  }
}
provider "google" {
  credentials = var.service_account_key
  project     = var.project
}

module "vpc-test" {
  source = "./modules/networks/"
}


