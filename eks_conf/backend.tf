terraform {
  backend "s3" {
    bucket = "market-app-bucket"
    key    = "terraform.tfstate"
    region = "us-east-1"
    profile = "default"
  }
}

