resource "azurerm_dns_zone" "dnsDomain" {
  name                = var.zoneName
  resource_group_name = var.resourceGroupName
}

