locals {
  encodedAuth = base64encode("${var.credentials["username"]}:${var.credentials["password"]}")

  authInfo = templatefile("${path.module}/authinfo.tpl", {
    fqdn        = var.fqdn,
    username    = var.credentials["username"],
    password    = var.credentials["password"],
    encodedAuth = local.encodedAuth
  })
}
