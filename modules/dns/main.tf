module "dnsZone" {
  source            = "../../resources/azurerm/dns/zone"
  zoneName          = var.dnsZone["zoneName"]
  resourceGroupName = var.resourceGroupName
}

module "aRecords" {
  source            = "../../resources/azurerm/dns/aRecord"
  zoneName          = module.dnsZone.name
  resourceGroupName = var.resourceGroupName
  records           = var.dnsZone["aRecords"]
}

module "cnameRecords" {
  source            = "../../resources/azurerm/dns/cnameRecord"
  zoneName          = module.dnsZone.name
  resourceGroupName = var.resourceGroupName
  records           = var.dnsZone["cnameRecords"]
}

module "txtRecords" {
  source            = "../../resources/azurerm/dns/txtRecord"
  zoneName          = module.dnsZone.name
  resourceGroupName = var.resourceGroupName
  records           = var.dnsZone["txtRecords"]
}

