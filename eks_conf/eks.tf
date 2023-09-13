resource "aws_iam_role" "market-app" {
  name = "eks-cluster-market-app"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "market-app-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.market-app.name
}


resource "aws_eks_cluster" "market-app" {
  name     = var.cluster-name
  role_arn = aws_iam_role.market-app.arn
  enable_amazon_eks_aws_ebs_csi_driver = true
  vpc_config {
    subnet_ids = [
      aws_subnet.project-us-east-1a.id,
      aws_subnet.project-us-east-1b.id,
      aws_subnet.public-us-east-1a.id,
      aws_subnet.public-us-east-1b.id
    ]
    endpoint_project_access = false
    endpoint_public_access = true
  }

  depends_on = [aws_iam_role_policy_attachment.market-app-AmazonEKSClusterPolicy]
}


