resource "azurerm_dns_a_record" "aRecord" {
  for_each            = var.records
  zone_name           = var.zoneName
  resource_group_name = var.resourceGroupName
  ttl                 = var.ttl
  name                = each.key
  records             = each.value
}

