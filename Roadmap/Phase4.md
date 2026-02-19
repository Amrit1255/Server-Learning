# ⚙️ Phase 4 — Web Servers (Weeks 8–11)

> **Goal:** Serve content to the world using real web servers.  
> Install, configure, and secure Nginx — the world's most popular web server.

---

## 📌 Table of Contents

- [Topic 1 — What is a Web Server?](#-topic-1-what-is-a-web-server)
- [Topic 2 — Installing & Starting Nginx](#-topic-2-installing--starting-nginx)
- [Topic 3 — Nginx File Structure](#-topic-3-nginx-file-structure)
- [Topic 4 — Serving a Static Website](#-topic-4-serving-a-static-website)
- [Topic 5 — Understanding Nginx Config Blocks](#-topic-5-understanding-nginx-config-blocks)
- [Topic 6 — Virtual Hosts](#-topic-6-virtual-hosts--multiple-sites-one-server)
- [Topic 7 — Reverse Proxy](#-topic-7-reverse-proxy)
- [Topic 8 — SSL/TLS — Setting Up HTTPS](#-topic-8-ssltls--setting-up-https)
- [Topic 9 — Load Balancing](#-topic-9-load-balancing)
- [Topic 10 — Logs & Debugging](#-topic-10-nginx-logs--debugging)
- [Phase 4 Checklist](#-phase-4-checklist)
- [Phase 4 Hands-On Tasks](#-phase-4-hands-on-tasks)
- [Resources](#-resources-for-phase-4)

---

## 📖 Topic 1: What is a Web Server?

A **web server** is software that listens for incoming HTTP requests and sends back responses — HTML pages, JSON data, files, images, and more.

```
Client (Browser)                    Web Server
       |                                 |
       |  GET /index.html HTTP/1.1 -->   |
       |                                 |  (finds the file)
       |  <-- HTTP/1.1 200 OK           |
       |  <-- <html>...</html>          |
       |                                 |
```

### Nginx vs Apache

| Feature | Nginx | Apache |
|---------|-------|--------|
| Architecture | Event-driven, async | Process/thread per request |
| Performance | ✅ Faster under high load | Slower under high load |
| Config Style | Simple block-based | `.htaccess` per directory |
| Best For | Reverse proxy, static files, high traffic | Shared hosting, `.htaccess` flexibility |
| Market Share | #1 worldwide | #2 worldwide |

> 💡 **Start with Nginx** — it's faster, simpler, and used in most modern server setups.

---

## 📖 Topic 2: Installing & Starting Nginx

```bash
# Install Nginx
sudo apt update
sudo apt install nginx

# Start Nginx
sudo systemctl start nginx

# Enable Nginx to start automatically on boot
sudo systemctl enable nginx

# Check status
sudo systemctl status nginx

# Stop / Restart / Reload
sudo systemctl stop nginx
sudo systemctl restart nginx
sudo systemctl reload nginx     # Reload config without downtime ✅
```

### reload vs restart

| Command | Behavior | Use When |
|---------|----------|----------|
| `restart` | Full stop + start (brief downtime) | Major changes |
| `reload` | Gracefully applies new config (no downtime) | Config changes in production ✅ |

### Verify It's Working

```bash
# Check Nginx is listening on port 80
ss -tulpn | grep nginx

# Test from the server itself
curl http://localhost

# Open in your browser
http://YOUR_SERVER_IP
```

> ✅ You should see the **Nginx Welcome Page** — that means it's working!

---

## 📖 Topic 3: Nginx File Structure

```
/etc/nginx/
├── nginx.conf              ← Main config file
├── sites-available/        ← All site configs (active and inactive)
│   └── default             ← Default site config
├── sites-enabled/          ← Symlinks to active sites only
│   └── default → ../sites-available/default
├── conf.d/                 ← Extra config files (auto-loaded)
├── snippets/               ← Reusable config snippets
└── logs/
    ├── access.log          ← Every request logged here
    └── error.log           ← All errors logged here
```

### The Workflow

```
1. Create site config in  → sites-available/
2. Enable it by symlinking → sites-enabled/
3. Test config syntax      → sudo nginx -t
4. Reload Nginx            → sudo systemctl reload nginx
```

```bash
# Test Nginx config for syntax errors (ALWAYS do this before reloading!)
sudo nginx -t

# Enable a site
sudo ln -s /etc/nginx/sites-available/mysite /etc/nginx/sites-enabled/

# Disable a site
sudo rm /etc/nginx/sites-enabled/mysite
```

---

## 📖 Topic 4: Serving a Static Website

### Step 1 — Create your website files

```bash
sudo mkdir -p /var/www/mysite
sudo nano /var/www/mysite/index.html
```

```html
<!DOCTYPE html>
<html>
  <head><title>My Site</title></head>
  <body>
    <h1>Hello from my server! 🚀</h1>
  </body>
</html>
```

### Step 2 — Create Nginx config

```bash
sudo nano /etc/nginx/sites-available/mysite
```

```nginx
server {
    listen 80;
    server_name mysite.com www.mysite.com;

    root /var/www/mysite;
    index index.html;

    location / {
        try_files $uri $uri/ =404;
    }
}
```

### Step 3 — Enable & reload

```bash
sudo ln -s /etc/nginx/sites-available/mysite /etc/nginx/sites-enabled/
sudo nginx -t                       # Must output "test is successful"
sudo systemctl reload nginx
```

> 🎉 Your site is now live on port 80!

---

## 📖 Topic 5: Understanding Nginx Config Blocks

```nginx
# Main context
worker_processes auto;

events {
    worker_connections 1024;        # Max simultaneous connections
}

http {
    # HTTP context — applies to all sites

    server {
        # Server block — one per site or domain
        listen 80;
        server_name example.com;

        location / {
            # Location block — matches URL paths
            root /var/www/html;
            index index.html;
        }

        location /api {
            # Different rules for /api paths
            proxy_pass http://localhost:3000;
        }

        location /images {
            # Serve static images from a different folder
            root /var/www/static;
            expires 30d;            # Cache images for 30 days
        }
    }
}
```

### Location Block Matching Priority

```nginx
location = /exact     { }   # Exact match        (highest priority)
location ^~ /prefix   { }   # Prefix match       (stops regex checking)
location ~ \.php$     { }   # Regex match        (case sensitive)
location ~* \.jpg$    { }   # Regex match        (case insensitive)
location /            { }   # Default catch-all  (lowest priority)
```

---

## 📖 Topic 6: Virtual Hosts — Multiple Sites, One Server

You can host **multiple websites on a single server** using virtual hosts (called server blocks in Nginx).

```bash
sudo nano /etc/nginx/sites-available/site1.com
```

```nginx
server {
    listen 80;
    server_name site1.com www.site1.com;
    root /var/www/site1;
    index index.html;

    location / {
        try_files $uri $uri/ =404;
    }
}
```

```bash
sudo nano /etc/nginx/sites-available/site2.com
```

```nginx
server {
    listen 80;
    server_name site2.com www.site2.com;
    root /var/www/site2;
    index index.html;

    location / {
        try_files $uri $uri/ =404;
    }
}
```

```bash
# Enable both sites
sudo ln -s /etc/nginx/sites-available/site1.com /etc/nginx/sites-enabled/
sudo ln -s /etc/nginx/sites-available/site2.com /etc/nginx/sites-enabled/
sudo nginx -t && sudo systemctl reload nginx
```

### How Nginx Decides Which Site to Serve

```
Request arrives for site1.com on port 80
              |
Nginx checks server_name in all server blocks
              |
Matches server_name site1.com → serves /var/www/site1
```

---

## 📖 Topic 7: Reverse Proxy

A **reverse proxy** sits in front of your app and forwards requests to it. This is one of the most powerful and common Nginx use cases.

```
Internet → Nginx (port 80/443) → Your App (port 3000)
```

### Why Use a Reverse Proxy?

- Your app runs on port `3000` — users access it cleanly on port `80`/`443`
- Nginx handles SSL termination (not your app)
- Nginx can load balance across multiple instances
- Nginx serves static files much faster than Node.js or Python
- Adds a security layer between the internet and your app

```bash
sudo nano /etc/nginx/sites-available/myapp
```

```nginx
server {
    listen 80;
    server_name myapp.com;

    location / {
        proxy_pass http://localhost:3000;        # Forward to your app

        # Pass important headers to your app
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    # Serve static files directly via Nginx (faster)
    location /static {
        root /var/www/myapp;
        expires 30d;
    }
}
```

### Traffic Flow

```
Browser → myapp.com:80
              ↓
           Nginx
              ↓
       localhost:3000
       (Node.js / Python app)
```

---

## 📖 Topic 8: SSL/TLS — Setting Up HTTPS

**HTTPS = HTTP + encryption.** Every production site must have it.  
We use **Let's Encrypt** — a free, trusted, and widely used certificate authority.

### Step 1 — Install Certbot

```bash
sudo apt install certbot python3-certbot-nginx
```

### Step 2 — Get Your SSL Certificate

```bash
sudo certbot --nginx -d yourdomain.com -d www.yourdomain.com
```

Certbot will automatically:
1. Verify you own the domain
2. Issue a free SSL certificate
3. Update your Nginx config to use HTTPS
4. Set up auto-renewal (certificates expire every 90 days)

### Step 3 — Verify Auto-Renewal

```bash
# Test the renewal process (dry run — no changes made)
sudo certbot renew --dry-run

# Check renewal timer
sudo systemctl status certbot.timer
```

### What Your Config Looks Like After Certbot

```nginx
# Redirect all HTTP traffic to HTTPS
server {
    listen 80;
    server_name mysite.com www.mysite.com;
    return 301 https://$host$request_uri;
}

# Serve site over HTTPS
server {
    listen 443 ssl;
    server_name mysite.com www.mysite.com;

    ssl_certificate /etc/letsencrypt/live/mysite.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/mysite.com/privkey.pem;

    root /var/www/mysite;
    index index.html;

    location / {
        try_files $uri $uri/ =404;
    }
}
```

---

## 📖 Topic 9: Load Balancing

Nginx can distribute traffic across **multiple app instances** so no single instance gets overwhelmed.

```nginx
upstream myapp {
    server localhost:3000;    # Instance 1
    server localhost:3001;    # Instance 2
    server localhost:3002;    # Instance 3
}

server {
    listen 80;
    server_name myapp.com;

    location / {
        proxy_pass http://myapp;
    }
}
```

### Load Balancing Methods

```nginx
upstream myapp {
    # Round Robin (default) — each request goes to the next server in turn
    server localhost:3000;
    server localhost:3001;
}

upstream myapp_leastconn {
    # Least Connections — send to whichever server has fewest active connections
    least_conn;
    server localhost:3000;
    server localhost:3001;
}

upstream myapp_iphash {
    # IP Hash — same user always goes to the same server (good for sessions)
    ip_hash;
    server localhost:3000;
    server localhost:3001;
}
```

---

## 📖 Topic 10: Nginx Logs & Debugging

```bash
# Watch access logs live — every incoming request
tail -f /var/log/nginx/access.log

# Watch error logs live
tail -f /var/log/nginx/error.log

# Access log format explained:
# IP - - [date] "METHOD /path HTTP/version" STATUS SIZE "referrer" "user-agent"
# 192.168.1.1 - - [19/Feb/2026] "GET /index.html HTTP/1.1" 200 1234 "-" "Chrome"

# Always test config before reloading
sudo nginx -t

# View Nginx version and compiled modules
nginx -V
```

### Common Nginx Errors & Fixes

| Error | Cause | Fix |
|-------|-------|-----|
| `502 Bad Gateway` | App is not running | Start your backend app |
| `403 Forbidden` | Wrong file permissions | `chmod 755` on web root directory |
| `404 Not Found` | Wrong root path in config | Double-check `root` directive |
| `bind() to 0.0.0.0:80 failed` | Port 80 already in use | Run `ss -tulpn` to find what's using it |
| `nginx: [emerg] unknown directive` | Config syntax error | Run `sudo nginx -t` to find the line |

---

## ✅ Phase 4 Checklist

Before moving to Phase 5, make sure you can confidently tick all of these:

- [ ] Can you install and start Nginx from scratch?
- [ ] Do you understand the Nginx file structure — `sites-available` vs `sites-enabled`?
- [ ] Can you serve a static HTML website with Nginx?
- [ ] Can you write a basic Nginx server block from memory?
- [ ] Can you host two different websites on one server using virtual hosts?
- [ ] Can you set up a reverse proxy to forward traffic to a local app?
- [ ] Can you set up free HTTPS with Let's Encrypt and Certbot?
- [ ] Do you always test Nginx config with `nginx -t` before reloading?
- [ ] Can you read Nginx access and error logs in real time?
- [ ] Do you understand the basics of load balancing?

---

## 🎯 Phase 4 Hands-On Tasks

### Task 1 — Serve a Static Site
> Create a simple HTML page and serve it via Nginx. Access it via your server's public IP in the browser.

### Task 2 — Virtual Hosts
> Set up two different websites on the same server. Use `/etc/hosts` on your local machine to simulate two different domains pointing to your server IP.

### Task 3 — Reverse Proxy
> Run a simple Node.js or Python app on port `3000`. Configure Nginx to proxy all requests from port `80` to your app.
> ```bash
> # Quick Node.js test server
> node -e "require('http').createServer((req,res)=>res.end('Hello from app!')).listen(3000)"
> ```

### Task 4 — HTTPS Setup
> Point a real domain to your server and use Certbot to get a free SSL certificate. Confirm your site loads over `https://` and HTTP redirects automatically.

### Task 5 — Break & Fix
> Intentionally introduce a syntax error in your Nginx config. Run `nginx -t` and read the error message. Fix it, test again, and reload.

---

## 📚 Resources for Phase 4

| Resource | Type | Link |
|----------|------|-------|
| Nginx Official Docs | 📄 Docs | [nginx.org/en/docs](https://nginx.org/en/docs/) |
| DigitalOcean Nginx Tutorials | 📄 Guides | [digitalocean.com/community](https://www.digitalocean.com/community/tags/nginx) |
| Let's Encrypt Documentation | 📄 Docs | [letsencrypt.org/docs](https://letsencrypt.org/docs/) |
| Certbot Official Docs | 📄 Docs | [certbot.eff.org](https://certbot.eff.org) |
| Nginx Config Generator | 🛠️ Tool | [digitalocean.com/tools/nginx-config](https://www.digitalocean.com/community/tools/nginx) |
| NetworkChuck — Nginx Video | 🎥 YouTube | Search on YouTube |

---

## ⏭️ What's Next?

Once your checklist is complete and all tasks are done:

### 👉 [Phase 5 — Backend Runtime & App Deployment](./PHASE_5_DEPLOYMENT.md) 🏗️

> You'll deploy real applications, keep them running 24/7 with PM2, manage environment variables, use Systemd services, and handle logs like a pro.

---

> 💬 **Tip:** The reverse proxy + HTTPS combo is what you'll use in **every** real project. Get very comfortable with it — it's the foundation of all modern web deployments.