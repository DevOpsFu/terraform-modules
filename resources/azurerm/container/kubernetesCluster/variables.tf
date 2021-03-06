variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "resourceGroupName" {
  type = string
}

variable "dnsPrefix" {
  type = string
}

variable "defaultNodePool" {
  type = object({
    name         = string,
    nodeCount    = number,
    vmSize       = string,
    vnetSubnetId = string
  })
}

variable "nodeResourceGroup" {
  type = string
}

variable "networkProfile" {
  type = object({
    networkPlugin    = string,
    networkPolicy    = string,
    dnsServiceIp     = string,
    dockerBridgeCidr = string,
    serviceCidr      = string
  })
}

variable "windowsProfile" {
  type = object({
    adminUsername = string,
    adminPassword = string
  })
}

variable "servicePrincipal" {
  type = object({
    clientId     = string,
    clientSecret = string
  })
}
