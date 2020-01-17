resource kubernetes_secret "secret" {

  metadata {
    name        = var.metadata["name"]
    annotations = var.metadata["annotations"]
    labels      = var.metadata["labels"]
    namespace   = var.metadata["namespace"]
  }

  data = {
    ".dockerconfigjson" = local.authInfo
  }

  type = "kubernetes.io/dockerconfigjson"
}
