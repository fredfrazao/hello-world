
variable "site" {
  type = string

}
variable "tags" {
  description = " tags to add on every resource"
  type        = map(string)
  default = {
    provisioning = "terraform"
  }
}

variable "location" {
  type    = string
  default = "germanywestcentral"
}

variable "akv_enabled" {
  type    = bool
  default = false
}

variable "aks_enabled" {
  type    = bool
  default = false
}

