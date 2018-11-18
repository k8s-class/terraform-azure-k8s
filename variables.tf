variable "client_id" {default = ""}
variable "client_secret" {default = ""}

variable "agent_count" {
    default = 3
}

variable "ssh_public_key" {
    default = "~/.ssh/id_rsa.pub"
}

variable "dns_prefix" {
    default = "Epick8s"
}

variable "cluster_name" {
    default = "Epick8s"
}

variable "resource_group_name" {
    default = "Epick8s"
}

variable "location" {
    default = "Central US"
}

variable "k8s_version" {
  description = "Version of Kubernetes to use"
  default = "1.11.4"
}

