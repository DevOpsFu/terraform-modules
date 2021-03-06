module "resourceGroup" {
  source   = "../../resources/azurerm/base/resourceGroup"
  name     = var.resourceGroupName
  location = var.location
}

module "mariadbServer" {
  source            = "../../resources/azurerm/database/mariadb/server"
  name              = var.name
  location          = var.location
  resourceGroupName = module.resourceGroup.name
  skuName           = var.skuName
  serverConfig      = var.serverConfig
  storageProfile    = var.storageProfile
}

