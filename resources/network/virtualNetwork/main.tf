resource "azurerm_virtual_network" "virtualNetwork" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resourceGroupName
  address_space       = var.addressSpace
  dns_servers         = var.dnsServers

  dynamic "subnet" {
    for_each = var.subnets
    content {
      name           = subnet.value.name
      address_prefix = subnet.value.addressPrefix
    }
  }
}