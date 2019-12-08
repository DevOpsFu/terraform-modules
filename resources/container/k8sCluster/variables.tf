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
    name      = string,
    nodeCount = number,
    vmSize    = string
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

variable "servicePrincipal" {
  type = object({
    clientId     = string,
    clientSecret = string
  })
}
