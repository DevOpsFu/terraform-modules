resource "azurerm_dns_cname_record" "cnameRecord" {
  for_each            = var.records
  zone_name           = var.zoneName
  resource_group_name = var.resourceGroupName
  ttl                 = var.ttl
  name                = each.key
  record              = each.value
}

