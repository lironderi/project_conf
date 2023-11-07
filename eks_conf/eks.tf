resource "aws_iam_role" "market-app" {
  name = var.cluster-name

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

resource "aws_eks_addon" "addons" {
  depends_on = [ aws_eks_cluster.market-app, aws_eks_node_group.Market_nodes,]
  cluster_name      = aws_eks_cluster.market-app.name
  addon_name        = "aws-ebs-csi-driver"
  addon_version     = "v1.22.0-eksbuild.2"
  resolve_conflicts = "OVERWRITE"
}

resource "null_resource" "kubectl" {
    depends_on = [ aws_eks_cluster.market-app ]
    provisioner "local-exec" {
        command = "aws eks --region us-east-1 update-kubeconfig --name ${var.cluster-name}"
    }
}


#test3
