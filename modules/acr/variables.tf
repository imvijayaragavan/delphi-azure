variable "resource_group_name" {
  description = "That variable is required"
  type = string
}

variable "location" {
  description = "Default region to deploy aks cluster"
  default = "East US"
}

variable "acr_name" {
    description = "Azure container registry name"
    type = string
}

variable "sku_type" {
    description = "ACR SKU type"
    default = "Standard"
}

variable "enable_admin_user" {
    description = "Enabling Admin user in ACR"
    default = "false"
}

variable "service_principal_client_id" {
  description = "Your Azure API access client id"
  type = string
}

variable "role_type" {
  description = "Azure registry role type"
  default     = "AcrPull"
}

variable "tags" {
  type        = map(string)
  description = "Any tags that should be present on the Virtual Network resources"
  default     = {}
}