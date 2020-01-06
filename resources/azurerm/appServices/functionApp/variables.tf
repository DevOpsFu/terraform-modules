variable "name" {
}

variable "resourceGroupName" {
}

variable "location" {
}

variable "appServicePlanId" {
}

variable "storageConnectionString" {
}

variable "runtimeVersion" {
}

variable "appSettings" {
  type    = map(string)
  default = {}
}

