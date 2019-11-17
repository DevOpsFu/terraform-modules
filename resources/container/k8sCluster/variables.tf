variable "name" {
}

variable "location" {
}

variable "resourceGroupName" {
}

variable "dnsPrefix" {
}

variable "agentPoolProfiles" {
  type = "list"
}

variable "networkProfile" {
  type = "map"

}

variable "servicePrincipal" {
  type = "map"
}
