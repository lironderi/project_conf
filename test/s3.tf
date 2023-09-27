resource "aws_s3_bucket" "tf-state-bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_object" "object" {
  count  = var.create_resource ? 1 : 0
  key    = "terraform.tfstate"
  bucket = aws_s3_bucket.tf-state-bucket.id
  source = var.state
}
#test 8