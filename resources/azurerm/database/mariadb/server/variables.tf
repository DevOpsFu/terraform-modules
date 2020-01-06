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

