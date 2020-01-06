module "resourceGroup" {
  source   = "../../resources/base/resourceGroup"
  name     = var.resourceGroupName
  location = var.location
}

module "mariadbServer" {
  source            = "../../resources/database/mariadb/server"
  name              = var.name
  location          = var.location
  resourceGroupName = module.resourceGroup.name
  serverConfig      = var.serverConfig
  sku               = var.sku
  storageProfile    = var.storageProfile
}
