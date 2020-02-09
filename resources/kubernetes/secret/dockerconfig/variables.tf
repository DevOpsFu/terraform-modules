
variable dockerConfigSecrets {
  type = map(object({
    metadata = object({
      annotations = map(string),
      labels      = map(string),
      namespace   = string
    })
    fqdn = string
    credentials = object({
      username = string,
      password = string
    })
  }))
  default = {}
}

/*
variable metadata {
  type = object({
    name        = string,
    annotations = map(string),
    labels      = map(string),
    namespace   = string
  })
}

variable fqdn {
  type = string
}

variable credentials {
  type = object({
    username = string,
    password = string
  })
}
*/
