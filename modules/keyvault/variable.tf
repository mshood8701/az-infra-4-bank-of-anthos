variable "keyvault_name" {
  type    = string
  default = "kororo-key"

}

variable "location" {
  type    = string
  default = "eastus"
}

variable "resource_group" {
  type = string

}

variable "service_principal" {
  type = string

}

variable "service_principal_object_id" {}
variable "service_principal_tenant_id" {}
