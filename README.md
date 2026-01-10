##Azure Infrastructure for Bank of Anthos
Overview
This repository contains Infrastructure as Code (IaC) for deploying the Bank of Anthos application on Microsoft Azure. Bank of Anthos is a sample banking application that demonstrates modern microservices architecture patterns.

#Architecture
The infrastructure provisions the necessary Azure resources to host and run the Bank of Anthos microservices application, including compute, networking, storage, and database components.

Prerequisites
Azure CLI installed and configured
Terraform (if using Terraform-based deployment)
An active Azure subscription
Appropriate Azure RBAC permissions to create resources


1. # Getting Started
-Clone the Repository
-git clone https://github.com/moshstaq/az-infra-4-bank-of-anthos.git
-cd az-infra-4-bank-of-anthos
2. # Configure Azure Credentials
-az login
-az account set --subscription "<YOUR_SUBSCRIPTION_ID>"
3. # Deploy Infrastructure
4. # Initialize and apply infrastructure
terraform init
terraform plan
terraform apply
### Repository Structure
├── modules/          
├── environments/     
├── scripts/          
└── README.md
