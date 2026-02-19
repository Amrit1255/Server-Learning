# 🔒 Phase 9 — Security Hardening (Ongoing)

> **Goal:** Lock down your server, protect it from real-world attackers, and build security habits you apply to every server you ever touch.  
> Security is not a one-time task — it's a permanent mindset.

---

## 📌 Table of Contents

- [Topic 1 — Why Security Matters](#-topic-1-why-security-matters)
- [Topic 2 — SSH Hardening](#-topic-2-ssh-hardening)
- [Topic 3 — Firewall Configuration](#-topic-3-firewall-configuration)
- [Topic 4 — Fail2Ban — Automatic Attack Blocking](#-topic-4-fail2ban--automatic-attack-blocking)
- [Topic 5 — Keep Software Updated](#-topic-5-keep-software-updated)
- [Topic 6 — User & Privilege Management](#-topic-6-user--privilege-management)
- [Topic 7 — File & Directory Permissions](#-topic-7-file--directory-permissions)
- [Topic 8 — Nginx Security Headers](#-topic-8-nginx-security-headers)
- [Topic 9 — Database Security](#-topic-9-database-security)
- [Topic 10 — Monitoring & Intrusion Detection](#-topic-10-monitoring--intrusion-detection)
- [Topic 11 — Pre-Launch Security Checklist](#-topic-11-security-audit-checklist--before-going-live)
- [Phase 9 Checklist](#-phase-9-checklist)
- [Phase 9 Hands-On Tasks](#-phase-9-hands-on-tasks)
- [Resources](#-resources-for-phase-9)

---

## 📖 Topic 1: Why Security Matters

Every server on the internet is under **constant attack** — 24 hours a day, 7 days a week. Automated bots scan the entire internet continuously looking for vulnerable, misconfigured servers.

```
Within 60 seconds of launching a new server:
  → Bots start scanning your open ports
  → Brute force attacks begin on port 22 (SSH)
  → Automated exploits probe for known vulnerabilities

This is not paranoia — this is reality.
```

### What Attackers Want

```
💰 Crypto mining    → Use your CPU to mine coins (you pay the electricity bill)
📧 Spam bots        → Send millions of spam emails through your server
🔗 Botnet           → Add your server to a network of compromised machines
💾 Data theft       → Steal your database — passwords, emails, credit cards
🔒 Ransomware       → Encrypt your data and demand payment to restore it
```

### The Good News

Most attacks are **automated** and target easy, misconfigured servers. A properly hardened server stops 99% of them without any ongoing effort. The 1 hour you invest in security today protects you indefinitely.

---

## 📖 Topic 2: SSH Hardening

SSH is the front door to your server. It must be locked down before anything else.

### Step 1 — Disable Root Login & Password Auth

```bash
sudo nano /etc/ssh/sshd_config
```

```conf
# Disable direct root login
PermitRootLogin no

# Disable password authentication entirely — keys only
PasswordAuthentication no

# Enable SSH key authentication
PubkeyAuthentication yes
AuthorizedKeysFile .ssh/authorized_keys

# Additional hardening
MaxAuthTries 3                  # Max failed attempts before disconnect
LoginGraceTime 20               # Seconds allowed to complete login
X11Forwarding no                # Disable GUI forwarding
AllowTcpForwarding no           # Disable TCP tunneling unless needed
```

```bash
# Restart SSH to apply all changes
sudo systemctl restart sshd
```

> ⚠️ **Critical:** Always verify your SSH key login works **before** disabling password auth — or you will permanently lock yourself out!

---

### Step 2 — Change the Default SSH Port

```bash
sudo nano /etc/ssh/sshd_config

# Change from default port 22 (scanned constantly by bots)
Port 2222           # Choose any unused port between 1024–65535

sudo systemctl restart sshd

# Update your firewall rules
sudo ufw allow 2222/tcp
sudo ufw deny 22

# Connect going forward with:
ssh -p 2222 user@your-server-ip
```

---

### Step 3 — SSH Key Best Practices

```bash
# Generate a strong modern SSH key pair on your LOCAL machine
ssh-keygen -t ed25519 -C "your@email.com"

# OR use RSA 4096-bit if ed25519 is not supported
ssh-keygen -t rsa -b 4096 -C "your@email.com"

# Copy your public key to the server
ssh-copy-id -i ~/.ssh/id_ed25519.pub user@server-ip

# Protect your private key — never share it with anyone
chmod 600 ~/.ssh/id_ed25519
chmod 700 ~/.ssh/
```

---

### Step 4 — SSH Config File (Your Local Machine)

```bash
nano ~/.ssh/config
```

```conf
# Easy access to your servers by alias
Host myserver
    HostName 192.168.1.100
    User ubuntu
    Port 2222
    IdentityFile ~/.ssh/id_ed25519
    ServerAliveInterval 60

Host production
    HostName 203.0.113.5
    User ubuntu
    Port 2222
    IdentityFile ~/.ssh/id_ed25519
```

```bash
# Now connect with just the alias
ssh myserver
ssh production
```

---

## 📖 Topic 3: Firewall Configuration

**The golden rule: deny everything, then allow only what you need.**

```bash
# Set secure defaults
sudo ufw default deny incoming       # Block all incoming traffic by default
sudo ufw default allow outgoing      # Allow all outgoing traffic

# Allow only required ports
sudo ufw allow 2222/tcp              # SSH (your custom port)
sudo ufw allow 80/tcp                # HTTP
sudo ufw allow 443/tcp               # HTTPS

# Allow all traffic from a specific trusted IP
sudo ufw allow from 203.0.113.10

# Enable the firewall
sudo ufw enable

# View all active rules
sudo ufw status verbose

# View rules with numbers (for easy deletion)
sudo ufw status numbered

# Delete a rule by number
sudo ufw delete 3
```

### Advanced Firewall Rules

```bash
# Rate limit SSH — automatically throttle brute force at firewall level
sudo ufw limit 2222/tcp

# Allow a specific port only from a specific IP
sudo ufw allow from 10.0.0.5 to any port 5432    # PostgreSQL from app server only

# Allow a port range
sudo ufw allow 3000:4000/tcp

# Block a specific IP address
sudo ufw deny from 203.0.113.99

# Block an entire subnet
sudo ufw deny from 192.168.1.0/24
```

---

## 📖 Topic 4: Fail2Ban — Automatic Attack Blocking

**Fail2Ban** watches your log files and automatically bans IP addresses that show suspicious behavior — like repeated failed login attempts.

```bash
# Install Fail2Ban
sudo apt install fail2ban

# Enable and start
sudo systemctl enable fail2ban
sudo systemctl start fail2ban
```

### Configure Fail2Ban

```bash
# Never edit jail.conf directly — create a local override
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
sudo nano /etc/fail2ban/jail.local
```

```ini
[DEFAULT]
# Ban duration — 1 hour
bantime  = 3600

# Time window to count failures — 10 minutes
findtime = 600

# Number of failures before banning
maxretry = 3

# Your own IP — never get yourself banned
ignoreip = 127.0.0.1/8 YOUR.HOME.IP.ADDRESS

[sshd]
enabled  = true
port     = 2222              # Your custom SSH port
logpath  = /var/log/auth.log
maxretry = 3

[nginx-http-auth]
enabled = true

[nginx-limit-req]
enabled = true
```

```bash
# Restart to apply configuration
sudo systemctl restart fail2ban

# Check overall status
sudo fail2ban-client status

# Check SSH jail status (shows banned IPs)
sudo fail2ban-client status sshd

# Manually unban an IP address
sudo fail2ban-client set sshd unbanip 203.0.113.99

# Watch Fail2Ban activity live
sudo tail -f /var/log/fail2ban.log
```

---

## 📖 Topic 5: Keep Software Updated

Unpatched software is the **#1 cause of server breaches**. Keeping everything updated closes known vulnerabilities before attackers can exploit them.

```bash
# Update package list and upgrade all installed packages
sudo apt update && sudo apt upgrade -y

# Remove packages no longer needed
sudo apt autoremove -y

# Check if a system reboot is required after updates
cat /var/run/reboot-required

# Reboot when needed (schedule during low traffic)
sudo reboot
```

### Enable Automatic Security Updates

```bash
# Install unattended-upgrades
sudo apt install unattended-upgrades

# Enable it interactively
sudo dpkg-reconfigure --priority=low unattended-upgrades

# Fine-tune what gets automatically updated
sudo nano /etc/apt/apt.conf.d/50unattended-upgrades
```

```conf
Unattended-Upgrade::Allowed-Origins {
    "${distro_id}:${distro_codename}-security";    // ✅ Security patches only
    // "${distro_id}:${distro_codename}-updates";  // Optional: all updates
};

Unattended-Upgrade::AutoFixInterruptedDpkg "true";
Unattended-Upgrade::Remove-Unused-Dependencies "true";
Unattended-Upgrade::Automatic-Reboot "false";       // Don't reboot automatically
```

```bash
# Verify it works correctly (dry run — no changes made)
sudo unattended-upgrades --dry-run
```

---

## 📖 Topic 6: User & Privilege Management

### Principle of Least Privilege

> Every user, application, and process should have **only the minimum access it needs** — nothing more, nothing less.

```bash
# Create a dedicated non-root user for running apps
sudo adduser appuser

# Add to sudo group ONLY if truly necessary
sudo usermod -aG sudo appuser

# Check what groups a user belongs to
groups appuser
id appuser

# List all users on the system
cat /etc/passwd | cut -d: -f1

# Lock a user account — disables login without deleting
sudo usermod -L username

# Delete a user and remove their home directory
sudo deluser --remove-home username
```

### Check for Suspicious Users

```bash
# List users with UID 0 — should ONLY ever be root
awk -F: '($3 == "0") {print}' /etc/passwd

# List users with no password set (potential security hole)
sudo awk -F: '($2 == "") {print}' /etc/shadow

# See who is currently logged into the server
who
w

# View recent login history
last
lastlog
```

---

## 📖 Topic 7: File & Directory Permissions

```bash
# Find world-writable files — anyone can modify these (security risk)
find / -type f -perm -o+w 2>/dev/null

# Find SUID/SGID files — can be exploited for privilege escalation
find / -perm /6000 -type f 2>/dev/null

# Secure sensitive application files
chmod 600 /home/user/.env                       # Owner read/write only
chmod 600 /home/user/.ssh/authorized_keys       # Owner read/write only
chmod 700 /home/user/.ssh/                      # Owner access only
chmod 644 /etc/nginx/nginx.conf                 # Owner write, others read

# Set correct ownership of your web root
sudo chown -R www-data:www-data /var/www/html
sudo chmod -R 755 /var/www/html

# Verify ownership of critical system files
ls -la /etc/passwd /etc/shadow /etc/sudoers
```

---

## 📖 Topic 8: Nginx Security Headers

Security headers tell browsers how to behave when loading your site — protecting users from common web attacks like XSS, clickjacking, and MIME sniffing.

```nginx
# /etc/nginx/sites-available/mysite

server {
    listen 443 ssl;
    server_name mysite.com;

    # ── SSL Configuration ──────────────────────────────────
    ssl_certificate /etc/letsencrypt/live/mysite.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/mysite.com/privkey.pem;

    # Only allow modern, secure TLS versions
    ssl_protocols TLSv1.2 TLSv1.3;

    # Strong cipher suites only
    ssl_ciphers ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256;
    ssl_prefer_server_ciphers off;

    # ── Security Headers ───────────────────────────────────

    # Prevent clickjacking attacks
    add_header X-Frame-Options "SAMEORIGIN" always;

    # Prevent MIME type sniffing
    add_header X-Content-Type-Options "nosniff" always;

    # Enable XSS filter in older browsers
    add_header X-XSS-Protection "1; mode=block" always;

    # Force HTTPS for 1 full year (HSTS)
    add_header Strict-Transport-Security "max-age=31536000; includeSubDomains" always;

    # Control referrer information sent with requests
    add_header Referrer-Policy "strict-origin-when-cross-origin" always;

    # Content Security Policy — restrict where resources load from
    add_header Content-Security-Policy "default-src 'self'; script-src 'self'; style-src 'self' 'unsafe-inline';" always;

    # Hide Nginx version from attackers
    server_tokens off;

    # ── Rate Limiting ──────────────────────────────────────
    limit_req_zone $binary_remote_addr zone=api:10m rate=10r/s;

    location /api/ {
        limit_req zone=api burst=20 nodelay;
        proxy_pass http://localhost:3000;
    }

    location / {
        root /var/www/mysite;
        index index.html;
    }
}

# Redirect all HTTP traffic to HTTPS
server {
    listen 80;
    server_name mysite.com;
    return 301 https://$host$request_uri;
}
```

> 💡 Test your headers at [securityheaders.com](https://securityheaders.com) — aim for an **A or A+ rating**.

---

## 📖 Topic 9: Database Security

```bash
# ── PostgreSQL ─────────────────────────────────────────────

# Edit authentication rules
sudo nano /etc/postgresql/*/main/pg_hba.conf

# Allow only local connections — no remote access
local   all   all                 md5
host    all   all   127.0.0.1/32  md5
host    all   all   ::1/128       md5
# No entries for 0.0.0.0/0 — all remote connections blocked

# Bind PostgreSQL to localhost only
sudo nano /etc/postgresql/*/main/postgresql.conf
# listen_addresses = 'localhost'

sudo systemctl restart postgresql

# ── MySQL ──────────────────────────────────────────────────

# Check for accounts with remote root access
sudo mysql
SELECT user, host FROM mysql.user WHERE user='root';
# All root entries should show 'localhost' — NOT '%'

# Remove anonymous users
DELETE FROM mysql.user WHERE User='';
FLUSH PRIVILEGES;

# ── Firewall — block database ports from the outside ───────
sudo ufw deny 5432     # Block PostgreSQL from external access
sudo ufw deny 3306     # Block MySQL from external access
```

---

## 📖 Topic 10: Monitoring & Intrusion Detection

### Check for Suspicious Activity

```bash
# Failed SSH login attempts — who's trying to get in?
grep "Failed password" /var/log/auth.log | tail -20

# Successful logins — who actually got in?
grep "Accepted publickey" /var/log/auth.log | tail -20

# Sudo command usage — who ran admin commands?
grep "sudo" /var/log/auth.log | tail -20

# All open network connections right now
ss -tulpn
netstat -tulpn

# Processes using the most CPU (look for anything unexpected)
ps aux --sort=-%cpu | head -20

# Processes using the most memory
ps aux --sort=-%mem | head -20

# Check all active cron jobs for unexpected entries
crontab -l
sudo crontab -l
ls /etc/cron.d/
cat /etc/crontab

# Files modified in the last 24 hours (potential intrusion indicator)
find / -mtime -1 -type f 2>/dev/null | grep -v /proc | grep -v /sys
```

### Install rkhunter — Rootkit Detection

```bash
# Install rootkit hunter
sudo apt install rkhunter

# Update the signature database
sudo rkhunter --update

# Run a full system scan
sudo rkhunter --check

# Review the scan report
sudo cat /var/log/rkhunter.log
```

---

## 📖 Topic 11: Security Audit Checklist — Before Going Live

> Run through **every item** on this list before calling any server production-ready.

### SSH

```
[ ] Root login disabled                (PermitRootLogin no)
[ ] Password authentication disabled   (PasswordAuthentication no)
[ ] SSH key login tested and working
[ ] Default SSH port changed           (not 22)
[ ] SSH rate limiting enabled          (sudo ufw limit 2222/tcp)
```

### Firewall

```
[ ] UFW enabled                        (sudo ufw status)
[ ] Default deny incoming set          (sudo ufw default deny incoming)
[ ] Only required ports open           (2222, 80, 443)
[ ] Database ports blocked externally  (5432, 3306 — localhost only)
```

### Updates

```
[ ] All packages updated               (sudo apt update && upgrade)
[ ] Automatic security updates enabled (unattended-upgrades installed)
```

### Users

```
[ ] No unnecessary user accounts exist
[ ] All apps run as non-root users
[ ] Principle of least privilege applied throughout
```

### Fail2Ban

```
[ ] Fail2Ban installed and running     (sudo systemctl status fail2ban)
[ ] SSH jail configured and active
[ ] Nginx jail configured and active
```

### Web Server

```
[ ] HTTPS enforced everywhere          (HTTP redirects to HTTPS)
[ ] SSL certificate valid              (check at ssllabs.com/ssltest)
[ ] SSL auto-renewal working           (sudo certbot renew --dry-run)
[ ] All security headers configured    (test at securityheaders.com)
[ ] Nginx version hidden               (server_tokens off)
[ ] API rate limiting configured
```

### Database

```
[ ] Dedicated DB user per app          (not root or postgres superuser)
[ ] Strong passwords on all DB users
[ ] Databases bound to localhost only
[ ] Database ports blocked in firewall
[ ] Automated backups running and tested
```

### Application

```
[ ] All secrets stored in .env         (not hardcoded in source code)
[ ] .env excluded from Git             (in .gitignore)
[ ] Dependencies up to date            (npm audit / pip check)
[ ] Error messages don't expose stack traces in production
```

---

## ✅ Phase 9 Checklist

Before calling your server secure, make sure you can confidently tick all of these:

- [ ] Have you disabled root SSH login?
- [ ] Have you disabled password authentication for SSH?
- [ ] Have you changed the default SSH port away from 22?
- [ ] Is UFW configured with default deny incoming?
- [ ] Is Fail2Ban installed and actively protecting SSH and Nginx?
- [ ] Are automatic security updates enabled?
- [ ] Are all apps and services running as non-root users?
- [ ] Have you added all security headers to Nginx?
- [ ] Are all databases bound to localhost with ports firewalled?
- [ ] Can you pass every item on the pre-launch security checklist?

---

## 🎯 Phase 9 Hands-On Tasks

### Task 1 — SSH Hardening
> Disable root login, disable password authentication, and change your SSH port to `2222`. Verify you can still connect using your SSH key, then confirm root login is blocked.

### Task 2 — Firewall Lockdown
> Configure UFW with default deny. Open only ports `2222`, `80`, and `443`. Block ports `5432` and `3306`. Run `sudo ufw status verbose` and verify every rule is correct.

### Task 3 — Fail2Ban Setup
> Install and configure Fail2Ban with a 3-attempt limit. Simulate failed SSH logins from a second machine and watch Fail2Ban ban the IP. Then unban it manually using the CLI.

### Task 4 — Security Headers
> Add all security headers to your Nginx config. Test them at [securityheaders.com](https://securityheaders.com) and [ssllabs.com/ssltest](https://www.ssllabs.com/ssltest/). Aim for an **A+ rating** on both.

### Task 5 — Full Security Audit
> Take a fresh server, deploy your full app stack on it, and go through the **complete pre-launch security checklist** above — checking off every single item before declaring it production-ready.

---

## 📚 Resources for Phase 9

| Resource | Type | Link |
|----------|------|-------|
| DigitalOcean Security Guides | 📄 Guides | [digitalocean.com/community](https://www.digitalocean.com/community/tags/security) |
| Security Headers Tester | 🛠️ Tool | [securityheaders.com](https://securityheaders.com) |
| SSL Labs SSL Test | 🛠️ Tool | [ssllabs.com/ssltest](https://www.ssllabs.com/ssltest/) |
| Fail2Ban Official Docs | 📄 Docs | [fail2ban.org](https://www.fail2ban.org/wiki/index.php/Main_Page) |
| Linux Hardening Guide | 📄 Guide | [madaidans-insecurities.github.io](https://madaidans-insecurities.github.io/guides/linux-hardening.html) |
| OWASP Top 10 Web Vulnerabilities | 📄 Docs | [owasp.org/Top10](https://owasp.org/www-project-top-ten/) |

---

## 🎉 YOU HAVE COMPLETED THE FULL SERVER MASTERY ROADMAP!

```
Phase 1  ✅  Foundation             — Client-Server, HTTP, DNS, OSI
Phase 2  ✅  Linux & Command Line   — Terminal, SSH, Permissions, Logs
Phase 3  ✅  Networking             — IPs, Ports, Firewalls, DNS, HTTP
Phase 4  ✅  Web Servers            — Nginx, Virtual Hosts, Reverse Proxy, HTTPS
Phase 5  ✅  App Deployment         — PM2, Systemd, Env Vars, CI Deploy
Phase 6  ✅  Databases              — PostgreSQL, MySQL, Redis, Backups
Phase 7  ✅  Docker & Containers    — Images, Compose, Volumes, Networks
Phase 8  ✅  Cloud & DevOps         — AWS, GitHub Actions, Terraform, Grafana
Phase 9  ✅  Security Hardening     — SSH, Firewall, Fail2Ban, Headers, Audit
```

> 🚀 You are no longer a beginner. You are a **Server Engineer**.  
> Now build something real, deploy it, secure it, and keep it running. That's the job.

---

> 💬 **Final Tip:** Security is not a one-time setup — it's an ongoing discipline. Review your servers monthly. Update packages regularly. Check your logs. Run security audits. The best server engineers treat security as a daily habit, not a checkbox.