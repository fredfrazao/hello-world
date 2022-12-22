module "akv" {
  source = "../modules/akv"
  for_each = toset(var.akv_enabled ? ["akv _enabled"] : [])
  site                           = var.site
  tenant_id                      = data.azurerm_client_config.current.tenant_id
  tags = var.tags
  location = var.location
}


module "aks" {
  source = "../modules/aks"

  for_each = toset(var.aks_enabled ? ["aks"] : [])

  identifier = "${var.site}-aks"
  location   = var.location
  site       = var.site


  tags = var.tags

  username = "some_user"
  akv_id   = data.azurerm_key_vault.key_vault.id
}

