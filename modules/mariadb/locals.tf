locals {

  externalNameServiceDef = { "mariadb" = {
    fqdn        = module.mariadbServer.fqdn,
    namespace   = var.k8sNamespace,
    annotations = var.k8sAnnotations,
    labels      = var.k8sLabels
    }
  }
  externalNameService = var.k8sRegisterExternalName ? local.externalNameServiceDef : {}
}
