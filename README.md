# Azure Infrastructure for Bank of Anthos

[![Terraform](https://img.shields.io/badge/Terraform-1.x-purple?logo=terraform)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/Azure-AKS-blue?logo=microsoftazure)](https://azure.microsoft.com/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

Production-grade Azure infrastructure to deploy Google's [Bank of Anthos](https://github.com/GoogleCloudPlatform/bank-of-anthos) microservices application on Azure Kubernetes Service (AKS).

This repository provisions the core Azure platform layer — resource group, networking, identity, security, and AKS. While the Kubernetes manifests for Bank of Anthos are applied after cluster creation.

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

    ├── backend.tf          
    ├── provider.tf         
    ├── main.tf            
    ├── variables.tf        
    ├── outputs.tf          
    ├── resource-rg.tf      
    └── modules/
        ├── aks/            
        ├── keyvault/       
        └── serviceprincipal/ 



👤 Author
Moshood (moshstaq)

GitHub: @moshstaq
LinkedIn: moshstaq
