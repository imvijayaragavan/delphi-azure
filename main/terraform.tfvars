location               = "uaenorth"
resource_group_name    = "delphi_vj_rg"

tags = {
  generic = {
    "environment" = "delphi",
    "owner"       = "vj"
  }
}

aks_name                = "delphi-vj-aks"
acr_name                = "delphivjacr"
vnet_name               = "delphivjvnet"
subnet_name             = "delphivjsnet"
public_ip_prefix_name   = "delphivjpublicip"
vnet_cidr               = "172.23.130.0/24"
subnet_prefix           = "172.23.130.0/25"
service_cidr            = "10.20.0.0/16"
pod_cidr                = "10.21.0.0/22"
dns_service_ip          = "10.20.0.10"
np_orchestrator_version = "1.16.13"
kubernetes_version      = "1.16.13"
role_type               = "Owner"
azuread_service_principal_id  = "aedc8655-57f5-466d-8996-887d368f27cd"
key_vault_name     = "delphi-vj-kv"
key_vault_sku_name = "premium"
key_vault_key_name = "development-disks-key"