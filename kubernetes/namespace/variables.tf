variable "namespace_names" {
  description = "List of name of the namespace"
  type        = list
}


variable "host" {
  description = "K8S Host Name"
  type        = string
}


variable "client_certificate" {
  description = "K8S Cluster Client Certificate"
  type        = string
}

variable "client_key" {
  description = "K8S Cluster Client Key"
  type        = string
}


variable "cluster_ca_certificate" {
  description = "K8S Cluster Client Certificate CA"
  type        = string
}

/*
variable "load_config_file" {
  description = "K8S Cluster Config File Load"
  type        = bool
  default     = false
}
*/