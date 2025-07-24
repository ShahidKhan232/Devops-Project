# 🚀 Deploy Django App on AWS with ECS & ECR

This project demonstrates how to **Dockerize** a Django application and deploy it to **Amazon Web Services (AWS)** using:

- 🐳 Docker
- 🏷️ Amazon ECR (Elastic Container Registry)
- ☁️ Amazon ECS (Elastic Container Service)
- 💻 EC2 (for container host)

---

## ✅ Prerequisites

- AWS Account
- AWS CLI installed (`aws configure`)
- Docker installed and running
- Git installed

---

## 🔧 Step-by-Step Deployment

### 1️⃣ Clone the Repo

```bash
git clone https://github.com/ShahidKhan232/Devops-Project.git
cd DevOps-Projects/Project 5- Django app Deployment using ECS
```

### 2️⃣ Build Docker Image

```bash
docker build -t hello-world-django-app:latest .
```

### 3️⃣ Push Image to Amazon ECR

#### a. Create ECR Repository

```bash
aws ecr create-repository \
    --repository-name hello-world-django-app \
    --region us-east-1
```

#### b. Authenticate Docker to AWS

```bash
aws ecr get-login-password --region us-east-1 | \
    docker login --username AWS --password-stdin <aws_account_id>.dkr.ecr.us-east-1.amazonaws.com
```

#### c. Tag and Push Docker Image

```bash
docker tag hello-world-django-app:latest <aws_account_id>.dkr.ecr.us-east-1.amazonaws.com/hello-world-django-app
docker push <aws_account_id>.dkr.ecr.us-east-1.amazonaws.com/hello-world-django-app
```

### 4️⃣ Create ECS Cluster

1. Go to AWS Console → ECS → Clusters → Create Cluster
2. Select **EC2 Linux + Networking**
3. Name your cluster (e.g., `django-cluster`)
4. Choose instance type (`t2.micro`)
5. Select a key pair for SSH (optional)
6. Enable Container Insights (optional)

### 5️⃣ Register ECS Task Definition

1. ECS → Task Definitions → Create new
2. Launch type: EC2
3. Add container:
   - Image: `716375850707.dkr.ecr.us-east-1.amazonaws.com/hello-world-django-app`
   - Port mapping: `8000`
4. Set memory (e.g., `512 MiB`)
5. Save

### 6️⃣ Create ECS Service

1. ECS → Clusters → Services → Create
2. Launch type: EC2
3. Choose task definition and cluster
4. Set desired count = 1
5. Deploy service

### 7️⃣ Configure EC2 Security Group

1. Go to EC2 → Instances → Select the instance
2. Security Groups → Edit Inbound Rules
3. Add rule:
   - Type: Custom TCP
   - Port: `8000`
   - Source: Anywhere (0.0.0.0/0)

### 8️⃣ Test the Deployment

Find the **Public DNS or IP** of the EC2 instance and open:

```
http://<public-dns>:8000
```

You should see your Django app running!


## 🧠 Troubleshooting

- **No container running?**
  - Check ECS → Tasks → Events or Logs
  - Ensure the EC2 instance is registered to ECS

- **Stuck in "PROVISIONING"?**
  - EC2 instance might not be ECS-optimized

- **Can't access app?**
  - Check port 8000 is allowed in security group
  - Make sure EC2 has a public IP

---

## ✅ To-Do / Improvements

- Add RDS for production-grade DB
- Use Application Load Balancer with SSL (HTTPS)
- Add CI/CD via GitHub Actions or CodePipeline
- Switch to **Fargate** for serverless container hosting

---

## ⭐ Support

If this helped you, please ⭐ star the repo and share it with your network!