resource "helm_release" "argocd" {
  name             = "argocd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  namespace        = "argocd"
  create_namespace = true
  version          = "3.35.4"
  values           = [file("values/argo-cd.yaml")]
}
resource "null_resource" "kubectl" {
    provisioner "local-exec" {
        command = "aws eks --region us-east-1 update-kubeconfig --name ${var.cluster-name}"
    }
}
resource "kubernetes_namespace" "myapp" {
  metadata {
    name = var.namespace_myapp
  }
}
# helm install argocd -n argocd -f values/argo-cd.yaml\