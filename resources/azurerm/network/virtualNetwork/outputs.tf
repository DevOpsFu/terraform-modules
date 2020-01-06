output "subnetIds" {
  value = zipmap(azurerm_virtual_network.virtualNetwork.subnet[*].name, azurerm_virtual_network.virtualNetwork.subnet[*].id)
}
