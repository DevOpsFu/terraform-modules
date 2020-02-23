output host {
  value = azurerm_kubernetes_cluster.kubernetesCluster.kube_config.0.host
}

output clientKey {
  value = azurerm_kubernetes_cluster.kubernetesCluster.kube_config.0.client_key
}

output clientCertificate {
  value = azurerm_kubernetes_cluster.kubernetesCluster.kube_config.0.client_certificate
}

output clusterCaCertificate {
  value = azurerm_kubernetes_cluster.kubernetesCluster.kube_config.0.cluster_ca_certificate
}
