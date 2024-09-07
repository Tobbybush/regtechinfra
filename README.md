# regtechinfra
## TASK 
* Design and deploy a secure and scalable cloud infrastructure.
* Implement CI/CD pipelines to support continuous deployment.
* Ensure the environment is compliant with industry standards (e.g., GDPR, PCI-DSS).
* Monitor and manage the infrastructure effectively.


## Project Overview
This project demonstrates the complete setup of a Kubernetes-based application infrastructure using **Terraform**, **Docker**, and **GitHub Actions**. The infrastructure is deployed across three environments (development, staging, and production) and includes:
- **CI/CD pipeline** for automated  deployments.
- **Security best practices** (encryption, RBAC, compliance with GDPR and PCI-DSS).
- **Monitoring and logging** using **Prometheus** and **Grafana** respectively.

## Tools
- **Terraform**: Infrastructure as Code (IaC) tool to provision Kubernetes infrastructure.
- **Kubernetes**: Orchestration platform to manage containerized applications.
- **Docker**: Containerization of the application.
- **GitHub Actions**: CI/CD tool to automate the build, testing, and deployment process.
- **Prometheus and Grafana**: Monitoring and logging tools.
- **AWS**: Cloud provider for deploying Kubernetes clusters and infrastructure components.

## CI/CD Pipeline
The CI/CD pipeline is implemented using GitHub Actions, it is triggered by on push respective environment and consists of the following stages:
- **Build Stage**: Builds a Docker image of the application and pushes it to Docker
- **Security Scan**: Identify known vulnerabilities in the application and its dependencies.
- **Deployment Stage**: Deploys the application to Kubernetes clusters in dev, stage, and prod environments based on the branch.
- **Rollback Mechanism**: In case of a deployment failure in production, the pipeline automatically triggers a rollback using kubectl rollout undo.

## Security and Compliance
**Encryption**
- **Data at Rest**: All sensitive data are stored in AWS EBS volumes and encrypted using AWS KMS (Key Management Service).
- **Data in Transit**: TLS encryption is enabled for all application traffic to ensure secure communication.

## Monitoring and Logging
Prometheus and Grafana are used to monitor the health of the application and infrastructure. The monitoring setup includes dashboards for key metrics like:
- **CPU usage**
- **Memory usage**
- **Pod availability**
- **network usage**
- **service health**

To access the dashboards:
Prometheus is available at http://<prometheus-url>:9090.
Grafana is available at http://<grafana-url>:3000.

Key Decisions
1. **Choice of Tools**
- Terraform was chosen for its vast support across multiple cloud providers and modular design.
- Kubernetes was selected for its flexibility, scalability, and native support for container orchestration.
- GitHub Actions was used to simplify CI/CD integration directly within the GitHub ecosystem, reducing external dependencies.
2. **Security**
- Encryption Overhead: Enabling encryption for all storage volumes and communication ensures data security.
- Monitoring Costs: Running Prometheus and Grafana in the cloud incurs additional costs for storage and compute resources, but provides comprehensive monitoring capabilities.
3. **Rollback Strategy**
The decision to implement a rollback strategy in production ensures high availability