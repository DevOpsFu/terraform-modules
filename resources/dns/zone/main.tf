resource "azurerm_dns_zone" "dnsDomain" {
  name                = var.name
  resource_group_name = var.resourceGroupName
}

