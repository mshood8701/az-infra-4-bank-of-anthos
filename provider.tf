terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.8.0"
    }
  }

  required_version = ">=1.9.0"
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = false
    }

  }

  subscription_id = "d277e2ff-ef0c-495f-92de-938e9c7fb6ff"
}

provider "azuread" {

}
