# ☁️ Phase 8 — Cloud & DevOps Basics (Weeks 21–26)

> **Goal:** Take everything you've learned and apply it in the real cloud — where production servers actually live.  
> Learn AWS, CI/CD pipelines, Infrastructure as Code, and monitoring.

---

## 📌 Table of Contents

- [Topic 1 — What is Cloud Computing?](#-topic-1-what-is-cloud-computing)
- [Topic 2 — Cloud Providers Overview](#-topic-2-cloud-providers-overview)
- [Topic 3 — AWS Core Services](#-topic-3-aws-core-services)
- [Topic 4 — Spinning Up an EC2 Instance](#-topic-4-spinning-up-an-ec2-instance-aws)
- [Topic 5 — S3 Object Storage](#-topic-5-s3--object-storage)
- [Topic 6 — CI/CD with GitHub Actions](#-topic-6-cicd--github-actions)
- [Topic 7 — Infrastructure as Code with Terraform](#-topic-7-infrastructure-as-code--terraform)
- [Topic 8 — Monitoring with Grafana & Prometheus](#-topic-8-monitoring--grafana--prometheus)
- [Topic 9 — DigitalOcean — Beginner Friendly Cloud](#-topic-9-digitalocean--beginner-friendly-cloud)
- [Phase 8 Checklist](#-phase-8-checklist)
- [Phase 8 Hands-On Tasks](#-phase-8-hands-on-tasks)
- [Resources](#-resources-for-phase-8)

---

## 📖 Topic 1: What is Cloud Computing?

Before cloud, companies bought physical servers, placed them in data centers, and paid teams to maintain them. That was expensive, slow, and painful.

**Cloud computing** means renting computing resources — servers, storage, databases, networking — on demand from a provider.

```
Before Cloud:                          After Cloud:
  Buy server → Wait 2 weeks             Click button → Server ready in 60 seconds
  Pay $5,000 upfront                    Pay $5/month, cancel anytime
  Hire team to maintain hardware        Provider handles all the hardware
  Hard to scale up or down              Scale instantly with one API call
```

### Cloud Service Models

| Model | You Manage | Provider Manages | Example |
|-------|-----------|-----------------|---------|
| **IaaS** — Infrastructure as a Service | OS, apps, data | Hardware, networking | AWS EC2, DigitalOcean Droplets |
| **PaaS** — Platform as a Service | Apps, data only | OS, runtime, hardware | Heroku, Railway |
| **SaaS** — Software as a Service | Nothing | Everything | Gmail, Slack, Notion |

> 💡 As a server engineer, you'll mostly work with **IaaS** — renting raw servers and managing everything yourself.

---

## 📖 Topic 2: Cloud Providers Overview

| Provider | Best For | Free Tier |
|----------|---------|----------|
| **AWS** (Amazon) | Enterprise, widest service range | 12 months free tier |
| **Google Cloud (GCP)** | Machine learning, Kubernetes | $300 free credit |
| **Microsoft Azure** | Enterprise, Windows workloads | $200 free credit |
| **DigitalOcean** | Developers, simplicity | $200 free credit |
| **Linode / Akamai** | Simple VPS, affordability | $100 free credit |
| **Vultr** | Fast global VPS | $100 free credit |

> 💡 **Start with DigitalOcean** — it's the simplest and most beginner-friendly. Then learn AWS as it's the industry standard.

---

## 📖 Topic 3: AWS Core Services

AWS has 200+ services. Here are the ones you'll actually use day to day.

### Compute

```
EC2 — Elastic Compute Cloud
  → Virtual servers in the cloud
  → Equivalent to a VPS / your own Linux server
  → Use for: running apps, databases, anything custom

Lambda
  → Serverless functions — run code without managing servers
  → Pay only when code runs (billed per millisecond)
  → Use for: APIs, event processing, scheduled tasks
```

### Storage

```
S3 — Simple Storage Service
  → Object storage — store any file (images, videos, backups, static sites)
  → Virtually unlimited capacity
  → Very cheap (~$0.023 per GB/month)
  → Use for: user uploads, static assets, database backups

EBS — Elastic Block Store
  → Block storage that attaches to EC2 instances
  → Works like a hard drive for your server
  → Use for: OS storage, database files on EC2
```

### Networking

```
VPC — Virtual Private Cloud
  → Your own private network inside AWS
  → Isolates your resources from other AWS customers

Route 53
  → AWS's DNS service
  → Register and manage domain names
  → Route traffic to your servers intelligently

CloudFront
  → CDN — Content Delivery Network
  → Caches your content at edge locations worldwide
  → Makes sites load faster for users globally
```

### Database

```
RDS — Relational Database Service
  → Managed PostgreSQL, MySQL, MariaDB, etc.
  → AWS handles backups, patches, and failover automatically

ElastiCache
  → Managed Redis or Memcached
  → Drop-in replacement for self-hosted Redis
```

---

## 📖 Topic 4: Spinning Up an EC2 Instance (AWS)

```
Step 1 → Log into the AWS Console
Step 2 → Navigate to EC2 → Launch Instance
Step 3 → Choose AMI: Ubuntu 24.04 LTS
Step 4 → Choose instance type: t2.micro (free tier eligible)
Step 5 → Create or select a key pair (SSH key)
Step 6 → Configure Security Group — open ports 22, 80, 443
Step 7 → Click Launch!
```

### Connect to Your EC2 Instance

```bash
# Set correct permissions on your downloaded .pem key (required!)
chmod 400 mykey.pem

# Connect via SSH using the key
ssh -i mykey.pem ubuntu@your-ec2-public-ip

# Or using the public DNS name
ssh -i mykey.pem ubuntu@ec2-xx-xx-xx-xx.compute-1.amazonaws.com
```

### AWS CLI — Control AWS from the Terminal

```bash
# Install AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# Configure with your IAM credentials
aws configure
# AWS Access Key ID:     [from IAM console]
# AWS Secret Access Key: [from IAM console]
# Default region:        us-east-1
# Default output format: json

# List EC2 instances
aws ec2 describe-instances

# List S3 buckets
aws s3 ls

# Upload a file to S3
aws s3 cp myfile.txt s3://mybucket/

# Download a file from S3
aws s3 cp s3://mybucket/myfile.txt ./
```

---

## 📖 Topic 5: S3 — Object Storage

**S3** is one of AWS's most-used services. Store any file and serve it globally at massive scale.

### Basic S3 Operations

```bash
# Create a bucket (bucket names must be globally unique)
aws s3 mb s3://my-unique-bucket-name

# Upload a single file
aws s3 cp photo.jpg s3://my-bucket/photos/photo.jpg

# Upload an entire folder
aws s3 sync ./dist s3://my-bucket/

# Download a file
aws s3 cp s3://my-bucket/photo.jpg ./

# List bucket contents
aws s3 ls s3://my-bucket/

# Delete a file
aws s3 rm s3://my-bucket/photo.jpg

# Make a file publicly accessible
aws s3 cp photo.jpg s3://my-bucket/ --acl public-read
```

### S3 for Static Website Hosting

```bash
# Enable static website hosting on the bucket
aws s3 website s3://mybucket/ \
  --index-document index.html \
  --error-document error.html

# Sync your built React or HTML site to S3
aws s3 sync ./build s3://mybucket/ --delete

# Your site is now live at:
# http://mybucket.s3-website-us-east-1.amazonaws.com
```

### S3 for Automated Database Backups

```bash
# Backup PostgreSQL and stream directly to S3
pg_dump mydb | gzip | aws s3 cp - s3://my-backups/pg_$(date +%Y%m%d).sql.gz

# Download and restore from S3
aws s3 cp s3://my-backups/pg_20260219.sql.gz - | gunzip | psql mydb
```

---

## 📖 Topic 6: CI/CD — GitHub Actions

**CI/CD** (Continuous Integration / Continuous Deployment) automatically tests and deploys your code every time you push to Git — no manual steps needed.

```
You push code to GitHub
        ↓
GitHub Actions triggers automatically
        ↓
  ┌─────────────────────┐
  │  CI Pipeline:       │
  │  1. Install deps    │
  │  2. Run tests       │
  │  3. Build app       │
  └─────────┬───────────┘
            │ (only if all steps pass)
            ↓
  ┌─────────────────────┐
  │  CD Pipeline:       │
  │  1. SSH to server   │
  │  2. Pull latest code│
  │  3. Install deps    │
  │  4. Reload PM2      │
  └─────────────────────┘
        ↓
App is updated live — automatically! 🚀
```

### Basic GitHub Actions Workflow

```bash
# Create the workflow directory in your project
mkdir -p .github/workflows
nano .github/workflows/deploy.yml
```

```yaml
name: Deploy to Production

on:
  push:
    branches: [ main ]          # Triggers on every push to main

jobs:
  deploy:
    runs-on: ubuntu-latest

    steps:
      # Step 1: Check out the repository code
      - name: Checkout code
        uses: actions/checkout@v3

      # Step 2: Set up the correct Node.js version
      - name: Setup Node.js
        uses: actions/setup-node@v3
        with:
          node-version: '18'

      # Step 3: Install dependencies
      - name: Install dependencies
        run: npm install

      # Step 4: Run the test suite
      - name: Run tests
        run: npm test

      # Step 5: SSH into server and deploy
      - name: Deploy to server
        uses: appleboy/ssh-action@master
        with:
          host: ${{ secrets.SERVER_HOST }}
          username: ${{ secrets.SERVER_USER }}
          key: ${{ secrets.SERVER_SSH_KEY }}
          script: |
            cd /home/user/myapp
            git pull origin main
            npm install --production
            pm2 reload myapp
```

### Setting Up GitHub Secrets

```
GitHub Repo → Settings → Secrets and Variables → Actions → New Secret

Required secrets:
  SERVER_HOST     →  your-server-ip-address
  SERVER_USER     →  ubuntu
  SERVER_SSH_KEY  →  (paste the full contents of your private SSH key)
```

### CI/CD with Docker

```yaml
name: Build and Deploy with Docker

on:
  push:
    branches: [ main ]

jobs:
  build-and-deploy:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v3

      - name: Build Docker image
        run: docker build -t myapp:${{ github.sha }} .

      - name: Push to Docker Hub
        run: |
          echo "${{ secrets.DOCKER_PASSWORD }}" | \
            docker login -u "${{ secrets.DOCKER_USERNAME }}" --password-stdin
          docker push myapp:${{ github.sha }}

      - name: Deploy to server
        uses: appleboy/ssh-action@master
        with:
          host: ${{ secrets.SERVER_HOST }}
          username: ${{ secrets.SERVER_USER }}
          key: ${{ secrets.SERVER_SSH_KEY }}
          script: |
            docker pull myapp:${{ github.sha }}
            docker stop myapp || true
            docker rm myapp   || true
            docker run -d --name myapp -p 3000:3000 myapp:${{ github.sha }}
```

---

## 📖 Topic 7: Infrastructure as Code — Terraform

**Terraform** lets you define your entire cloud infrastructure in code and create it all with a single command.

```
Without Terraform:                  With Terraform:
  Click through AWS Console           Write code once in .tf files
  Manually create each resource       Run: terraform apply
  Hard to reproduce later             Identical infrastructure every time
  Easy to misconfigure                Version controlled in Git
  No audit trail                      Full history of every change
```

### Install Terraform

```bash
wget -O- https://apt.releases.hashicorp.com/gpg | \
  sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
  https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
  sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update && sudo apt install terraform

# Verify
terraform --version
```

### Basic Terraform — Create an EC2 Instance

```hcl
# main.tf

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# Security group — control inbound/outbound traffic
resource "aws_security_group" "web" {
  name = "web-sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 instance
resource "aws_instance" "myserver" {
  ami           = "ami-0c7217cdde317cfec"   # Ubuntu 22.04 LTS (us-east-1)
  instance_type = "t2.micro"                # Free tier eligible

  vpc_security_group_ids = [aws_security_group.web.id]

  tags = {
    Name        = "MyProductionServer"
    Environment = "production"
  }
}

# Output the public IP after creation
output "server_ip" {
  value = aws_instance.myserver.public_ip
}
```

### Terraform Commands

```bash
# Initialize — downloads required providers
terraform init

# Preview what will be created or changed (dry run)
terraform plan

# Apply — actually create the infrastructure
terraform apply

# Destroy — tear everything down cleanly
terraform destroy

# Show current infrastructure state
terraform show
```

---

## 📖 Topic 8: Monitoring — Grafana & Prometheus

**Monitoring** means knowing exactly what your server is doing at all times — before your users notice a problem.

```
What to monitor:
  CPU usage         → Is the server overloaded?
  Memory usage      → Is the server running out of RAM?
  Disk usage        → Is the disk filling up?
  Network traffic   → How much bandwidth is being used?
  App response time → Is the app getting slow?
  Error rates       → How many requests are failing?
  Uptime            → Is the server actually reachable?
```

### Prometheus + Grafana Stack via Docker Compose

```yaml
# docker-compose.monitoring.yml

version: '3.8'

services:

  prometheus:
    image: prom/prometheus:latest
    container_name: prometheus
    volumes:
      - ./prometheus.yml:/etc/prometheus/prometheus.yml
      - prometheus_data:/prometheus
    ports:
      - "9090:9090"
    restart: unless-stopped

  grafana:
    image: grafana/grafana:latest
    container_name: grafana
    ports:
      - "3001:3000"
    volumes:
      - grafana_data:/var/lib/grafana
    environment:
      - GF_SECURITY_ADMIN_PASSWORD=admin
    restart: unless-stopped

  node-exporter:
    image: prom/node-exporter:latest
    container_name: node-exporter
    ports:
      - "9100:9100"
    restart: unless-stopped

volumes:
  prometheus_data:
  grafana_data:
```

```yaml
# prometheus.yml

global:
  scrape_interval: 15s

scrape_configs:
  - job_name: 'node-exporter'
    static_configs:
      - targets: ['node-exporter:9100']

  - job_name: 'prometheus'
    static_configs:
      - targets: ['localhost:9090']
```

```bash
# Start the full monitoring stack
docker compose -f docker-compose.monitoring.yml up -d

# Access dashboards at:
# Prometheus:  http://your-server:9090
# Grafana:     http://your-server:3001   (login: admin / admin)
```

### Quick Monitoring with Netdata

```bash
# Zero-config, instant beautiful dashboard — one command install
curl https://get.netdata.cloud/kickstart.sh > /tmp/netdata-kickstart.sh
sh /tmp/netdata-kickstart.sh

# Access the real-time dashboard at:
# http://your-server:19999
```

### Simple Uptime Monitoring with Cron

```bash
crontab -e

# Check every 5 minutes — send alert email if site is down
*/5 * * * * curl -f http://yoursite.com || \
  echo "⚠️ Site is DOWN!" | mail -s "ALERT: yoursite.com" you@email.com
```

---

## 📖 Topic 9: DigitalOcean — Beginner Friendly Cloud

DigitalOcean is simpler and more developer-friendly than AWS — a great place to start with cloud.

```bash
# Install doctl — the DigitalOcean CLI
sudo snap install doctl

# Authenticate with your API token
doctl auth init
# Paste your API token from the DigitalOcean dashboard

# List your droplets (VPS instances)
doctl compute droplet list

# Create a new droplet
doctl compute droplet create \
  --region nyc1 \
  --size s-1vcpu-1gb \
  --image ubuntu-24-04-x64 \
  --ssh-keys your-key-fingerprint \
  myserver

# SSH directly into a droplet by name
doctl compute ssh myserver

# Delete a droplet
doctl compute droplet delete myserver
```

### DigitalOcean vs AWS Services

| DigitalOcean | AWS Equivalent | What It Does |
|-------------|---------------|-------------|
| Droplets | EC2 | Virtual servers |
| Spaces | S3 | Object storage |
| Managed Databases | RDS / ElastiCache | Hosted PostgreSQL / Redis |
| App Platform | Elastic Beanstalk | PaaS deployment |
| Load Balancers | ELB | Distribute traffic |

---

## ✅ Phase 8 Checklist

Before moving to Phase 9, make sure you can confidently tick all of these:

- [ ] Can you explain the difference between IaaS, PaaS, and SaaS?
- [ ] Can you launch an EC2 instance on AWS and SSH into it?
- [ ] Can you install and configure the AWS CLI?
- [ ] Can you upload files to S3 and host a static site from it?
- [ ] Do you understand what CI/CD is and why it matters?
- [ ] Can you write a GitHub Actions workflow that auto-deploys on push to main?
- [ ] Do you understand what Terraform does and why Infrastructure as Code matters?
- [ ] Can you write a basic Terraform file that creates a server and security group?
- [ ] Can you set up Prometheus + Grafana for real-time server monitoring?
- [ ] Can you use DigitalOcean to create and manage droplets via CLI?

---

## 🎯 Phase 8 Hands-On Tasks

### Task 1 — Launch a Cloud Server
> Create a free tier EC2 instance (or DigitalOcean droplet), SSH into it, and deploy a Node.js app completely from scratch — no guides, just your knowledge from previous phases.

### Task 2 — S3 Static Site
> Build a simple HTML/CSS site, upload it to an S3 bucket, enable static website hosting, and share the public URL.

### Task 3 — CI/CD Pipeline
> Set up a GitHub Actions workflow that automatically deploys your app to your server every time you push to the `main` branch. Test it by pushing a small change and watching the pipeline run.

### Task 4 — Terraform
> Write a `main.tf` file that creates an EC2 instance with a security group allowing ports 22, 80, and 443. Run `terraform apply` and confirm the server appears in your AWS console. Then `terraform destroy` it cleanly.

### Task 5 — Monitoring Dashboard
> Deploy the Prometheus + Grafana stack using Docker Compose on your server. Import the official Node Exporter Full dashboard in Grafana (Dashboard ID: 1860) and watch your server's CPU, RAM, and disk in real time.

---

## 📚 Resources for Phase 8

| Resource | Type | Link |
|----------|------|-------|
| AWS Free Tier | ☁️ Cloud | [aws.amazon.com/free](https://aws.amazon.com/free/) |
| DigitalOcean Documentation | 📄 Docs | [docs.digitalocean.com](https://docs.digitalocean.com) |
| GitHub Actions Documentation | 📄 Docs | [docs.github.com/actions](https://docs.github.com/en/actions) |
| Terraform AWS Getting Started | 📄 Guide | [developer.hashicorp.com/terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started) |
| Grafana Official Documentation | 📄 Docs | [grafana.com/docs](https://grafana.com/docs/) |
| TechWorld with Nana — DevOps Roadmap | 🎥 YouTube | Search on YouTube |
| NetworkChuck — AWS Series | 🎥 YouTube | Search on YouTube |

---

## ⏭️ What's Next?

Once your checklist is complete and all tasks are done:

### 👉 [Phase 9 — Security Hardening](./PHASE_9_SECURITY.md) 🔒

> The final phase — lock down your server, protect it from real-world attackers, and build the security habits you'll apply to every server you ever manage.

---

> 💬 **Tip:** Don't try to learn all of AWS at once — it's overwhelming. Focus on EC2, S3, and IAM first. That covers 80% of what most server engineers do daily. Go deeper on other services only when a project actually needs them.