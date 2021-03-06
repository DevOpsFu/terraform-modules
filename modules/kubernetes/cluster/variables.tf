variable "name" {
}

variable "resourceGroupName" {
}

variable "location" {
}

variable "defaultNodePool" {
  type = object({
    name         = string,
    nodeCount    = number,
    vmSize       = string,
    vnetSubnetId = string
  })
}

variable "servicePrincipal" {
  type = object({
    clientId     = string,
    clientSecret = string
  })
}

variable "networkProfile" {
  type = map
}

variable "windowsProfile" {
  type = object({
    adminUsername = string,
    adminPassword = string
  })
}

variable "namespaces" {
  type = map(object({
    annotations = map(string),
    labels      = map(string)
  }))
}
