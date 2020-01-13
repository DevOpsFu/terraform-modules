resource "kubernetes_service" "externalNameService" {
  for_each = var.externalNameServices

  metadata {
    name        = each.key
    namespace   = each.value["namespace"]
    annotations = each.value["annotations"]
    labels      = each.value["labels"]
  }

  spec {
    external_name = each.value["fqdn"]
    type          = "ExternalName"
  }
}
