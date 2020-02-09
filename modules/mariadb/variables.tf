variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "resourceGroupName" {
  type = string
}

variable "serverConfig" {
  type = object({
    administratorLogin         = string,
    administratorLoginPassword = string,
    version                    = string,
    sslEnforcement             = string
  })
}

variable "sku" {
  type = object({
    name     = string,
    capacity = string,
    tier     = string,
    family   = string
  })
}

variable "storageProfile" {
  type = object({
    storageMb           = number,
    backupRetentionDays = number,
    geoRedundantBackup  = string,
    autoGrow            = string
  })
}

variable "k8sRegisterExternalName" {
  type    = bool
  default = false
}

variable "k8sNamespace" {
  type    = string
  default = null
}

variable "k8sAnnotations" {
  type    = map(string)
  default = {}
}

variable "k8sLabels" {
  type    = map(string)
  default = {}
}
