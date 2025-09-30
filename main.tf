resource "azurerm_resource_group" "resource" {
  name     = var.resource
  location = var.location
}

module "Serviceprincipal" {
  source                 = "./modules/Serviceprincipal"
  service_principal_name = var.service_principal_name

  depends_on = [azurerm_resource_group.resource]
}

resource "azurerm_role_assignment" "roleSp" {
  scope                = "/subscriptions/${var.SUB_ID}"
  role_definition_name = "Contributor"
  principal_id         = module.Serviceprincipal.service_principal_object_id

  depends_on = [module.Serviceprincipal]
}

module "keyvault" {
  source                      = "./modules/keyvault"
  keyvault_name               = var.keyvault_name
  location                    = var.location
  resource_group              = var.resource
  service_principal           = var.service_principal_name
  service_principal_object_id = module.Serviceprincipal.service_principal_object_id
  service_principal_tenant_id = module.Serviceprincipal.service_principal_tenant_id

  depends_on = [module.Serviceprincipal]
}

resource "azurerm_key_vault_secret" "secret" {
  name         = module.Serviceprincipal.client_id
  value        = module.Serviceprincipal.client_secret
  key_vault_id = module.keyvault.keyvault_id

  depends_on = [module.keyvault]
}

module "aks" {
  source                 = "./modules/aks"
  service_principal_name = var.service_principal_name
  client_id              = module.Serviceprincipal.client_id
  client_secret          = module.Serviceprincipal.client_secret
  location               = var.location
  resource_group         = var.resource

  depends_on = [module.Serviceprincipal]
}

resource "local_file" "kubeconfig" {
  depends_on = [module.aks]
  filename   = "./kubeconfig"
  content    = module.aks.config
}
