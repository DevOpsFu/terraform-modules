resource "azurerm_app_service_plan" "servicePlan" {
  name                = "${var.name}"
  location            = "${var.location}"
  resource_group_name = "${var.resourceGroupName}"
  kind                = "${var.kind}"

  sku {
    tier = "${var.tier}"
    size = "${var.size}"
  }
}
