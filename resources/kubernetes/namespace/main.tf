resource kubernetes_namespace namespace {
  for_each = var.namespaces

  metadata {
    name        = each.key
    annotations = each.value["annotations"]
  }
}
