terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }

}
} 
provider "aws" {
  region = "us-east-1"
}


provider "kubernetes" {
  config_path = pathexpand(var.kube_config)
}


