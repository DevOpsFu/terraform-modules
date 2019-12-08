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
    name      = string,
    nodeCount = number,
    vmSize    = string
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
