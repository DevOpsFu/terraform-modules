variable keyAlgorithm {
  type = string
}

variable ecdsaCurve {
  type    = string
  default = null
}

variable rsaBits {
  type    = number
  default = null
}

variable caKeyAlgorithm {
  type = string
}

variable caPrivateKeyPem {
  type = string
}

variable caCertPem {
  type = string
}

variable validityPeriodHours {
  type = number
}

variable isCaCertificate {
  type    = bool
  default = null
}

variable allowedUses {
  type    = list(string)
  default = []
}

variable subject {
  type = object({
    commonName         = string
    organization       = string
    organizationalUnit = string
    steetAddress       = list(string)
    locality           = string
    province           = string
    country            = string
    postalCode         = string
    serialNumber       = string
  })
}
