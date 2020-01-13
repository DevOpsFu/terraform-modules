variable "name" {
}

variable "resourceGroupName" {
}

variable "location" {
}

variable "registrySku" {
}

variable "registryAdminEnabled" {
}

variable "k8sDefaultNodePool" {
  type = object({
    name         = string,
    nodeCount    = number,
    vmSize       = string,
    vnetSubnetId = string
  })
}

variable "k8sServicePrincipal" {
  type = object({
    clientId     = string,
    clientSecret = string
  })
}

variable "k8sNetworkProfile" {
  type = map
}

variable "k8sNamespaces" {
  type = map(object({
    annotations = map(string),
    labels      = map(string)
  }))
}

variable "virtualNetwork" {
  type = object({
    addressSpace = list(string),
    dnsServers   = list(string),
    subnets      = list(map(string))
  })
}
