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

## Step 1️⃣ AWS IAM & CLI Configuration
- Created a dedicated IAM user e.g. 'terra-admin' with required permissions.
- Generated Access Key and Secret Access Key.

<img width="1897" height="800" alt="image" src="https://github.com/user-attachments/assets/6a8bfaef-8e55-4bab-bbd4-30024fa11efc" />
<img width="1899" height="778" alt="image" src="https://github.com/user-attachments/assets/41f96f47-a1a1-4cb4-8184-92667d14bd13" />

- Configured AWS CLI in VS Code terminal:
```bash
aws configure
``` 

Set:  
- Access Key
- Secret Key
- AWS Region
  
<img width="555" height="323" alt="image" src="https://github.com/user-attachments/assets/f7784c0e-aaa4-4d3c-a93a-c250b4639114" />

---

## Step 2️⃣ SSH Key Generation for EC2 Access
- Generated SSH key pair using:
```bash
ssh-keygen
```

- Public key used for EC2 access.
- Private key securely stored locally.
- Key files excluded from Git using .gitignore

---

## Step 3️⃣ Terraform Base Structure
- Created Terraform base structure under terraform/:

```text
terraform/
├── providers.tf
├── variables.tf
├── outputs.tf
├── main.tf   (used to call environment modules)
```
- 'main.tf' consists of environment-specific values like instance count and type are passed to modules.

---

## Step 4️⃣ Terraform Infrastructure Modules
Created reusable infrastructure modules inside:

---

## Step 5️⃣ Terraform Backend Configuration
---


## Step 6️⃣ Terraform Initialization & Deployment
- Initialize Terraform
```bash
terraform init
```

<img width="1145" height="744" alt="image" src="https://github.com/user-attachments/assets/2a6e5df4-9759-4602-8b24-c915d55ae55f" />

- Review the Execution Plan
```bash
terraform plan
```

<img width="1080" height="691" alt="image" src="https://github.com/user-attachments/assets/c6dd1399-a137-448a-a819-11da05e17b78" />

- Apply Infrastructure
```bash
terraform apply
```
<img width="986" height="779" alt="image" src="https://github.com/user-attachments/assets/5e18242d-69fe-4580-813f-8987e9c70bf3" />

- Result:  
✔️ S3 bucket created  
✔️ DynamoDB table created  
✔️ EC2 instances created  
✔️ Public IPs generated as outputs  

You can see below that all instance , buckets ,dynamodb are running or created , which is created through Terraform :
- EC2 instances
<img width="1916" height="480" alt="image" src="https://github.com/user-attachments/assets/4052a71e-f014-466d-830f-1fcda2e22871" />

- Volumes
<img width="1919" height="433" alt="image" src="https://github.com/user-attachments/assets/2e64c39e-2156-42f2-a209-282944291644" />

- Security groups
<img width="1906" height="251" alt="image" src="https://github.com/user-attachments/assets/4de5d98a-7cdd-472e-8856-f7fc07110d6b" />

- S3 buckets
<img width="1919" height="563" alt="image" src="https://github.com/user-attachments/assets/0c29bf9a-3494-4bdb-9371-984194ab8e7f" />

---

## Step 7️⃣ Terraform Outputs for Ansible
Terraform outputs store:  
- Public IPs
- Environment-specific instance details.
  
These outputs are consumed by Ansible for configuration management.

---

## Step 8️⃣ Dynamic Ansible Inventory Update
Moved to Ansible directory:  
```bash
cd ansible
bash update_inventories.sh
```

<img width="1025" height="682" alt="image" src="https://github.com/user-attachments/assets/b5ae463b-dd9e-44f3-8825-01e0e5258701" />

- What the Script Does:  
✔️ Reads Terraform outputs  
✔️ Automatically updates inventory files  
✔️ No manual IP handling  

- Inventories updated:  
<img width="937" height="818" alt="image" src="https://github.com/user-attachments/assets/25928f0e-5791-45c1-8d99-e2c1f4947846" />


```text
inventories/
├── dev
├── stg
├── prd
```
---

## Step 9️⃣ Configuration Management Using Ansible
- Use Ansible playbook: 'install_nginx.yml'.  

Executed per environment:  
```bash
ansible-playbook -i ansible/inventories/dev ansible/playbooks/install_nginx.yml
ansible-playbook -i ansible/inventories/stg ansible/playbooks/install_nginx.yml
ansible-playbook -i ansible/inventories/prd ansible/playbooks/install_nginx.yml
```

<img width="1740" height="205" alt="image" src="https://github.com/user-attachments/assets/e7047ad8-f4da-4998-8a66-ac5236aaa59f" />
<img width="1919" height="448" alt="image" src="https://github.com/user-attachments/assets/c9e7a8ca-7ea2-4c2d-86d3-6ad17f930a19" />

<img width="1919" height="778" alt="image" src="https://github.com/user-attachments/assets/bc195327-ca38-4b8f-a333-f69c2f607a64" />

<img width="1896" height="677" alt="image" src="https://github.com/user-attachments/assets/dac362eb-6625-482c-ac16-3a7f12b03cc9" />

- Playbook Actions:  
1️⃣ SSH connection to EC2  
2️⃣ Install Nginx  
3️⃣ Enable Nginx service  
4️⃣ Start service  
5️⃣ Ensure idempotency  

---

## Step 🔟 Verification
- Open browser and access:  

```text
http://<EC2-Public-IP>
```

<img width="1912" height="946" alt="image" src="https://github.com/user-attachments/assets/8ef74d79-935d-480f-b620-3c86e7ce9ca9" />
<img width="1911" height="972" alt="image" src="https://github.com/user-attachments/assets/b42878ce-065a-49f2-9955-fd32b58ae59d" />

- Verified Nginx page is accessible.  

---

## Step 1️⃣1️⃣ Cleanup
-Destroyed all resources:  

```bash
cd terraform
terraform destroy
```

<img width="1259" height="562" alt="image" src="https://github.com/user-attachments/assets/102a77ea-c2e5-4633-b442-0ac47f99c22d" />
<img width="1220" height="831" alt="image" src="https://github.com/user-attachments/assets/c4319d0e-43fe-4aec-8c3f-cbeb0615838a" />
<img width="1904" height="552" alt="image" src="https://github.com/user-attachments/assets/0edc42b0-92dd-4637-a7f1-e368bb29e9b0" />

✔️ Prevented unnecessary AWS cost  
✔️ Clean environment teardown  


