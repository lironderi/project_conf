provider "aws" {
  region = "us-east-1"
}
data "aws_eks_cluster" "cluster" {
  name = var.cluster_name
}
data "aws_eks_cluster_auth" "cluster" {
  name = var.cluster_name
}
data "aws_iam_openid_connect_provider" "oidc_provider" {
  url = data.aws_eks_cluster.cluster.identity.0.oidc.0.issuer
}
provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.cluster.endpoint
    token                  = data.aws_eks_cluster_auth.cluster.token
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  }
}
