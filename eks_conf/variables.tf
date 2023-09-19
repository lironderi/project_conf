variable "cluster-name" {
  description = "Enter eks cluster name"
  type        = string
  default     = "market-app-cluster"
}

variable "create_resource" {
  type        = bool
  default     = true
  description = "controls whether the resource should be created"
}

variable "kube_config" {
  type    = string
  default = "~/.kube/config"
}

variable "namespace_monitoring" {
  type    = string
  default = "monitoring"
}

variable "namespace_myapp" {
  type    = string
  default = "myapp"
}

variable "kube-version" {
  type = string
  default = "36.2.0"
}