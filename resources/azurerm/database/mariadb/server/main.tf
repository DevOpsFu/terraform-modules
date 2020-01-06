resource "azurerm_mariadb_server" "mariadbServer" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resourceGroupName

  administrator_login          = var.serverConfig.administratorLogin
  administrator_login_password = var.serverConfig.administratorLoginPassword
  version                      = var.serverConfig.version
  ssl_enforcement              = var.serverConfig.sslEnforcement

  sku {
    name     = var.sku.name
    capacity = var.sku.capacity
    tier     = var.sku.tier
    family   = var.sku.family
  }

  storage_profile {
    storage_mb            = var.storageProfile.storageMb
    backup_retention_days = var.storageProfile.backupRetentionDays
    geo_redundant_backup  = var.storageProfile.geoRedundantBackup
    auto_grow             = var.storageProfile.autoGrow
  }
}
