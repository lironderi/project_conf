variable "cluster-name" {
  type = string
}
variable "namespace_myapp" {
  type    = string
  default = "myapp"
}
variable "kube_config" {
  type    = string
  default = "~/.kube/config"
}
