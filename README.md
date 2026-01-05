# Terraform + Ansible Multi-Environment Automation

## 📌 Overview
This project demonstrates end-to-end DevOps automation using **Terraform** and **Ansible** to provision and configure **Dev, Staging, and Production** environments on AWS.

The infrastructure is created using Infrastructure as Code (IaC) principles and configured using Ansible roles.

---

## 🏗️ Architecture diagram
<img width="835" height="618" alt="image" src="https://github.com/user-attachments/assets/cdd5d44c-1469-4677-85e5-b17ff43459ee" />

---

## ⚙️ Tools & Technologies
- Terraform
- Ansible
- AWS EC2
- Bash scripting
- Git & GitHub

---

⚙️ Infrastructure Provisioning with Terraform
1️⃣ Initialize Terraform
terraform init:
![alt text](image.png)

2️⃣ Review the Execution Plan
terraform plan:
![alt text](image-1.png)


3️⃣ Apply Infrastructure
terraform apply:
![alt text](image-2.png)


You can see below that all instance , buckets ,dynamodb are running or created , which is created through Terraform :

![alt text](image-3.png)
![alt text](image-4.png)
![alt text](image-5.png)
![alt text](image-6.png)

🔁 Dynamic Inventory with Ansible
The update_inventories.sh script:

Reads Terraform outputs

Automatically updates Ansible inventories for:
dev
stg
prod

7️⃣ Ansible Role Creation

Initialized an Nginx role using Ansible Galaxy

Created reusable tasks for:

Installing Nginx

Starting and enabling service

Deploying a custom web page

8️⃣ Configuration Management

Ran Ansible playbooks for each environment:

Dev

Staging

Production

Ensured consistent configuration across all EC2 instances




---

## 🚀 How It Works

### 1️⃣ Provision Infrastructure


