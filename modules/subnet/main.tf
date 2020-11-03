resource "azurerm_subnet" "current" {
  name                      = var.subnet_name
  resource_group_name       = var.resource_group_name
  virtual_network_name      = var.vnet_name
  address_prefix            = var.subnet_prefix
  network_security_group_id = var.nsg_id         
  route_table_id            = var.route_table_id 
}