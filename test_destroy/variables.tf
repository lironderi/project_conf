variable "state" {
  type = string
  description = "add state source"
}
variable "bucket_name" {
  type = string
  description = "bucket name"
}
variable "create_resource" {
  type        = bool
  default     = true
  description = "controls whether the resource should be created"
}
#test 2