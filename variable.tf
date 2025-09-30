variable "resource" {
  type        = string
  description = "resource group name"
  default     = "aks-webapp2"

}

variable "location" {
  type    = string
  default = "eastus"
}

variable "service_principal_name" {
  type    = string
  default = "azure-spn"
}

variable "keyvault_name" {
  type    = string
  default = "key-vault"
}

variable "SUB_ID" {
  type    = string
  default = "d277e2ff-ef0c-495f-92de-938e9c7fb6ff"
}
