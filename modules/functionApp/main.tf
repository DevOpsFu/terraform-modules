module "resourceGroup" {
  source   = "../../resources/base/resourceGroup"
  name     = local.resourceGroupName
  location = var.location
}

module "storageAccount" {
  source            = "../../resources/storage/account"
  name              = local.storageAccountName
  resourceGroupName = module.resourceGroup.name
  location          = var.location
  tier              = "Standard"
  replicationType   = "GRS"
}

module "servicePlan" {
  source            = "../../resources/appServices/servicePlan"
  name              = local.planName
  resourceGroupName = module.resourceGroup.name
  location          = var.location
  kind              = "FunctionApp"
  tier              = "Dynamic"
  size              = "Y1"
}

module "functionApp" {
  source                  = "../../resources/appServices/functionApp"
  name                    = var.appName
  resourceGroupName       = module.resourceGroup.name
  location                = var.location
  appServicePlanId        = module.servicePlan.id
  storageConnectionString = module.storageAccount.primaryConnectionString
  runtimeVersion          = "~2"
  appSettings             = var.appSettings
}

