output "name" {
  value = kubernetes_namespace.k8s_ns[0].metadata.0.name
}