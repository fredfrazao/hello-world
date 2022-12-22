
variable "site" {
  type = string
}

variable "location" {
  type    = string
}

variable "akv_sku_name" {
  type    = string
  default = "standard"
}
#
variable "akv_enabled_for_deployment" {
  type    = bool
  default = false
}
#
variable "akv_enabled_for_disk_encryption" {
  type    = bool
  default = false
}
#
variable "akv_soft_delete_retention_days" {
  type    = number
  default = 30
}
#
variable "akv_purge_protection_enabled" {
  type    = bool
  default = true
}

variable "tenant_id" {
  type = string
}

variable "tags" {
  description = "Tags to add on resources"
  type        = map(string)
}
