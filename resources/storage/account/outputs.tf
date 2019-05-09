output "primaryConnectionString" {
  value = "${azurerm_storage_account.storageAccount.primary_connection_string}"
}
