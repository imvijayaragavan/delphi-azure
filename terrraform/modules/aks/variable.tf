variable "resource_group_name" {
  description = "That variable is required"
  type = string
}

variable "location" {
  description = "Default region to deploy aks cluster"
  default = "East US"
}

variable "service_principal_client_id" {
  description = "Your Azure API access client id"
  type = string
}

variable "service_principal_client_secret" {
  description = "Your Azure API access client secret"
  type = string
}

variable "prefix" {
  default = "test"
}

variable "node_pool_vm_size" {
  description = "Size of AKS worker node instance"
  default = "Standard_B2s"
}

variable "node_pool_node_count" {
  description = "AKS cluster worker nodes count" 
  default = 3
}

variable "tags" {
  type        = map(string)
  description = "Any tags that should be present on the Virtual Network resources"
  default     = {}
}

variable "enable_log_analytics_workspace" {
  type        = bool
  description = "Enable the creation of azurerm_log_analytics_workspace and azurerm_log_analytics_solution or not"
  default     = false
}

variable "log_retention_in_days" {
  description = "The retention period for the logs in days"
  default     = 30
}

# TODO: Document price for logs analitycs
variable "log_analytics_workspace_sku" {
  description = "The SKU (pricing level) of the Log Analytics workspace. For new subscriptions the SKU should be set to PerGB2018"
  default     = "PerGB2018"
}

variable "kubernetes_version" {
  description = "Version of Kubernetes"
}

variable "ip_prefix_id" {
  description = "A prefix of public addresses"
  default = null
}

variable "aks_node_pool_snet_id" {
  description = "An ID of node pool subnet"
}

variable "service_cidr" {
  description = "An IP range for services"
}

variable "pod_cidr" {
  description = "An IP range for pods"
}

variable "dns_service_ip" {
  description = "An IP for dns service"
}

variable "docker_bridge_cidr" {
  description = "An IP range for docker bridge"
  default = "172.17.0.1/16"
}

variable "np_orchestrator_version" {
  description = "A node pool orchestrator version"
}

variable "enable_private_cluster" {
  type        = string
  description = "Enable the creation of private cluster in Kubernetes"
  default     = false
}

variable "enable_lb_profile" {
  type         = bool
  description  = "Toogle the lb profile enable / disable"
  default      = true
}