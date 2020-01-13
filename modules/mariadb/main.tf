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
  serverConfig      = var.serverConfig
  sku               = var.sku
  storageProfile    = var.storageProfile
}

module "k8sExternalName" {
  source               = "../../resources/kubernetes/externalNameService"
  externalNameServices = local.externalNameService
}
