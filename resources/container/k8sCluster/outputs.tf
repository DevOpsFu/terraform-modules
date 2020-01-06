output "kube_config" {
  value = azurerm_kubernetes_cluster.k8sCluster.kube_config_raw
}