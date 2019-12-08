variable "name" {
}

variable "location" {
}

variable "resourceGroupName" {
}

variable "addressSpace" {
  type = "list"
}

variable "dnsServers" {
  type    = list
  default = null
}

variable "subnets" {
  type    = list(map(string))
  default = []
}