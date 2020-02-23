data "helm_repository" "linkerd" {
  name = "linkerd"
  url  = "https://helm.linkerd.io/stable"
}

resource "helm_release" "linkerd" {
  name       = "linkerd"
  repository = data.helm_repository.linkerd.metadata[0].name
  chart      = "linkerd/linkerd2"

  set {
    name  = "global.identityTrustAnchorsPEM"
    value = var.identityTrustAnchorCert
  }

  set {
    name  = "identity.issuer.crtExpiry"
    value = var.identityIssuerCertExpiry
  }

  set {
    name  = "identity.issuer.tls.crtPEM"
    value = var.identityIssuerCert
  }

  set {
    name  = "identity.issuer.tls.keyPEM"
    value = var.identityIssuerCertKey
  }
}
