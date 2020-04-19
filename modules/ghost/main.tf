data "azurerm_mariadb_server" "mariadbServer" {
  name                = var.mariadbServerName
  resource_group_name = var.mariadbResourceGroupName
}

module "k8sExternalName" {
  source = "../../resources/kubernetes/externalNameService"
  externalNameServices = {
    "mariadb" = {
      fqdn        = data.azurerm_mariadb_server.mariadbServer.fqdn,
      namespace   = var.namespace,
      annotations = var.mariadbAnnotations,
      labels      = var.mariadbLabels
    }
  }
}

resource "azurerm_mariadb_database" "ghost" {
  name                = "devopsfu_ghost"
  resource_group_name = var.mariadbResourceGroupName
  server_name         = var.mariadbServerName
  charset             = "utf8"
  collation           = "utf8_general_ci"
}


module "ghostHelmRelease" {
  source          = "../../resources/helm/release/ghost"
  namespace       = var.namespace
  mariadbUsername = "${data.azurerm_mariadb_server.mariadbServer.administrator_login}@${var.mariadbServerName}"
  mariadbPassword = var.mariadbPassword
  mariadbDatabase = azurerm_mariadb_database.ghost.name
}
