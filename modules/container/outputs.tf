output "registryLoginServer" {
  value = module.containerRegistry.login_server
}

output "registryAdminUsername" {
  value = module.containerRegistry.admin_username
}

output "registryAdminPassword" {
  value = module.containerRegistry.admin_password
}

output "subnetIds" {
  value = module.virtualNetwork.subnetIds
}
