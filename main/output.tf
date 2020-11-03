output "kube_config" {
  value = module.aks.kube_config
}

output "vnet_id" {
  value = module.vnet_aks.vnet_id
}

output "key_vault_name" {
  value = var.key_vault_name
}

output "key_vault_key_name" {
  value = var.key_vault_key_name
}

output "subnet_id" {
  value = module.aks-node-pool-snet.subnet_id
}