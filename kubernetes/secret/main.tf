provider "kubernetes" {
  host                   = var.host
  client_certificate     = base64decode(var.client_certificate)
  client_key             = base64decode(var.client_key)
  cluster_ca_certificate = base64decode(var.cluster_ca_certificate)
  //load_config_file       = var.load_config_file
}

resource "kubernetes_secret" "main" {
  metadata {
    name = var.name
    namespace = var.namespace
  }

  data = {
    azurestorageaccountname = var.azurestorageaccountname
    azurestorageaccountkey = var.azurestorageaccountkey
  }

  type = var.type
}