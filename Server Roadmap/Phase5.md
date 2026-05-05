# 🏗️ Phase 5 — Backend Runtime & App Deployment (Weeks 11–15)

> **Goal:** Deploy real applications on your server and keep them running 24/7.  
> This is where your server goes from serving files to running real software.

---

## 📌 Table of Contents

- [Topic 1 — What is App Deployment?](#-topic-1-what-is-app-deployment)
- [Topic 2 — Installing Runtimes](#-topic-2-installing-runtimes)
- [Topic 3 — Getting Your Code onto the Server](#-topic-3-getting-your-code-onto-the-server)
- [Topic 4 — Environment Variables](#-topic-4-environment-variables)
- [Topic 5 — PM2 — Process Manager for Node.js](#-topic-5-pm2--process-manager-for-nodejs)
- [Topic 6 — Systemd — Run Any App as a Service](#-topic-6-systemd--run-any-app-as-a-service)
- [Topic 7 — Full Deployment Walkthrough](#-topic-7-full-deployment-walkthrough--nodejs-app)
- [Topic 8 — Logging & Monitoring](#-topic-8-logging--monitoring)
- [Topic 9 — Updating Your App](#-topic-9-updating-your-app-zero-downtime)
- [Phase 5 Checklist](#-phase-5-checklist)
- [Phase 5 Hands-On Tasks](#-phase-5-hands-on-tasks)
- [Resources](#-resources-for-phase-5)

---

## 📖 Topic 1: What is App Deployment?

Deployment means taking your code and making it **run on a server** so the entire world can access it.

```
Your Laptop                        Server
    |                                 |
    |  code works locally ✅          |  code must work here too ✅
    |                                 |
    |  localhost:3000                 |  yourdomain.com
    |  (only you can see it)          |  (everyone can see it)
```

### The Deployment Process

```
Step 1 → Get your code onto the server     (Git, SCP, rsync)
Step 2 → Install dependencies              (npm install, pip install)
Step 3 → Set environment variables         (.env file)
Step 4 → Start your app                    (node app.js, python app.py)
Step 5 → Keep it running 24/7             (PM2 or Systemd)
Step 6 → Point Nginx to your app          (reverse proxy)
Step 7 → Set up HTTPS                     (Certbot + Let's Encrypt)
```

---

## 📖 Topic 2: Installing Runtimes

Before running your app, install the right runtime on your server.

### Node.js

```bash
# Install Node.js via NodeSource (recommended — gets latest LTS)
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt install -y nodejs

# Verify installation
node --version
npm --version

# Install yarn (optional)
npm install -g yarn
```

### Python

```bash
# Python 3 is usually pre-installed on Ubuntu
python3 --version

# Install pip
sudo apt install python3-pip

# Install virtualenv
pip3 install virtualenv

# Verify
pip3 --version
```

### Other Runtimes

```bash
# PHP
sudo apt install php php-fpm

# Java
sudo apt install default-jdk

# Go
sudo apt install golang-go

# Ruby
sudo apt install ruby-full
```

---

## 📖 Topic 3: Getting Your Code onto the Server

### Method 1 — Git ✅ Recommended

```bash
# On your server — install git
sudo apt install git

# Clone your repository
git clone https://github.com/yourusername/yourproject.git

# Navigate into the project
cd yourproject

# Pull latest changes anytime
git pull origin main
```

### Method 2 — SCP (Copy Files Directly)

```bash
# From your local machine — copy a single file to server
scp localfile.txt user@server-ip:/home/user/

# Copy an entire folder
scp -r ./myproject user@server-ip:/home/user/

# Copy from server back to local
scp user@server-ip:/home/user/file.txt ./
```

### Method 3 — rsync (Sync Folders Efficiently)

```bash
# Sync local folder to server (only transfers changed files)
rsync -avz ./myproject/ user@server-ip:/home/user/myproject/

# Exclude node_modules — always install these fresh on the server
rsync -avz --exclude='node_modules' --exclude='.env' \
  ./myproject/ user@server-ip:/home/user/myproject/
```

### Method Comparison

| Method | Best For | Speed |
|--------|----------|-------|
| Git | Ongoing development & updates | ✅ Fast — only fetches changes |
| SCP | One-off file transfers | Medium |
| rsync | Large folder syncing | ✅ Fast — skips unchanged files |

---

## 📖 Topic 4: Environment Variables

**Never hardcode secrets in your code.** Use environment variables for anything sensitive or environment-specific.

```bash
# ❌ Bad — hardcoded secrets in code
const db = connect("postgresql://admin:password123@localhost/mydb")

# ✅ Good — loaded from environment variable
const db = connect(process.env.DATABASE_URL)
```

### Setting Environment Variables

```bash
# Temporary — lost after logout
export DATABASE_URL="postgresql://admin:password@localhost/mydb"
export PORT=3000

# Check a specific variable
echo $DATABASE_URL

# See all environment variables
env
printenv
```

### The .env File

```bash
# Create a .env file in your project root
nano .env
```

```env
# .env file — never commit this to Git!
PORT=3000
DATABASE_URL=postgresql://admin:password@localhost/mydb
JWT_SECRET=your-super-secret-key-here
NODE_ENV=production
REDIS_URL=redis://localhost:6379
```

```bash
# Always add .env to .gitignore
echo ".env" >> .gitignore
```

```javascript
// Load .env in Node.js — install dotenv first
// npm install dotenv

require('dotenv').config()
console.log(process.env.PORT)         // → 3000
console.log(process.env.DATABASE_URL) // → postgresql://...
```

### System-Wide Environment Variables

```bash
# Add permanent env vars to your shell profile
nano ~/.bashrc

# Add this line at the bottom:
export DATABASE_URL="postgresql://admin:password@localhost/mydb"

# Apply changes immediately
source ~/.bashrc
```

---

## 📖 Topic 5: PM2 — Process Manager for Node.js

**PM2** keeps your Node.js app running forever — automatically restarting it after crashes or server reboots.

### Basic PM2 Commands

```bash
# Install PM2 globally
npm install -g pm2

# Start your app
pm2 start app.js

# Start with a custom name
pm2 start app.js --name "myapp"

# View all running apps
pm2 list

# View live logs
pm2 logs
pm2 logs myapp              # Logs for a specific app

# Live CPU & memory dashboard
pm2 monit

# Restart an app
pm2 restart myapp

# Stop an app (keeps it in PM2 list)
pm2 stop myapp

# Remove an app from PM2
pm2 delete myapp
```

### Survive Server Reboots

```bash
# Save the current PM2 process list
pm2 save

# Generate and install a startup script
pm2 startup
# Run the command it outputs — then your apps auto-start on every reboot
```

### PM2 Ecosystem File (Best Practice for Production)

```bash
nano ecosystem.config.js
```

```javascript
module.exports = {
  apps: [
    {
      name: "myapp",
      script: "app.js",
      instances: "max",             // Use all available CPU cores
      exec_mode: "cluster",         // Enable cluster mode for load balancing
      env: {
        NODE_ENV: "development",
        PORT: 3000
      },
      env_production: {
        NODE_ENV: "production",
        PORT: 3000
      },
      error_file: "./logs/error.log",
      out_file: "./logs/out.log",
      log_date_format: "YYYY-MM-DD HH:mm:ss"
    }
  ]
}
```

```bash
# Start using the ecosystem file
pm2 start ecosystem.config.js --env production

# Reload with zero downtime
pm2 reload ecosystem.config.js
```

---

## 📖 Topic 6: Systemd — Run Any App as a Service

**Systemd** is Linux's built-in service manager. Use it to run Python, Go, Java, or any language as a proper Linux service — not just Node.js.

### Create a Service File

```bash
sudo nano /etc/systemd/system/myapp.service
```

```ini
[Unit]
Description=My Application
After=network.target

[Service]
Type=simple
User=www-data
WorkingDirectory=/home/user/myapp
ExecStart=/usr/bin/python3 app.py
Restart=always
RestartSec=10

# Environment variables
Environment=PORT=3000
Environment=NODE_ENV=production
EnvironmentFile=/home/user/myapp/.env

# Logging to journald
StandardOutput=journal
StandardError=journal

[Install]
WantedBy=multi-user.target
```

### Managing the Service

```bash
# Reload systemd to pick up the new service file
sudo systemctl daemon-reload

# Enable service — auto-start on every boot
sudo systemctl enable myapp

# Start the service now
sudo systemctl start myapp

# Check service status
sudo systemctl status myapp

# Stop and restart
sudo systemctl stop myapp
sudo systemctl restart myapp

# View live service logs
journalctl -u myapp -f                  # Follow logs in real time
journalctl -u myapp --since today       # Logs from today
journalctl -u myapp -n 100             # Last 100 lines only
```

---

## 📖 Topic 7: Full Deployment Walkthrough — Node.js App

A **complete, step-by-step deployment** from a blank server to a live HTTPS app.

### Step 1 — SSH into your server
```bash
ssh user@your-server-ip
```

### Step 2 — Install Node.js & PM2
```bash
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt install -y nodejs
npm install -g pm2
```

### Step 3 — Clone your project
```bash
cd /home/user
git clone https://github.com/yourusername/myapp.git
cd myapp
```

### Step 4 — Install dependencies
```bash
npm install --production
```

### Step 5 — Set up environment variables
```bash
nano .env
# Add PORT, DATABASE_URL, JWT_SECRET, etc.
```

### Step 6 — Start with PM2
```bash
pm2 start app.js --name "myapp"
pm2 save
pm2 startup     # Run the command it outputs
```

### Step 7 — Configure Nginx reverse proxy
```bash
sudo nano /etc/nginx/sites-available/myapp
```

```nginx
server {
    listen 80;
    server_name yourdomain.com www.yourdomain.com;

    location / {
        proxy_pass http://localhost:3000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

```bash
sudo ln -s /etc/nginx/sites-available/myapp /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl reload nginx
```

### Step 8 — Set up HTTPS
```bash
sudo certbot --nginx -d yourdomain.com -d www.yourdomain.com
```

### Step 9 — Verify everything is working
```bash
pm2 list                            # ✅ App running?
sudo systemctl status nginx         # ✅ Nginx running?
curl https://yourdomain.com         # ✅ Returns your app?
```

> 🎉 **Your app is live on the internet with HTTPS!**

---

## 📖 Topic 8: Logging & Monitoring

```bash
# PM2 logs
pm2 logs                            # All app logs
pm2 logs myapp                      # Specific app logs
pm2 logs myapp --lines 200          # Last 200 lines
pm2 flush                           # Clear all PM2 logs

# Systemd logs
journalctl -u myapp -f              # Follow app logs live
journalctl -u nginx -f              # Follow Nginx logs live
journalctl --since "1 hour ago"     # Logs from last hour

# Nginx logs
tail -f /var/log/nginx/access.log
tail -f /var/log/nginx/error.log

# System resource monitoring
top                                 # CPU & memory usage
htop                                # Better interactive version of top
df -h                               # Disk usage (human readable)
free -h                             # RAM usage

# PM2 live dashboard
pm2 monit
```

---

## 📖 Topic 9: Updating Your App (Zero Downtime)

```bash
# Pull latest code from Git
cd /home/user/myapp
git pull origin main

# Install any new or updated dependencies
npm install --production

# Reload app with zero downtime using PM2
pm2 reload myapp

# OR full restart if there are major changes
pm2 restart myapp

# For Systemd-managed apps
sudo systemctl restart myapp
```

### One-Command Deployment Script

```bash
nano deploy.sh
```

```bash
#!/bin/bash
echo "🚀 Starting deployment..."

cd /home/user/myapp

echo "📦 Pulling latest code..."
git pull origin main

echo "📥 Installing dependencies..."
npm install --production

echo "🔄 Reloading app..."
pm2 reload myapp

echo "✅ Deployment complete!"
```

```bash
# Make it executable
chmod +x deploy.sh

# Deploy your app with a single command anytime
./deploy.sh
```

---

## ✅ Phase 5 Checklist

Before moving to Phase 6, make sure you can confidently tick all of these:

- [ ] Can you install Node.js or Python on a fresh Ubuntu server?
- [ ] Can you get your code onto a server using Git?
- [ ] Do you understand why environment variables matter and how to use them?
- [ ] Can you create and load a `.env` file in your app?
- [ ] Can you start and manage apps with PM2?
- [ ] Can you make PM2 apps survive server reboots?
- [ ] Can you create a Systemd service file for any app?
- [ ] Can you do a full end-to-end deployment — code → PM2 → Nginx → HTTPS?
- [ ] Can you view and follow logs from PM2 and Systemd?
- [ ] Can you update a running app with zero downtime using a deploy script?

---

## 🎯 Phase 5 Hands-On Tasks

### Task 1 — Deploy a Node.js App
> Create a simple Express.js app locally. Deploy it to your server using Git, start it with PM2, and access it via your domain name.

### Task 2 — Environment Variables
> Add a `JWT_SECRET` and `DATABASE_URL` to your `.env` file. Read and log them in your app on startup. Make sure `.env` is in `.gitignore`.

### Task 3 — PM2 Crash Recovery
> Start your app with PM2. Then manually kill the Node.js process:
> ```bash
> kill -9 $(pgrep node)
> ```
> Watch PM2 detect the crash and automatically restart the app.

### Task 4 — Systemd Service
> Write a simple Python HTTP server script. Create a Systemd service for it, enable it to start on boot. Reboot your server and confirm the script is running automatically.

### Task 5 — One-Command Deploy
> Write a `deploy.sh` script that pulls the latest code, installs dependencies, and reloads PM2. Run it end-to-end and confirm your live app updates without downtime.

---

## 📚 Resources for Phase 5

| Resource | Type | Link |
|----------|------|-------|
| PM2 Official Documentation | 📄 Docs | [pm2.keymetrics.io/docs](https://pm2.keymetrics.io/docs/usage/quick-start/) |
| Systemd Service Files Guide | 📄 Guide | [digitalocean.com/community](https://www.digitalocean.com/community/tutorials/understanding-systemd-units-and-unit-files) |
| dotenv npm Package | 📄 Docs | [npmjs.com/package/dotenv](https://www.npmjs.com/package/dotenv) |
| Node.js Deployment Best Practices | 📄 Guide | [nodejs.org/en/docs/guides](https://nodejs.org/en/docs/guides) |
| DigitalOcean Node.js Tutorials | 📄 Guides | [digitalocean.com/community](https://www.digitalocean.com/community/tags/node-js) |

---

## ⏭️ What's Next?

Once your checklist is complete and all tasks are done:

### 👉 [Phase 6 — Databases on Server](./PHASE_6_DATABASES.md) 🗄️

> You'll install PostgreSQL and MySQL, secure them, connect your apps, run queries, and set up reliable automated backups.

---

> 💬 **Tip:** The full deployment walkthrough in Topic 7 is something you should practice **at least 3 times** on fresh servers. Repetition is what turns this from a checklist into muscle memory.