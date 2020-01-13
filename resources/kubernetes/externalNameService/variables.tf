variable externalNameServices {
  type = map(object({
    fqdn        = string,
    namespace   = string,
    annotations = map(string),
    labels      = map(string)
  }))
}
