resource "null_resource" "kubectl" {
    provisioner "local-exec" {
        command = "aws eks --region us-east-1 update-kubeconfig --name ${var.cluster-name}"
    }
}

resource "helm_release" "kube-prometheus" {
  name       = "kube-prometheus-stackr"
  namespace  = var.namespace_monitoring
  create_namespace = true
  version    = var.kube-version
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
}