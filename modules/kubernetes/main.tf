module "resourceGroup" {
  source   = "../../resources/azurerm/base/resourceGroup"
  name     = var.resourceGroupName
  location = var.location
}

module "kubernetesCluster" {
  source            = "../../resources/azurerm/container/kubernetesCluster"
  name              = var.name
  location          = var.location
  resourceGroupName = module.resourceGroup.name
  dnsPrefix         = var.name
  nodeResourceGroup = local.nodeResourceGroup
  defaultNodePool   = local.defaultNodePool
  networkProfile    = local.networkProfile
  servicePrincipal  = var.servicePrincipal
}

module "kubernetesNamespaces" {
  source     = "../../resources/kubernetes/namespace"
  namespaces = var.namespaces
}

/*
module "registrySecret" {
  source = "../../resources/kubernetes/secret/dockerconfig"
  dockerConfigSecrets = {
    devopsfu = {
      metadata = {
        annotations = {}
        labels      = {}
        namespace   = "ghost"
      }
      fqdn = module.containerRegistry.login_server
      credentials = {
        username = module.containerRegistry.admin_username
        password = module.containerRegistry.admin_password
      }
    }
  }
}
*/

module "linkerdTrustAnchorCert" {
  source              = "../../resources/tls/selfSignedCert"
  keyAlgorithm        = "ECDSA"
  ecdsaCurve          = "P256"
  validityPeriodHours = 87600
  isCaCertificate     = true
  allowedUses         = ["crl_signing", "cert_signing", "server_auth", "client_auth"]

  subject = {
    commonName         = "identity.linkerd.cluster.local"
    organization       = null
    organizationalUnit = null
    steetAddress       = null
    locality           = null
    province           = null
    country            = null
    postalCode         = null
    serialNumber       = null
  }
}

module "linkerdIssuerCert" {
  source              = "../../resources/tls/locallySignedCert"
  keyAlgorithm        = "ECDSA"
  ecdsaCurve          = "P256"
  validityPeriodHours = 43800
  isCaCertificate     = true
  caKeyAlgorithm      = module.linkerdTrustAnchorCert.keyAlgorithm
  caPrivateKeyPem     = module.linkerdTrustAnchorCert.privateKeyPem
  caCertPem           = module.linkerdTrustAnchorCert.certPem
  allowedUses         = ["crl_signing", "cert_signing", "server_auth", "client_auth"]

  subject = {
    commonName         = "identity.linkerd.cluster.local"
    organization       = null
    organizationalUnit = null
    steetAddress       = null
    locality           = null
    province           = null
    country            = null
    postalCode         = null
    serialNumber       = null
  }
}

module "linkerdHelmRelease" {
  source                   = "../../resources/helm/release/linkerd"
  identityTrustAnchorCert  = module.linkerdTrustAnchorCert.certPem
  identityIssuerCertExpiry = module.linkerdIssuerCert.validityEndTime
  identityIssuerCert       = module.linkerdIssuerCert.certPem
  identityIssuerCertKey    = module.linkerdIssuerCert.privateKeyPem
}

