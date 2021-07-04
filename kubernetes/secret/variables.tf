variable "namespace" {
  description = "List of name of the namespace"
  type        = string
}


variable "azurestorageaccountname" {
  description = "Azure Storage Account Name"
  type        = string
}


variable "azurestorageaccountkey" {
  description = "azure storage accountkey"
  type        = string
}

variable "name" {
  description = "name of the secret"
  type        = string
}

variable "type" {
  description = "type of the secret"
  type        = string
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