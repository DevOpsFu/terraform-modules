output host {
  value = module.kubernetesCluster.host
}

output clientKey {
  value = module.kubernetesCluster.clientKey
}

output clientCertificate {
  value = module.kubernetesCluster.clientCertificate
}

output clusterCaCertificate {
  value = module.kubernetesCluster.clusterCaCertificate
}

output kubeConfigRaw {
  value = module.kubernetesCluster.kubeConfigRaw
}
