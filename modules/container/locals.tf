locals {
  resourceGroupName = "${var.name}-containers"
  registryName      = "${var.name}Registry"
  k8sClusterName    = "${var.name}-k8sCluster"
}

