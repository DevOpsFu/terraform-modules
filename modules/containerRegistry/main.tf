module "resourceGroup" {
  source   = "../../resources/base/resourceGroup"
  name     = local.resourceGroupName
  location = var.location
}

module "containerRegistry" {
  source            = "../../resources/container/registry"
  name              = var.registryName
  location          = var.location
  resourceGroupName = module.resourceGroup.name
  sku               = var.sku
  adminEnabled      = var.adminEnabled
}

