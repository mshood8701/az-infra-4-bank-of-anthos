# Azure Infrastructure for Bank of Anthos

[![Terraform](https://img.shields.io/badge/Terraform-1.x-purple?logo=terraform)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/Azure-AKS-blue?logo=microsoftazure)](https://azure.microsoft.com/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

Production-grade Azure infrastructure to deploy Google's [Bank of Anthos](https://github.com/GoogleCloudPlatform/bank-of-anthos) microservices application on Azure Kubernetes Service (AKS).

This repository provisions the core Azure platform layer — resource group, networking, identity, security, and AKS — while Kubernetes manifests for Bank of Anthos are applied after cluster creation.

---

## 🏗️ Architecture

![Architecture Diagram](docs/architecture.png)

| Component | Purpose |
|-----------|---------|
| **AKS Cluster** | Hosts Bank of Anthos microservices |
| **Azure Key Vault** | Stores secrets and certificates securely |
| **Service Principal** | Provides RBAC-based authentication |
| **Virtual Network** | Network isolation and security |

---

## 🚀 Features

- **Infrastructure as Code** — Fully automated deployment using Terraform
- **Modular Design** — AKS, Key Vault, and Service Principal are isolated into reusable modules.
- **Secure Identity & Access** — Service Principal with role-based access control (RBAC).
- **Secrets Management** — Azure Key Vault for sensitive configuration data.
- **Network Security** — Virtual network with subnet segmentation
- **Scalability** — Cluster autoscaler enabled for dynamic workloads
- - **State Management** - Remote backend configuration for Terraform state.

---

## 📋 Prerequisites

| Tool | Version | Installation |
|------|---------|--------------|
| Azure CLI | v2.50+ | [Install Guide](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) |
| Terraform | v1.0+ | [Download](https://www.terraform.io/downloads) |
| kubectl | Latest | [Install Guide](https://kubernetes.io/docs/tasks/tools/) |
| Azure Subscription | — | Owner/Contributor access required |

---

## 📁 Project Structure
az-infra-4-bank-of-anthos/
├── backend.tf          # Terraform backend (remote state)
├── provider.tf         # Azure provider configuration
├── main.tf             # Root module wiring
├── variables.tf        # Input variables
├── outputs.tf          # Output values
├── resource-rg.tf      # Resource Group definition
└── modules/
    ├── aks/            # AKS module
    ├── keyvault/       # Azure Key Vault module
    └── serviceprincipal/ # Service Principal & RBAC

## ⚡ Quick Start

### 1. Clone the repository

bash
git clone https://github.com/moshstaq/az-infra-4-bank-of-anthos.git
cd az-infra-4-bank-of-anthos 
### 2. Authenticate with Azure
az login
az account set --subscription "<YOUR_SUBSCRIPTION_ID>"
### 3. Initialize Terraform
terraform init
### 4. Configure variables
Create a terraform.tfvars file:
resource_group_name = "rg-bank-of-anthos"
location            = "uksouth"
aks_cluster_name    = "aks-bank-of-anthos"
node_count          = 3
vm_size             = "Standard_D2s_v3"
### 5. Deploy infrastructure
terraform plan -out=tfplan
terraform apply tfplan
### 6. Connect to AKS
az aks get-credentials --resource-group rg-bank-of-anthos --name aks-bank-of-anthos
kubectl get nodes
### 7. Deploy Bank of Anthos
kubectl apply -f k8s/bank-of-anthos/
### 8. 🧹 Cleanup
terraform destroy

👤 Author
Moshood (moshstaq)

GitHub: @moshstaq
LinkedIn: moshstaq
