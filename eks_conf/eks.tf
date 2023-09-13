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

resource "aws_iam_role_policy_attachment" "market-app-AmazonEKSServicePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  role       = aws_iam_role.market-app.name
}

resource "aws_eks_cluster" "market-app" {
  name     = var.cluster-name
  role_arn = aws_iam_role.market-app.arn
  vpc_config {
    subnet_ids = [
      aws_subnet.private-us-east-1a.id,
      aws_subnet.private-us-east-1b.id,
      aws_subnet.public-us-east-1a.id,
      aws_subnet.public-us-east-1b.id
    ]
    endpoint_private_access = false
    endpoint_public_access = true
  }

  depends_on = [ 
    aws_iam_role_policy_attachment.market-app-AmazonEKSClusterPolicy, 
    aws_iam_role_policy_attachment.market-app-AmazonEKSServicePolicy, 
    ]
}

