terraform {
  backend "s3" {
    bucket = "market-app-bucket-prod-liron"
    key    = "terraform.tfstate"
    region = "us-east-1"
    profile = "default"
  }
}

# test 8
