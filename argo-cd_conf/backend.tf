terraform {
  backend "s3" {
    bucket = "market-app-bucket-liron"
    key    = "argocd-terraform.tfstate"
    region = "us-east-1"
    profile = "default"
  }
}