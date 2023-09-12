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