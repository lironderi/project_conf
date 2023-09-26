data "aws_s3_bucket" "existing" {
  bucket = var.bucket_name
}
resource "aws_s3_bucket" "tf-state-bucket" {
  count  = length(data.aws_s3_bucket.existing) == 0 ? 1 : 0
  bucket = var.bucket_name
}

resource "aws_s3_bucket_object" "object" {
  count  = length(data.aws_s3_bucket.existing) == 0 ? 1 : 0
  key    = "terraform.tfstate"
  bucket = var.bucket_name
  source = var.state
}

#test2