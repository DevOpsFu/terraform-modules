resource "azurerm_kubernetes_cluster" "k8sCluster" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resourceGroupName
  dns_prefix          = var.dnsPrefix

  network_profile {
    network_plugin     = var.networkProfile.networkPlugin
    network_policy     = var.networkProfile.networkPolicy
    dns_service_ip     = var.networkProfile.dnsServiceIp
    docker_bridge_cidr = var.networkProfile.dockerBridgeCidr
    service_cidr       = var.networkProfile.serviceCidr
  }

  dynamic "agent_pool_profile" {
    for_each = var.agentPoolProfiles
    content {
      name            = agent_pool_profile.value.name
      count           = agent_pool_profile.value.count
      vm_size         = agent_pool_profile.value.vmSize
      os_type         = agent_pool_profile.value.osType
      os_disk_size_gb = agent_pool_profile.value.osDiskSizeGb
    }
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
