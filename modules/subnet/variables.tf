variable "resource_group_name" {
  description = "The name of the resource group in which the resources will be created"
}

variable "location" {
  description = "The location where resource will be created"
}

variable "subnet_name" {}
variable "subnet_prefix" {}
variable "vnet_name" {}
variable "nsg_id" {
  description = "Default NSG ID"
}

variable "route_table_id" {
  description = "default route table id"
}

