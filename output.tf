output "resource_group_name" {
  value = azurerm_resource_group.resource.name
}

output "client_id" {
  description = "The application id of AzureAD application created."
  value       = module.Serviceprincipal.client_id
}

output "client_secret" {
  description = "Password for the service principal"
  value       = module.Serviceprincipal.client_secret
  sensitive   = true
}
