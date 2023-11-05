provider "helm" {
  kubernetes {
    config_path = pathexpand(var.kube_config)
  }
}
provider "kubernetes" {
  config_path = pathexpand(var.kube_config)
}
terraform {
  required_version = ">= 1.0.0"

  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "= 2.5.1"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }
  }
}