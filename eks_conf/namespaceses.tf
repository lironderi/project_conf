resource "kubernetes_namespace" "monitoring" {
  depends_on = [ resource.aws_eks_node_group.Market_nodes ]  
  metadata {
    name = var.namespace_monitoring
  }
}

resource "kubernetes_namespace" "myapp" {
  depends_on = [ resource.aws_eks_node_group.Market_nodes ]  
  metadata {
    name = var.namespace_myapp
  }
}