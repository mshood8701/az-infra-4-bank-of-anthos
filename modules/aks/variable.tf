variable "resource_group" {
  type    = string
  default = "aks"
}

variable "location" {
  default = "westus"
}


variable "service_principal_name" {
  type = string

}


variable "client_id" {}
variable "client_secret" {
  type      = string
  sensitive = true
}
