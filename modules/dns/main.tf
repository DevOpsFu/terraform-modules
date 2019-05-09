module "resourceGroup" {
  source   = "../../resources/base/resourceGroup"
  name     = "${var.zoneName}"
  location = "${var.location}"
}

module "dnsZone" {
  source            = "../../resources/dns/zone"
  name              = "${var.zoneName}"
  resourceGroupName = "${module.resourceGroup.name}"
}

module "aRecords" {
  source            = "../../resources/dns/aRecord"
  zoneName          = "${module.dnsZone.name}"
  resourceGroupName = "${module.resourceGroup.name}"
  records           = "${var.aRecords}"
}

module "cnameRecords" {
  source            = "../../resources/dns/cnameRecord"
  zoneName          = "${module.dnsZone.name}"
  resourceGroupName = "${module.resourceGroup.name}"
  records           = "${var.cnameRecords}"
}

module "txtRecords" {
  source            = "../../resources/dns/txtRecord"
  zoneName          = "${module.dnsZone.name}"
  resourceGroupName = "${module.resourceGroup.name}"
  records           = "${var.txtRecords}"
}
