data "helm_repository" "linkerd" {
  name = "linkerd"
  url  = "https://helm.linkerd.io/stable"
}

resource "helm_release" "linkerd" {
  name       = "linkerd"
  repository = data.helm_repository.linkerd.metadata[0].name
  chart      = "linkerd/linkerd2"

  set {
    name  = "Identity.TrustAnchorsPEM"
    value = var.identityTrustAnchorCert
  }

  set {
    name  = "Identity.Issuer.CrtExpiry"
    value = var.identityIssuerCertExpiry
  }

  set {
    name  = "Identity.Issuer.TLS.CrtPEM"
    value = var.identityIssuerCert
  }

  set {
    name  = "Identity.Issuer.TLS.KeyPEM"
    value = var.identityIssuerCertKey
  }
}
