# Deploying 2048 Game App on Amazon EKS

This project demonstrates how to deploy the classic 2048 game as a containerized application on Amazon Elastic Kubernetes Service (EKS) using Terraform for infrastructure provisioning and Kubernetes manifests for application deployment.

## Project Structure

- **eks-terraform/**: Contains Terraform scripts to provision EKS cluster and related AWS resources.
  - `main.tf`: Main Terraform configuration for EKS, IAM roles, and networking.
  - `variable.tf`: Input variables for Terraform.
  - `outputs.tf`: Outputs such as cluster name and load balancer hostname.
  - `provider.tf`: Provider configuration for AWS and Kubernetes.
  - `k8_resourcses.tf`: Kubernetes resources (Pod and Service) managed via Terraform.
- **kubernetes/**: Contains Kubernetes YAML manifests for manual deployment.
  - `2048-pod.yaml`: Pod definition for the 2048 game container.
  - `mygame-svc.yaml`: Service definition to expose the 2048 game via a LoadBalancer.

## Prerequisites
- AWS account with sufficient permissions
- [Terraform](https://www.terraform.io/) installed
- [kubectl](https://kubernetes.io/docs/tasks/tools/) installed
- [AWS CLI](https://aws.amazon.com/cli/) configured

## Steps to Deploy

### 1. Provision EKS Cluster with Terraform
```powershell
cd eks-terraform
terraform init
terraform apply
```
- This will create the EKS cluster, node group, and necessary IAM roles.

### 2. Configure kubectl
After Terraform completes, update your kubeconfig:
```powershell
aws eks --region <your-region> update-kubeconfig --name <cluster_name>
```
- Replace `<your-region>` and `<cluster_name>` with your values (see Terraform output).

### 3. Deploy the 2048 Game
You can deploy using either Terraform-managed resources or raw Kubernetes manifests.

#### Option A: Using Terraform (already applied)
- The Pod and Service are created by Terraform (`k8_resourcses.tf`).

#### Option B: Using Kubernetes YAML
```powershell
kubectl apply -f ../kubernetes/2048-pod.yaml
kubectl apply -f ../kubernetes/mygame-svc.yaml
```

### 4. Access the Game
- Get the external LoadBalancer hostname:
```powershell
kubectl get svc mygame-svc
```
- Open the EXTERNAL-IP in your browser to play 2048.

## Clean Up
To destroy all resources:
```powershell
terraform destroy
```

## Notes
- The `.terraform/` directory is excluded from version control via `.gitignore`.
- Do not commit Terraform provider binaries or state files to git.

---

Enjoy playing 2048 on your own EKS cluster!
