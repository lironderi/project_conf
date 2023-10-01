variable "cluster-name" {
  description = "Enter eks cluster name"
  type        = string
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

variable "namespace_myapp" {
  type    = string
  default = "myapp"
}