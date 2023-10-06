terraform {
  backend "s3" {
    bucket = "market-app-bucket-danie"
    key    = "monitoring-terraform.tfstate"
    region = "us-east-1"
    profile = "default"
  }
}
