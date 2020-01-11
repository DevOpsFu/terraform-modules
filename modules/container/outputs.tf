output "registryLoginServer" {
  value = module.containerRegistry.login_server
}

output "registryAdminUsername" {
  value = module.containerRegistry.admin_username
}

output "registryAdminPassword" {
  value = module.containerRegistry.admin_password
}

output k8sHost {
  value = module.k8sCluster.host
}

output k8sClientKey {
  value = module.k8sCluster.clientKey
}

output k8sClientCertificate {
  value = module.k8sCluster.clientCertificate
}

output k8sClusterCaCertificate {
  value = module.k8sCluster.clusterCaCertificate
}

