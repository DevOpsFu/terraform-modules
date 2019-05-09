resource "azurerm_dns_cname_record" "cnameRecord" {
  count               = "${length(keys(var.records))}"
  zone_name           = "${var.zoneName}"
  resource_group_name = "${var.resourceGroupName}"
  ttl                 = "${var.ttl}"
  name                = "${element(keys(var.records), count.index)}"
  record              = "${element(values(var.records), count.index)}"
}
