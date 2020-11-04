variable "key_vault_name" {
  description = "Azure Key Vault Name"
  type        = string
}

variable "key_vault_sku_name" {
  description = "Azure Key Vault SKU Name (must be premium for HSM)"
  type        = string
}

variable "key_vault_key_name" {
  description = "Azure Key Vault Key Name"
  type        = string
}

variable "location" {
  description = "Vault Location"
  type        = string
}

variable "resource_group_name" {
  description = "Vault Resource Group Name"
  type        = string
}

variable "tags" {
  description = "Tags"
  type        = map(string)
}