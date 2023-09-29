terraform {
  backend "s3" {
    bucket = "market-app-bucket-prod-liron"
    key    = "env:/production/terraform.tfstate"
    region = "us-east-1"
    profile = "default"
  }
}
