module "vnet_aks" {
  source              = "../modules/virtual_network"
  resource_group_name = var.resource_group_name
  location            = var.location
  vnet_name           = var.vnet_name
  vnet_cidr           = var.vnet_cidr
  tags                = var.tags["generic"]
}

module "aks-node-pool-snet" {
  source               = "../modules/subnet"
  subnet_name          = var.subnet_name
  resource_group_name  = var.resource_group_name
  subnet_prefix        = [var.subnet_prefix]
  vnet_name            = var.vnet_name
}

resource "azurerm_public_ip_prefix" "kubernetes_dev" {
  name                = var.public_ip_prefix_name
  location            = var.location
  resource_group_name = var.resource_group_name
  prefix_length       = 28
  tags                = var.tags["generic"]
}

module "aks" {
  source                          = "../modules/aks"
  resource_group_name             = var.resource_group_name
  location                        = var.location
  prefix                          = var.aks_name
  enable_log_analytics_workspace  = false
  service_principal_client_id     = var.azuread_service_principal_id
  service_principal_client_secret = var.azuread_service_principal_password
  kubernetes_version              = var.kubernetes_version
  ip_prefix_id                    = [azurerm_public_ip_prefix.kubernetes_dev.id]
  aks_node_pool_snet_id           = module.aks-node-pool-snet.id
  service_cidr                    = var.service_cidr
  pod_cidr                        = var.pod_cidr
  dns_service_ip                  = var.dns_service_ip
  np_orchestrator_version         = var.np_orchestrator_version
  tags                            = var.tags["generic"]
}

module "acr" {
  source                          = "../modules/acr"
  resource_group_name             = var.resource_group_name
  location                        = var.location
  acr_name                        = var.acr_name
  enable_admin_user               = false
  service_principal_client_id     = var.azuread_service_principal_id
  role_type                       = var.role_type
  tags                            = var.tags["generic"]
}

module "kv" {
  location              = var.location
  resource_group_name   = var.resource_group_name
  source                = "../modules/keyvault"
  key_vault_name        = var.key_vault_name
  key_vault_sku_name    = var.key_vault_sku_name
  key_vault_key_name    = var.key_vault_key_name
  tags                  = var.tags["generic"]
}

resource "azurerm_key_vault_access_policy" "kv-sp" {
  key_vault_id = module.kv.key_vault_id
  tenant_id    = "89b0ba56-c903-46da-b1d8-2ee4728bafae"
  object_id    = "aedc8655-57f5-466d-8996-887d368f27cd"
  key_permissions = [
    "Get",
    "List",
    "Update",
    "Create",
    "Import",
    "Delete",
    "Recover",
    "Backup",
    "Restore",
  ]
  secret_permissions = [
    "Get",
    "List",
    "Set",
    "Delete",
    "Recover",
    "Backup",
    "Restore",
  ]
}
