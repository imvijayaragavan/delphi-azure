
variable "resource_group_name" {
  description = "The name of the resource group in which the resources will be created"
}

variable "location" {
  description = "The location where resource will be created"
}

variable "vnet_name" {
  description = "Provide Vnet Name "
}

variable "vnet_cidr" {
  description = "Provide CIDR"
}

variable "tags" {
  description = "Tags"
  type        = map(string)
}
