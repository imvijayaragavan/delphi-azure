output "subnet_id" {
  value = azurerm_subnet.current.id
}

output "subnet_name" {
  value = azurerm_subnet.current.name
}

output "subnet_rg_name" {
  value = azurerm_subnet.current.resource_group_name
}
