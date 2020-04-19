data "helm_repository" "bitnami" {
  name = "bitnami"
  url  = "https://charts.bitnami.com/bitnami"
}

resource "helm_release" "ghost" {
  name       = "ghost"
  repository = data.helm_repository.bitnami.metadata[0].name
  chart      = "bitnami/ghost"
  namespace  = var.namespace

  set {
    name  = "ghostHost"
    value = "www.devopsfu.com"
  }

  set {
    name  = "service.type"
    value = "ClusterIP"
  }

  set {
    name  = "mariadb.enabled"
    value = false
  }

  set {
    name  = "persistence.enabled"
    value = false
  }

  set {
    name  = "externalDatabase.host"
    value = var.mariadbDnsName
  }

  set {
    name  = "externalDatabase.database"
    value = var.mariadbDatabase
  }

  set {
    name  = "externalDatabase.user"
    value = var.mariadbUsername
  }

  set {
    name  = "externalDatabase.password"
    value = var.mariadbPassword
  }

}
