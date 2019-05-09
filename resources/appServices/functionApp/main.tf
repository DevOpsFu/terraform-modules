resource "azurerm_function_app" "functionApp" {
  name                      = "${var.name}"
  location                  = "${var.location}"
  resource_group_name       = "${var.resourceGroupName}"
  app_service_plan_id       = "${var.appServicePlanId}"
  storage_connection_string = "${var.storageConnectionString}"
  version                   = "${var.runtimeVersion}"
  app_settings              = "${var.appSettings}"
}
