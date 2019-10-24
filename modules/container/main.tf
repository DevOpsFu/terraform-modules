module "resourceGroup" {
  source   = "../../resources/base/resourceGroup"
  name     = local.resourceGroupName
  location = var.location
}

module "containerRegistry" {
  source            = "../../resources/container/registry"
  name              = local.registryName
  location          = var.location
  resourceGroupName = module.resourceGroup.name
  sku               = var.registrySku
  adminEnabled      = var.registryAdminEnabled
}

module "k8sCluster" {
  source            = "../../resources/container/k8sCluster"
  name              = local.k8sClusterName
  location          = var.location
  resourceGroupName = module.resourceGroup.name
  dnsPrefix         = var.name
  agentPoolProfiles = var.k8sAgentPoolProfiles
  servicePrincipal  = var.k8sServicePrincipal
}
