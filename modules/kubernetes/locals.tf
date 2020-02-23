locals {
  nodeResourceGroup = "${var.name}-nodepools"

  networkProfile  = merge(local.networkProfile_defaults, var.networkProfile)
  defaultNodePool = merge(local.nodePool_defaults, var.defaultNodePool)

  networkProfile_defaults = {
    networkPlugin    = null
    networkPolicy    = null
    dnsServiceIp     = null
    dockerBridgeCidr = null
    serviceCidr      = null
  }
  nodePool_defaults = {
    name         = null
    nodeCount    = null
    vmSize       = null
    vnetSubnetId = null
  }
}

