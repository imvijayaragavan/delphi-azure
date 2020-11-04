resource "azurerm_kubernetes_cluster" "akscluster" {
  name                        = var.prefix
  location                    = var.location
  resource_group_name         = var.resource_group_name
  dns_prefix                  = var.prefix
  private_cluster_enabled     = var.enable_private_cluster ? true : false
  count                       = var.enable_lb_profile ? 1 : 0

  default_node_pool {
    name                 = "default"
    node_count           = var.node_pool_node_count
    vm_size              = var.node_pool_vm_size
    # IN GUI: VM Scale Sets: Enabled
    type                 = "VirtualMachineScaleSets"
    vnet_subnet_id       = var.aks_node_pool_snet_id
    orchestrator_version = var.np_orchestrator_version
  }

  role_based_access_control {
    enabled = true
  }

  network_profile {
    network_plugin = "kubenet"
    network_policy = "calico"
    load_balancer_profile {
      outbound_ip_prefix_ids = var.ip_prefix_id
    }
    service_cidr       = var.service_cidr
    pod_cidr           = var.pod_cidr
    docker_bridge_cidr = var.docker_bridge_cidr
    dns_service_ip     = var.dns_service_ip
  }

  service_principal {
    client_id     = var.service_principal_client_id
    client_secret = var.service_principal_client_secret
  }

  dynamic addon_profile {
    for_each = var.enable_log_analytics_workspace ? ["log_analytics"] : []
    content {
      oms_agent {
        enabled                    = true
        log_analytics_workspace_id = azurerm_log_analytics_workspace.main[0].id
      }
      http_application_routing {
        enabled = false
      }
      aci_connector_linux {
        # IN GUI: Virtual Nodes: Disabled
        enabled = false
      }
    }
  }

  kubernetes_version = var.kubernetes_version

  tags = var.tags
}

resource "azurerm_log_analytics_workspace" "main" {
  count               = var.enable_log_analytics_workspace ? 1 : 0
  name                = "${var.prefix}-workspace"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.log_analytics_workspace_sku
  retention_in_days   = var.log_retention_in_days

  tags = var.tags
}

resource "azurerm_log_analytics_solution" "main" {
  count                 = var.enable_log_analytics_workspace ? 1 : 0
  solution_name         = "ContainerInsights"
  location              = var.location
  resource_group_name   = var.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.main[0].id
  workspace_name        = azurerm_log_analytics_workspace.main[0].name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ContainerInsights"
  }
}
