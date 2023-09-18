terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "= 2.5.1"
    }
  }
}
provider "aws" {
  region = "us-east-1"
}
provider "helm" {
  kubernetes {
    config_path = pathexpand(var.kube_config)
  }
}
provider "kubernetes" {
  config_path = pathexpand(var.kube_config)
}