# 🖥️ Server Mastery Roadmap — Zero to Hero

> A complete, structured guide for absolute beginners to become confident with servers — from knowing nothing to deploying real-world applications.

---

## 📌 Table of Contents

- [Overview](#-overview)
- [Phase 1 — Foundation](#-phase-1--foundation-weeks-13)
- [Phase 2 — Linux & Command Line](#-phase-2--linux--command-line-weeks-36)
- [Phase 3 — Networking Fundamentals](#-phase-3--networking-fundamentals-weeks-68)
- [Phase 4 — Web Servers](#-phase-4--web-servers-weeks-811)
- [Phase 5 — Backend & App Deployment](#-phase-5--backend-runtime--app-deployment-weeks-1115)
- [Phase 6 — Databases on Server](#-phase-6--databases-on-server-weeks-1517)
- [Phase 7 — Docker & Containers](#-phase-7--docker--containers-weeks-1721)
- [Phase 8 — Cloud & DevOps Basics](#-phase-8--cloud--devops-basics-weeks-2126)
- [Phase 9 — Security Hardening](#-phase-9--security-hardening-ongoing)
- [Timeline Summary](#-timeline-summary)
- [Golden Rule](#-golden-rule-learn-by-doing)

---

## 🌐 Overview

This roadmap takes you from **zero knowledge** to being fully capable of deploying, managing, and securing real-world servers. Each phase builds on the previous one — follow it in order and, most importantly, **practice everything hands-on**.

**Estimated Duration:** ~6 months (at your own pace)  
**Prerequisites:** None — just curiosity and consistency.

---

## 🧱 Phase 1 — Foundation (Weeks 1–3)

> **Goal:** Understand what a server actually is before touching any code.

### Concepts to Learn
- What is a server? (Client–Server model)
- How the internet works — IP, DNS, HTTP/HTTPS, Ports
- The OSI Model (7 layers — conceptually)
- What is a Request & Response cycle?
- Difference between Web Server, App Server, and Database Server

### 📚 Resources
- [NetworkChuck](https://www.youtube.com/@NetworkChuck) — YouTube
- [CS50's Web Programming](https://cs50.harvard.edu/web/) — Free

---

## 🐧 Phase 2 — Linux & Command Line (Weeks 3–6)

> **Goal:** Servers run on Linux — you must speak its language.

### Concepts to Learn
- Linux basics — files, directories, permissions
- Essential commands: `ls`, `cd`, `mkdir`, `chmod`, `chown`, `grep`, `ps`, `kill`, `top`
- Users & Groups management
- File system structure — `/etc`, `/var`, `/home`, `/usr`
- SSH — connecting to remote servers securely
- File editing with `nano` / `vim`

### 🛠️ Practice
> Set up **Ubuntu** on [VirtualBox](https://www.virtualbox.org/) locally, or use a free tier instance on **AWS** or **DigitalOcean**.

---

## 🌍 Phase 3 — Networking Fundamentals (Weeks 6–8)

> **Goal:** Understand how data actually moves across the internet.

### Concepts to Learn
- IP Addresses — Public vs Private, IPv4 vs IPv6
- Subnets & CIDR notation
- DNS — how domain names resolve to IPs
- Ports & Protocols — `HTTP=80`, `HTTPS=443`, `SSH=22`, `FTP=21`
- Firewalls — `ufw` and `iptables` basics
- NAT & Routing concepts

---

## ⚙️ Phase 4 — Web Servers (Weeks 8–11)

> **Goal:** Serve content to the world.

### Concepts to Learn
- **Nginx** (start here) — install, configure, serve a static site
- **Apache** — understand how it differs from Nginx
- Virtual Hosts — host multiple sites on one server
- Reverse Proxy — forward requests to your app
- SSL/TLS — set up HTTPS with [Let's Encrypt](https://letsencrypt.org/) (Certbot)
- Load Balancing — conceptual understanding

### 🚀 Mini Project
> Host your own website on a VPS with **Nginx + HTTPS**.

---

## 🏗️ Phase 5 — Backend Runtime & App Deployment (Weeks 11–15)

> **Goal:** Run real applications on your server, 24/7.

### Concepts to Learn
- Install runtimes — Node.js / Python / or any language
- **PM2** — process manager to keep Node.js apps alive
- Environment variables & `.env` files
- **Systemd** — run apps as background services
- Reverse proxy your app through Nginx
- Logging — `journalctl`, `access.log`, `error.log`

### 🚀 Mini Project
> Deploy a **Node.js or Python app**, keep it alive 24/7 with **PM2 + Nginx**.

---

## 🗄️ Phase 6 — Databases on Server (Weeks 15–17)

> **Goal:** Store and retrieve data reliably.

### Concepts to Learn
- Install & configure **PostgreSQL** or **MySQL**
- Remote vs Local DB connections
- Basic DB security — users, permissions, bind address
- Backups — `pg_dump`, `mysqldump`
- **Redis** — caching basics

---

## 🐳 Phase 7 — Docker & Containers (Weeks 17–21)

> **Goal:** Learn the modern way to package and run server applications.

### Concepts to Learn
- What is Docker and why it matters
- Images, Containers, Volumes, Networks
- Writing a `Dockerfile` — build your own image
- `docker-compose` — run multi-container apps
- Containers vs Virtual Machines

### 🚀 Mini Project
> **Dockerize** your app + database using `docker-compose`.

---

## ☁️ Phase 8 — Cloud & DevOps Basics (Weeks 21–26)

> **Goal:** Understand where real-world servers live and how teams deploy them.

### Concepts to Learn
- Cloud providers overview — AWS, DigitalOcean, GCP
- Spin up a VPS / EC2 instance
- S3 / Object Storage basics
- CI/CD concept — GitHub Actions basics
- Infrastructure as Code intro — **Terraform** (just basics)
- Monitoring — CPU, memory, uptime with **Grafana + Prometheus** or **Netdata**

---

## 🔒 Phase 9 — Security Hardening (Ongoing from Phase 2)

> **Goal:** Don't let your server become a zombie — ever.

### Concepts to Learn & Apply
- Disable root login over SSH
- Use **SSH keys** instead of passwords
- Keep software updated — `apt upgrade`
- Configure **firewall rules** properly with `ufw`
- **Fail2Ban** — block brute force attacks automatically
- HTTPS everywhere — no plain HTTP in production
- Principle of **Least Privilege** — give only the access that's needed

> ⚠️ **Never skip security.** Apply these practices from day one.

---

## 📅 Timeline Summary

| # | Phase | Topics | Duration |
|---|-------|---------|----------|
| 1 | 🧱 Foundation | Client-Server, HTTP, DNS, OSI | Week 1–3 |
| 2 | 🐧 Linux & CLI | Commands, SSH, File System | Week 3–6 |
| 3 | 🌍 Networking | IPs, Ports, Firewalls, DNS | Week 6–8 |
| 4 | ⚙️ Web Servers | Nginx, Apache, SSL, Reverse Proxy | Week 8–11 |
| 5 | 🏗️ App Deployment | PM2, Systemd, Env Vars, Logging | Week 11–15 |
| 6 | 🗄️ Databases | PostgreSQL, MySQL, Redis, Backups | Week 15–17 |
| 7 | 🐳 Docker | Images, Containers, Compose | Week 17–21 |
| 8 | ☁️ Cloud & DevOps | AWS, CI/CD, Terraform, Monitoring | Week 21–26 |
| 9 | 🔒 Security | Hardening, Fail2Ban, SSH Keys | Ongoing |

---

## 💡 Golden Rule: Learn by Doing

> Every phase must have a **hands-on project**.

Don't just watch videos or read docs — **spin up a server, break it, fix it.** That's how real learning happens.

```
Watch → Understand → Build → Break → Fix → Repeat
```

---

## 🙌 Contributing

Found something outdated or want to add a resource? Feel free to open a PR or raise an issue.

---

## 📄 License

This roadmap is open source and free to use. Share it with anyone learning servers.

---

> Made with ❤️ for beginners who want to master servers from scratch.