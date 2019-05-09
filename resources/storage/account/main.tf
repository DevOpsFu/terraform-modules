resource "azurerm_storage_account" "storageAccount" {
  name                     = "${var.name}"
  resource_group_name      = "${var.resourceGroupName}"
  location                 = "${var.location}"
  account_tier             = "${var.tier}"
  account_replication_type = "${var.replicationType}"
}