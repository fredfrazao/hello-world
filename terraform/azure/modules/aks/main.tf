
resource "azurerm_resource_group" "aks" {
  name     = "aks"
  location = var.location
}

resource "tls_private_key" "ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "azurerm_key_vault_secret" "ssh_private_key" {
  name         = "scrt-${var.identifier}-ssh-private-key"
  value        = tls_private_key.ssh.private_key_pem
  key_vault_id = var.akv_id
  tags         = var.tags

  depends_on = [tls_private_key.ssh]
}


resource "azurerm_key_vault_secret" "ssh_public_key" {
  name         = "scrt-${var.identifier}-ssh-public-key"
  value        = tls_private_key.ssh.public_key_openssh
  key_vault_id = var.akv_id
  tags         = var.tags
  depends_on   = [tls_private_key.ssh]
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${var.site}-k8s"
  location            = var.location
  resource_group_name = azurerm_resource_group.aks
  dns_prefix          = "${var.site}-k8s"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_DS2_v2"
    zones      = var.node_zones

  }

  identity {
    type = "SystemAssigned"
  }

  linux_profile {
    admin_username = var.username

    ssh_key {
      key_data = tls_private_key.ssh.private_key_pem
    }
  }
}
