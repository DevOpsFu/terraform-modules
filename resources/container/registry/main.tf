resource "azurerm_container_registry" "containerRegistry" {
  name                = "${var.name}"
  resource_group_name = "${var.resourceGroupName}"
  location            = "${var.location}"
  sku                 = "${var.sku}"
  admin_enabled       = "${var.adminEnabled}"
}
