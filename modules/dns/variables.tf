variable "zoneName" {}

variable "cnameRecords" {
  type    = "map"
  default = {}
}

variable "aRecords" {
  type    = "map"
  default = {}
}

variable "txtRecords" {
  type    = "map"
  default = {}
}

variable "location" {}
