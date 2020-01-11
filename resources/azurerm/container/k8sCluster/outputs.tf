output host {
  value = azurerm_kubernetes_cluster.k8sCluster.kube_config.0.host
}

output clientKey {
  value = azurerm_kubernetes_cluster.k8sCluster.kube_config.0.client_key
}

output clientCertificate {
  value = azurerm_kubernetes_cluster.k8sCluster.kube_config.0.client_certificate
}

output clusterCaCertificate {
  value = azurerm_kubernetes_cluster.k8sCluster.kube_config.0.cluster_ca_certificate
}
