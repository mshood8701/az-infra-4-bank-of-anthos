data "azurerm_kubernetes_service_versions" "current" {
  location        = var.location
  include_preview = false
}

resource "tls_private_key" "aks_ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}


resource "azurerm_kubernetes_cluster" "aks-cluster" {
  name                = "app-aks-cluster"
  location            = var.location
  resource_group_name = var.resource_group
  dns_prefix          = "${var.resource_group}-cluster"
  kubernetes_version  = data.azurerm_kubernetes_service_versions.current.latest_version
  node_resource_group = "${var.resource_group}-nrg"

  default_node_pool {
    name    = "defaultpool"
    vm_size = "Standard_A2_v2"
    #zones                = [1, 2, 3]
    auto_scaling_enabled = true
    max_count            = 3
    min_count            = 1
    os_disk_size_gb      = 30
    type                 = "VirtualMachineScaleSets"
    node_labels = {
      "nodepool-type" = "system"
      "environment"   = "prod"
      "nodepoolos"    = "linux"
    }


    tags = {
      "nodepool-type" = "system"
      "environment"   = "prod"
      "nodepoolos"    = "linux"
    }

  }

  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }

  linux_profile {
    admin_username = "ubuntu"
    ssh_key {
      key_data = tls_private_key.aks_ssh.public_key_openssh
    }
  }

  network_profile {
    network_plugin    = "azure"
    load_balancer_sku = "standard"
  }


}
