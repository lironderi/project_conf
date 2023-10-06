terraform {
  backend "s3" {
    bucket = "market-app-bucket-daniel"
    key    = "argocd-terraform.tfstate"
    region = "us-east-1"
    profile = "default"
  }
}
