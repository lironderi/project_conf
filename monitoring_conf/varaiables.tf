variable "kube_config" {
  type    = string
  default = "~/.kube/config"
}
variable "namespace_monitoring" {
  type    = string
  default = "monitoring"
}
variable "kube-version" {
  type = string
  default = "36.2.0"
}