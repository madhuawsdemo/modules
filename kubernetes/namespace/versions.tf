terraform {
  required_version = ">= 0.13.2"
}

terraform {
  required_version = ">= 0.13.2"
  required_providers {
    kubernetes = {
      version = ">= 1.13.2"
      source  = "hashicorp/kubernetes"
    }
  }
}