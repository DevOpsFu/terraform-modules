resource "azurerm_dns_txt_record" "txtRecord" {
  for_each            = var.records
  zone_name           = var.zoneName
  resource_group_name = var.resourceGroupName
  ttl                 = var.ttl
  name                = each.key

  dynamic "record" {
    for_each = each.value
    content {
      value = record.value
    }
  }
}

