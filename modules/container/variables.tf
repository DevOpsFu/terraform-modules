variable "name" {
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
