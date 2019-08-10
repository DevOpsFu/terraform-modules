resource "azurerm_dns_txt_record" "txtRecord" {
  count               = length(keys(var.records))
  zone_name           = var.zoneName
  resource_group_name = var.resourceGroupName
  ttl                 = var.ttl
  name                = element(keys(var.records), count.index)

  record {
    value = element(values(var.records), count.index)
  }
}

