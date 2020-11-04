variable "resource_group_name" {
  description = "The name of the resource group in which the resources will be created"
}

#Location Variable
variable "location" {
  description = "The location where resource will be created"
}

variable "tags" {
  description = "Tags"
  type        = map(string)
}
