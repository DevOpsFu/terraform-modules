variable "name" {
}

variable "location" {
}

variable "resourceGroupName" {
}

variable "addressSpace" {
  type = list(string)
}

variable "dnsServers" {
  type    = list(string)
  default = null
}

variable "subnets" {
  type    = list(map(string))
  default = []
}