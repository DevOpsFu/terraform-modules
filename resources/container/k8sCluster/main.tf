resource "azurerm_kubernetes_cluster" "k8sCluster" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resourceGroupName
  dns_prefix          = var.dnsPrefix
  node_resource_group = var.nodeResourceGroup

  network_profile {
    network_plugin     = var.networkProfile.networkPlugin
    network_policy     = var.networkProfile.networkPolicy
    dns_service_ip     = var.networkProfile.dnsServiceIp
    docker_bridge_cidr = var.networkProfile.dockerBridgeCidr
    service_cidr       = var.networkProfile.serviceCidr
  }

  default_node_pool {
    name           = var.defaultNodePool.name
    node_count     = var.defaultNodePool.nodeCount
    vm_size        = var.defaultNodePool.vmSize
    vnet_subnet_id = var.defaultNodePool.vnetSubnetId
  }

  service_principal {
    client_id     = var.servicePrincipal.clientId
    client_secret = var.servicePrincipal.clientSecret
  }
}

/*

output "client_certificate" {
  value = "${azurerm_kubernetes_cluster.test.kube_config.0.client_certificate}"
}

output "kube_config" {
  value = "${azurerm_kubernetes_cluster.test.kube_config_raw}"
}

*/
