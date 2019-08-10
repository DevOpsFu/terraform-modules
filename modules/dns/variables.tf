variable "zoneName" {
  type = string
}

variable "cnameRecords" {
  type    = map(string)
  default = {}
}

variable "aRecords" {
  type    = map(list(string))
  default = {}
}

variable "txtRecords" {
  type    = map(string)
  default = {}
}

variable "location" {
  type = string
}

