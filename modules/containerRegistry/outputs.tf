output "loginServer" {
  value = module.containerRegistry.login_server
}

output "adminUsername" {
  value = module.containerRegistry.admin_username
}

output "adminPassword" {
  value = module.containerRegistry.admin_password
}
