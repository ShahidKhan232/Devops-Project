# DevOps Project-12: Deployment of Super Mario on Kubernetes using Terraform

[![GitHub](https://img.shields.io/badge/GitHub-Repository-blue?logo=github)](https://github.com/NotHarshhaa/Deployment-of-super-Mario-on-Kubernetes-using-terraform)
[![AWS](https://img.shields.io/badge/AWS-EKS-orange?logo=amazonaws)](https://aws.amazon.com/eks/)
[![Terraform](https://img.shields.io/badge/Terraform-Infrastructure-purple?logo=terraform)](https://terraform.io/)
[![Kubernetes](https://img.shields.io/badge/Kubernetes-Orchestration-blue?logo=kubernetes)](https://kubernetes.io/)

## 📌 Project Overview

This project demonstrates the deployment of the classic Super Mario game on AWS Elastic Kubernetes Service (EKS) using Terraform for infrastructure automation. The project showcases modern DevOps practices by combining Infrastructure as Code (IaC), containerization, and Kubernetes orchestration to create a scalable, cloud-native gaming experience.

### Main Goals and Objectives

- **Cloud-Native Deployment**: Deploy a containerized application on AWS EKS
- **Infrastructure Automation**: Use Terraform to provision and manage AWS resources
- **DevOps Best Practices**: Implement GitOps workflow with Infrastructure as Code
- **Scalability**: Leverage Kubernetes for automatic scaling and high availability
- **Learning Experience**: Provide hands-on experience with modern DevOps tools and practices

## 📸 Screenshots

Below are screenshots demonstrating the deployment and running of Super Mario on Kubernetes using Terraform:

![Super Mario Screenshot 1](image%201.png)
![Super Mario Screenshot 2](image%202.png)
![Super Mario Screenshot 3](image%203.png)
![Super Mario Screenshot 4](image%204.png)
![Super Mario Screenshot 5](image%205.png)

## 🛠️ Methodology

The project follows a systematic approach to deploy the Super Mario game on Kubernetes:

### Technologies and Tools Used

- **Cloud Provider**: Amazon Web Services (AWS)
- **Container Orchestration**: Kubernetes (AWS EKS)
- **Infrastructure as Code**: Terraform
- **Containerization**: Docker
- **Compute**: AWS EC2
- **Load Balancing**: AWS Application Load Balancer
- **Version Control**: Git/GitHub
- **Command Line Tools**: AWS CLI, kubectl

### Implementation Steps

1. **Environment Setup**: Configure EC2 instance with required tools
2. **IAM Configuration**: Create and attach necessary IAM roles for EC2
3. **Infrastructure Provisioning**: Use Terraform to create EKS cluster and supporting resources
4. **Application Deployment**: Deploy Super Mario game using Kubernetes manifests
5. **Service Exposure**: Configure load balancer for external access
6. **Cleanup**: Destroy infrastructure to avoid unnecessary costs

## 📁 Project Structure

```
Deployment-of-super-Mario-on-Kubernetes-using-terraform/
├── eks-terraform/
│   ├── backend.tf          # Terraform backend configuration
│   ├── main.tf             # Main Terraform configuration
│   └──variables.tf        # Variable definitions
│   
├── deployment.yaml         # Kubernetes deployment manifest
├── service.yaml           # Kubernetes service manifest
└── README.md              # Project documentation

```

### Key Configuration Files

- **backend.tf**: Configures Terraform state storage in S3
- **deployment.yaml**: Defines the Super Mario application deployment
- **service.yaml**: Exposes the application through a LoadBalancer service
- **IAM Role**: Provides necessary permissions for EC2 to manage AWS resources

## ✅ Key Features and Outcomes

### Main Accomplishments

- **Automated Infrastructure Provisioning**: Complete AWS EKS cluster setup using Terraform
- **Kubernetes Orchestration**: Scalable container deployment with automatic load balancing
- **Containerized Application**: Dockerized Super Mario game for consistent deployment
- **High Availability**: AWS Load Balancer ensures robust access to the application
- **Infrastructure as Code**: Version-controlled, reproducible infrastructure setup
- **Cost Optimization**: Easy cleanup process to prevent unnecessary AWS charges

### Notable Features

- **One-Click Deployment**: Automated setup with minimal manual intervention
- **Scalable Architecture**: Kubernetes enables horizontal scaling based on demand
- **Cloud-Native Design**: Fully leverages AWS managed services
- **Security Best Practices**: IAM roles and policies for secure resource access
- **GitOps Workflow**: Infrastructure and application code stored in version control

## 🚀 Installation and Usage

### Prerequisites

- AWS Account with appropriate permissions
- Basic understanding of AWS, Terraform, and Kubernetes concepts
- Terminal/Command line access

### Dependencies and Requirements

- AWS CLI
- Terraform
- kubectl
- Docker
- Git

### Step-by-Step Installation

#### Step 1: Initial Setup

1. Launch an AWS EC2 instance (Ubuntu/Amazon Linux)
2. Configure security groups to allow HTTP/HTTPS traffic
3. Connect to the instance via SSH

```bash
sudo su
apt update -y
```

#### Step 2: Install Required Tools

**Install Docker:**
```bash
apt install docker.io -y
usermod -aG docker $USER
newgrp docker
```

**Install Terraform:**
```bash
sudo apt install wget -y
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform -y
```

**Install AWS CLI:**
```bash
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo apt-get install unzip -y
unzip awscliv2.zip
sudo ./aws/install
```

**Install kubectl:**
```bash
sudo apt install curl -y
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
```

#### Step 3: Configure IAM Role

1. Create an IAM role for EC2 with AdministratorAccess policy
2. Attach the role to your EC2 instance
3. This allows EC2 to manage AWS resources on your behalf

#### Step 4: Deploy Infrastructure

```bash
# Clone the repository
mkdir super_mario && cd super_mario
git clone https://github.com/ShahidKhan232/Deployment-of-super-Mario-on-Kubernetes-using-terraform
cd Deployment-of-super-Mario-on-Kubernetes-using-terraform/eks-terraform

# Configure backend (edit backend.tf with your S3 bucket details)
vim backend.tf

# Initialize and deploy infrastructure
terraform init
terraform validate
terraform plan
terraform apply --auto-approve

# Update kubeconfig
aws eks update-kubeconfig --name EKS_CLOUD --region us-east-1
```

#### Step 5: Deploy Application

```bash
# Navigate to application manifests
cd ..

# Deploy the Super Mario game
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml

# Check deployment status
kubectl get all

# Get load balancer URL
kubectl describe service mario-service
```

#### Step 6: Access the Game

Copy the Load Balancer Ingress URL from the service description and paste it into your web browser to play Super Mario!

![Super Mario Screenshot 1](image%201.png)

### Cleanup Instructions

To avoid unnecessary AWS charges:

```bash
# Delete Kubernetes resources
kubectl delete service mario-service
kubectl delete deployment mario-deployment

# Destroy infrastructure
cd eks-terraform
terraform destroy --auto-approve

# Terminate EC2 instance manually from AWS Console
```


## 📄 License

This project is open-source and available under the MIT License. See the LICENSE file for more details.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

### How to Contribute

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request



*This project demonstrates the power of modern DevOps practices by combining Infrastructure as Code, containerization, and cloud-native technologies to create scalable and maintainable applications.*