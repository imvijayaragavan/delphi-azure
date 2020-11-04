output "key_vault_id" {
  value = azurerm_key_vault.current.id
}

output "key_vault_rg_name" {
  value = azurerm_key_vault.current.resource_group_name
}

output "kv_name" {
  value = azurerm_key_vault.current.name
}

output "kv_location" {
  value = azurerm_key_vault.current.location
}