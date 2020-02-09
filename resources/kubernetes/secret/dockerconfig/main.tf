resource kubernetes_secret "secret" {
  for_each = var.dockerConfigSecrets

  metadata {
    name        = each.key
    annotations = each.value.metadata["annotations"]
    labels      = each.value.metadata["labels"]
    namespace   = each.value.metadata["namespace"]
  }

  data = {
    ".dockerconfigjson" = templatefile("${path.module}/authinfo.tpl", {
      fqdn        = each.value["fqdn"],
      username    = each.value.credentials["username"],
      password    = each.value.credentials["password"],
      encodedAuth = base64encode("${each.value.credentials["username"]}:${each.value.credentials["password"]}")
    })
  }

  type = "kubernetes.io/dockerconfigjson"
}
