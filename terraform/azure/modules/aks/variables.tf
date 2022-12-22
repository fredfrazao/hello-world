
variable "location" {
  description = "The Azure Region in which all resources in this example should be provisioned"
}

variable "identifier" {
  type = string
}

variable "site" {
  type = string
}

variable "username" {
  type = string
}

variable "akv_id" {
  type = string
}


variable "tags" {
  description = "Tags to be applied to the resources"
  type        = map(string)
}

variable "node_zones" {
  type    = list(string)
  default = ["1", "2", "3"]
}