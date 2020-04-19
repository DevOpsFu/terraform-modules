variable "namespace" {
  type    = string
  default = null
}

variable "mariadbServerName" {
  type = string
}

variable "mariadbResourceGroupName" {
  type = string
}

variable "mariadbAnnotations" {
  type    = map(string)
  default = {}
}

variable "mariadbLabels" {
  type    = map(string)
  default = {}
}

variable "mariadbPassword" {
  type = string
}
