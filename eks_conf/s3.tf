resource "aws_s3_bucket" "tf-state-bucket" {
  bucket = "marketapp-project-daniel"
}



resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.tf-state-bucket.id
  policy = data.aws_iam_policy_document.elb_log_policy.json
}

resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.tf-state-bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "example" {
  depends_on = [
    aws_s3_bucket_ownership_controls.example
  ]

  bucket = aws_s3_bucket.tf-state-bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_object" "object" {
  count  = var.create_resource ? 1 : 0
  key    = "terraform.tfstate"
  bucket = aws_s3_bucket.tf-state-bucket.id
  source = "./terraform.tfstate"
}




# S3 Bucket for ALB Logs
resource "aws_s3_bucket" "alb-logs" {
  bucket = "marketapp-project-alb-logs"
}

data "aws_iam_policy_document" "alb_log_policy" {
  statement {
    actions   = ["s3:PutObject"]
    resources = ["${aws_s3_bucket.alb-logs.arn}/*"]

    principals {
      type        = "Service"
      identifiers = ["elasticloadbalancing.amazonaws.com"]
    }
  }
}

resource "aws_s3_bucket_policy" "alb_log_bucket_policy" {
  bucket = aws_s3_bucket.alb-logs.id
  policy = data.aws_iam_policy_document.alb_log_policy.json
}

data "aws_iam_policy_document" "elb_log_policy" {
  statement {
    actions   = ["s3:PutObject"]
    resources = ["${aws_s3_bucket.tf-state-bucket.arn}/*"]

    principals {
      type        = "Service"
      identifiers = ["elasticloadbalancing.amazonaws.com"]
    }
  }
}