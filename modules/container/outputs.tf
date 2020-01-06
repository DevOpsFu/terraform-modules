output "registryLoginServer" {
  value = module.containerRegistry.login_server
}

output "registryAdminUsername" {
  value = module.containerRegistry.admin_username
}

output "registryAdminPassword" {
  value = module.containerRegistry.admin_password
}

output "kubeConfig" {
  value = module.k8sCluster.kube_config
}

/*
output "subnetIds" {
  value = module.virtualNetwork.subnetIds
}
*/
