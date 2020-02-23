resource "kubernetes_network_policy" "example" {
  metadata {
    name      = "terraform-example-network-policy"
    namespace = "default"
  }

  spec {
    pod_selector {}

    ingress {
      from {
        namespace_selector {
          match_labels = {
            "linkerd.io/is-control-plane" = "true"
          }
        }
        pod_selector {}
      }
    }

    egress {}

    policy_types = ["Ingress", "Egress"]
  }
}

