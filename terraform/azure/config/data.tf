data "azurerm_client_config" "current" {}


data "azurerm_key_vault" "key_vault" {
  name                = "akv-${var.site}"
  resource_group_name = "key_vault"

  depends_on = [module.akv]
}