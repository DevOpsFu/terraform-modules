locals {
  storageAccountName = "${lower(var.appName)}"
  resourceGroupName  = "${var.orgName}-${var.appName}"
  planName           = "${var.appName}-plan"
}
