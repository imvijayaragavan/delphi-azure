output "registry_id" {
  value = azurerm_container_registry.acr.id
}

output "registry_login_url" {
  value = azurerm_container_registry.acr.login_server
}