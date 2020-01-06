output "login_server" {
  value = azurerm_container_registry.containerRegistry.login_server
}

output "admin_username" {
  value = azurerm_container_registry.containerRegistry.admin_username
}

output "admin_password" {
  value = azurerm_container_registry.containerRegistry.admin_password
}
