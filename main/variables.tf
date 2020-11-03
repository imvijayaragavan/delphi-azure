
variable "resource_group_name" {
  description = "The name of the resource group in which the resources will be created"
}

variable "location" {
  description = "The location where resource will be created "
}

variable "vnet_name" {
  description = "Provide Vnet Name"
}

variable "vnet_cidr" {
    description = "Provide vnet cidr address space"
}

variable "subnet_name" {
  type = map(string)
}

variable "subnet_prefix" {
  type = map(string)
}

variable "tags" {
  type = map(map(string))
}

variable "aks_name" {
  description = "AKS cluster name"
}

variable "kubernetes_version" {
  description = "Version of Kubernetes"
}

variable "aks_address_space" {
  description = "A address space for aks-vnet"
}

variable "service_cidr" {
  description = "An IP range for services"
}

variable "pod_cidr" {
  description = "An IP range for pods"
}

variable "np_orchestrator_version" {
  description = "A node pool orchestrator version"
}

variable "dns_service_ip" {
  description = "An IP for dns service"
}

variable "azuread_service_principal_id" {
  description = "An ID of AzureAD application"
}

variable "azuread_service_principal_password" {
  description = "A password for Service Principal"
}

variable "public_ip_prefix_name" {
    description = "Public ip for load balancer prefix name"
}

variable "acr_name" {
    description = "Provide Azure container registry name"
}

variable "role_type"{
     description = "Role type"
}

variable "key_vault_name" {
    description = "Provide Key vault name"   
}

variable "key_vault_sku_name" {
    description = "Provide SKU name"
}

variable "key_vault_key_name" {
    description = "Provide the key vault key name
}