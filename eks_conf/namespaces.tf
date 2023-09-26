resource "kubernetes_namespace" "myapp" {
  depends_on = [ aws_eks_node_group.Market_nodes, aws_eks_cluster.market-app ]  
  metadata {
    name = var.namespace_myapp
  }
}