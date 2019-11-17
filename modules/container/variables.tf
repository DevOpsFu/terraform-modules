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

variable "k8sAgentPoolProfiles" {
  type = list
}

variable "k8sServicePrincipal" {
  type = "map"
}

variable "k8sNetworkProfile" {
  type = "map"
}
