output "kube_config" {
  value = azurerm_kubernetes_cluster.akscluster.*.kube_config_raw
}