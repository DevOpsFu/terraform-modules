module "resourceGroup" {
  source   = "../../resources/azurerm/base/resourceGroup"
  name     = var.resourceGroupName
  location = var.location
}

module "containerRegistry" {
  source            = "../../resources/azurerm/container/registry"
  name              = var.name
  location          = var.location
  resourceGroupName = module.resourceGroup.name
  sku               = var.sku
  adminEnabled      = var.adminEnabled
}
