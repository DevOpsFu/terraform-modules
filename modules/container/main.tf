module "resourceGroup" {
  source   = "../../resources/azurerm/base/resourceGroup"
  name     = var.resourceGroupName
  location = var.location
}

module "containerRegistry" {
  source            = "../../resources/azurerm/container/registry"
  name              = local.registryName
  location          = var.location
  resourceGroupName = module.resourceGroup.name
  sku               = var.registrySku
  adminEnabled      = var.registryAdminEnabled
}

module "k8sCluster" {
  source            = "../../resources/azurerm/container/k8sCluster"
  name              = local.k8sClusterName
  location          = var.location
  resourceGroupName = module.resourceGroup.name
  dnsPrefix         = var.name
  nodeResourceGroup = local.k8sNodeResourceGroup
  defaultNodePool   = local.k8sDefaultNodePool
  networkProfile    = local.k8sNetworkProfile
  servicePrincipal  = var.k8sServicePrincipal
}

module "k8sNamespaces" {
  source     = "../../resources/kubernetes/namespace"
  namespaces = var.k8sNamespaces
}

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

