module "dnsZone" {
  source            = "../../resources/dns/zone"
  zoneName          = var.dnsZone["zoneName"]
  resourceGroupName = var.resourceGroupName
}

module "aRecords" {
  source            = "../../resources/dns/aRecord"
  zoneName          = module.dnsZone.name
  resourceGroupName = var.resourceGroupName
  records           = var.dnsZone["aRecords"]
}

module "cnameRecords" {
  source            = "../../resources/dns/cnameRecord"
  zoneName          = module.dnsZone.name
  resourceGroupName = var.resourceGroupName
  records           = var.dnsZone["cnameRecords"]
}

module "txtRecords" {
  source            = "../../resources/dns/txtRecord"
  zoneName          = module.dnsZone.name
  resourceGroupName = var.resourceGroupName
  records           = var.dnsZone["txtRecords"]
}

