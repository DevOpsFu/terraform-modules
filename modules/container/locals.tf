locals {
  registryName         = var.name
  k8sClusterName       = var.name
  k8sNetworkProfile    = merge(local.k8sNetworkProfile_defaults, var.k8sNetworkProfile)
  k8sNodeResourceGroup = "${var.name}-nodepools"
  k8sNetworkProfile_defaults = {
    networkPlugin    = null
    networkPolicy    = null
    dnsServiceIp     = null
    dockerBridgeCidr = null
    serviceCidr      = null
  }

}

