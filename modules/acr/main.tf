resource "azurerm_container_registry" "acr" {
  name                     = var.acr_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  sku                      = var.sku_type
  admin_enabled            = var.enable_admin_user ? true : false
  tags                     = var.tags
}

resource "azurerm_role_assignment" "acr_role" {
  scope                            = azurerm_container_registry.acr.id
  role_definition_name             = var.role_type
  principal_id                     = var.service_principal_client_id
  skip_service_principal_aad_check = true
}
