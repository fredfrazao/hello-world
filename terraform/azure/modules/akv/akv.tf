
resource "azurerm_resource_group" "key_vault" {
  name     = "key_vault"
  location = var.location
}
resource "azurerm_key_vault" "key_vault" {
  name                        = "akv-${var.site}"
  location                    = var.location
  resource_group_name         = azurerm_resource_group.key_vault.name
  sku_name                    = var.akv_sku_name
  tenant_id                   = var.tenant_id
  enabled_for_deployment      = var.akv_enabled_for_deployment
  enabled_for_disk_encryption = var.akv_enabled_for_disk_encryption
  enable_rbac_authorization   = true

  purge_protection_enabled   = var.akv_purge_protection_enabled
  soft_delete_retention_days = var.akv_soft_delete_retention_days

  tags = var.tags
}



output "akv_id" {
  value = azurerm_key_vault.key_vault.id
}
