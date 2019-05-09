resource "azurerm_dns_a_record" "aRecord" {
  count               = "${length(keys(var.records))}"
  zone_name           = "${var.zoneName}"
  resource_group_name = "${var.resourceGroupName}"
  ttl                 = "${var.ttl}"
  name                = "${element(keys(var.records), count.index)}"
  records             = ["${element(values(var.records), count.index)}"]
}
