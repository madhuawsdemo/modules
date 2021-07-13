provider "kubernetes" {
  config_path    = var.config_path
  config_context = var.config_context
}

resource "kubernetes_namespace" "k8s_ns" {
  count = length(var.namespace_names)
  metadata {
    name = var.namespace_names[count.index]
  }
}
