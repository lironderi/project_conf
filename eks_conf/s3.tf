data "aws_s3_bucket" "existing" {
  bucket = var.bucket_name
}
resource "aws_s3_bucket" "tf-state-bucket" {
  count  = data.aws_s3_bucket.existing ? 0 : 1
  bucket = var.bucket_name
}

resource "aws_s3_bucket_object" "object" {
  count  = data.aws_s3_bucket.existing ? 0 : 1
  key    = "terraform.tfstate"
  bucket = aws_s3_bucket.tf-state-bucket[0].id
  source = var.state
}