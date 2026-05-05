# 🌍 Phase 3 — Networking Fundamentals (Weeks 6–8)

> **Goal:** Understand how data actually moves across the internet.  
> This is the backbone of everything you'll do as a server engineer.

---

## 📌 Table of Contents

- [Topic 1 — IP Addresses](#-topic-1-ip-addresses)
- [Topic 2 — Subnets & CIDR Notation](#-topic-2-subnets--cidr-notation)
- [Topic 3 — DNS Deep Dive](#-topic-3-dns-deep-dive)
- [Topic 4 — Ports & Protocols](#-topic-4-ports--protocols)
- [Topic 5 — Firewalls](#-topic-5-firewalls)
- [Topic 6 — NAT & Routing](#-topic-6-nat--routing)
- [Topic 7 — HTTP Deep Dive](#-topic-7-http-deep-dive)
- [Topic 8 — Useful Networking Tools](#-topic-8-useful-networking-tools)
- [Phase 3 Checklist](#-phase-3-checklist)
- [Phase 3 Hands-On Tasks](#-phase-3-hands-on-tasks)
- [Resources](#-resources-for-phase-3)

---

## 📖 Topic 1: IP Addresses

Every device on a network has an **IP address** — like a home address for your computer.

### IPv4 vs IPv6

| Feature | IPv4 | IPv6 |
|---------|------|------|
| Format | `192.168.1.1` | `2001:0db8:85a3::8a2e:0370:7334` |
| Length | 32-bit | 128-bit |
| Total Addresses | ~4.3 billion | 340 undecillion |
| Status | Running out | The future |

### Public vs Private IP

```
Private IPs (inside your network — not visible on the internet):
  10.0.0.0    – 10.255.255.255
  172.16.0.0  – 172.31.255.255
  192.168.0.0 – 192.168.255.255

Public IPs (visible on the internet — assigned by your ISP):
  Everything else — e.g. 142.250.190.46 (Google)
```

> 💡 Your home router has **one public IP** but gives **private IPs** to all devices inside (laptop, phone, etc.)

### Special IPs to Know

| IP | Meaning |
|----|---------|
| `127.0.0.1` | Localhost — your own machine |
| `0.0.0.0` | All interfaces — listen on everything |
| `255.255.255.255` | Broadcast — send to everyone on the network |

---

## 📖 Topic 2: Subnets & CIDR Notation

A **subnet** divides a large network into smaller chunks. CIDR notation tells you how big a network is.

```
192.168.1.0/24

          192.168.1  .  0
          └─────────┘   └── Host part (individual devices)
          Network part

/24 means: first 24 bits are the network
           last 8 bits are for devices = 256 addresses (254 usable)
```

### Common CIDR Ranges

| CIDR | Subnet Mask | Usable Hosts | Common Use |
|------|------------|-------------|-----------|
| `/32` | `255.255.255.255` | 1 | Single host |
| `/24` | `255.255.255.0` | 254 | Small office / home network |
| `/16` | `255.255.0.0` | 65,534 | Large network |
| `/8` | `255.0.0.0` | 16M+ | Huge network |

> 💡 You'll see `/24` constantly in server configs — it means a network of up to 254 devices.

---

## 📖 Topic 3: DNS Deep Dive

DNS converts `google.com` into `142.250.190.46`. Let's go deeper than Phase 1.

### Full DNS Resolution Flow

```
You type: google.com

Step 1 → Check browser DNS cache (visited before?)
Step 2 → Check OS cache (/etc/hosts file)
Step 3 → Ask Recursive Resolver (your ISP or 8.8.8.8)
Step 4 → Resolver asks Root Nameserver → "Who handles .com?"
Step 5 → Root says → "Ask the .com TLD server"
Step 6 → TLD server says → "Ask Google's nameserver"
Step 7 → Google's nameserver returns → 142.250.190.46
Step 8 → Result is cached & returned to your browser
```

### DNS Record Types

| Record | Purpose | Example |
|--------|---------|---------|
| `A` | Maps domain to IPv4 address | `google.com → 142.250.190.46` |
| `AAAA` | Maps domain to IPv6 address | `google.com → 2607:f8b0::...` |
| `CNAME` | Alias pointing to another domain | `www.google.com → google.com` |
| `MX` | Mail server for the domain | `google.com → mail.google.com` |
| `TXT` | Text info — used for verification | SPF, DKIM, domain ownership |
| `NS` | Nameservers for the domain | `google.com → ns1.google.com` |
| `PTR` | Reverse DNS lookup (IP → domain) | `142.250.190.46 → google.com` |

### Useful DNS Commands

```bash
# Look up a domain
nslookup google.com
dig google.com

# Look up specific record types
dig google.com A
dig google.com MX
dig google.com NS

# Reverse DNS lookup (IP to domain)
dig -x 142.250.190.46

# Check your local DNS config
cat /etc/resolv.conf

# The hosts file — overrides DNS locally
cat /etc/hosts
```

> 💡 You can add entries to `/etc/hosts` to override DNS on your machine — great for local testing.

---

## 📖 Topic 4: Ports & Protocols

A **port** is a logical endpoint on a server. Think of it like different desks in an office — each desk handles a specific type of work.

### Well-Known Ports (0–1023)

| Port | Protocol | Service |
|------|---------|---------|
| `20/21` | FTP | File Transfer |
| `22` | SSH | Secure remote login |
| `25` | SMTP | Sending emails |
| `53` | DNS | Domain name resolution |
| `80` | HTTP | Web traffic |
| `110` | POP3 | Receiving emails |
| `143` | IMAP | Email access |
| `443` | HTTPS | Secure web traffic |
| `3306` | MySQL | Database |
| `5432` | PostgreSQL | Database |
| `6379` | Redis | Cache |
| `27017` | MongoDB | Database |

### Port Ranges

```
0     – 1023   → Well-known ports (require root to bind)
1024  – 49151  → Registered ports (apps like Node.js :3000, React :3000)
49152 – 65535  → Dynamic/ephemeral ports (used by OS for outgoing connections)
```

### Check Open Ports on Your Server

```bash
# See what's listening
ss -tulpn

# Example output:
# tcp  LISTEN  0  128  0.0.0.0:80   → Nginx listening on port 80
# tcp  LISTEN  0  128  0.0.0.0:22   → SSH listening on port 22

# Check if a specific port is open on a remote server
nc -zv google.com 443
telnet google.com 80
```

---

## 📖 Topic 5: Firewalls

A **firewall** controls what traffic is allowed in and out of your server.  
Think of it as a **security guard at the door** — checking every packet before it gets in.

### UFW — Uncomplicated Firewall (Ubuntu)

```bash
# Check firewall status
sudo ufw status

# Enable the firewall
sudo ufw enable

# Allow specific ports
sudo ufw allow 22          # SSH
sudo ufw allow 80          # HTTP
sudo ufw allow 443         # HTTPS

# Allow by service name
sudo ufw allow ssh
sudo ufw allow http
sudo ufw allow https

# Deny a port
sudo ufw deny 3306

# Delete a rule
sudo ufw delete allow 3306

# Allow from a specific IP only
sudo ufw allow from 192.168.1.100 to any port 22

# See all rules with numbers
sudo ufw status numbered
```

> ⚠️ **Critical:** Always allow SSH (port 22) **BEFORE** enabling the firewall — otherwise you'll lock yourself out of the server permanently!

### Firewall Traffic Flow

```
Incoming Request
       |
       ▼
  [ Firewall ]
       |
  ┌────┴────┐
  │  Rules  │
  └────┬────┘
       |
  ┌────┴──────────┐
  │               │
ALLOW           DENY
  │               │
  ▼               ▼
Server          Dropped
(processes)     (silently ignored)
```

---

## 📖 Topic 6: NAT & Routing

### NAT (Network Address Translation)

NAT is how **multiple devices share one public IP address**.

```
Your Home Network:
  Laptop  → 192.168.1.10  ─┐
  Phone   → 192.168.1.11  ─┤──► Router (NAT) ──► Public IP: 203.0.113.5
  PC      → 192.168.1.12  ─┘

When your laptop visits google.com:
  Laptop sends:   192.168.1.10  → 142.250.190.46
  Router changes: 203.0.113.5   → 142.250.190.46  (replaces private with public)
  Google responds to: 203.0.113.5
  Router routes back to: 192.168.1.10
```

### Routing

A **router** decides where to send packets based on a routing table.

```bash
# View your server's routing table
ip route show

# Example output:
# default via 10.0.0.1 dev eth0       ← Default gateway (send unknown traffic here)
# 10.0.0.0/24 dev eth0 proto kernel   ← Local network range
```

### Default Gateway

The **default gateway** is where your server sends traffic it doesn't know how to route locally — usually your router or your cloud provider's gateway.

---

## 📖 Topic 7: HTTP Deep Dive

You use HTTP every day — now understand it at a deeper level.

### HTTP Methods

| Method | Purpose | Example Use |
|--------|---------|-------------|
| `GET` | Retrieve data | Load a webpage |
| `POST` | Send data to server | Submit a form |
| `PUT` | Update / replace data | Update a full profile |
| `PATCH` | Partially update data | Change just an email |
| `DELETE` | Delete data | Remove a post |

### HTTP Status Codes

| Code | Meaning | When You See It |
|------|---------|----------------|
| `200` | OK | Everything worked ✅ |
| `201` | Created | New resource was created |
| `301` | Moved Permanently | Domain redirected |
| `302` | Found (Temporary Redirect) | Temporary redirect |
| `400` | Bad Request | Client sent wrong/malformed data |
| `401` | Unauthorized | Login required |
| `403` | Forbidden | Logged in but no permission |
| `404` | Not Found | Page doesn't exist |
| `500` | Internal Server Error | Server crashed |
| `502` | Bad Gateway | Reverse proxy issue |
| `503` | Service Unavailable | Server overloaded or down |

### HTTP Request Anatomy

```
GET /api/users HTTP/1.1
Host: example.com
Authorization: Bearer eyJhbGc...
Content-Type: application/json
User-Agent: Mozilla/5.0

{
  "name": "John"
}
```

### HTTP Response Anatomy

```
HTTP/1.1 200 OK
Content-Type: application/json
Content-Length: 42
Cache-Control: max-age=3600

{
  "id": 1,
  "name": "John",
  "email": "john@example.com"
}
```

---

## 📖 Topic 8: Useful Networking Tools

```bash
# Test connectivity
ping google.com                        # Basic connectivity test
ping -c 4 google.com                   # Send exactly 4 pings

# Trace the route packets take to a destination
traceroute google.com                  # Linux
tracert google.com                     # Windows

# DNS lookup
dig google.com
nslookup google.com

# Check if a port is open on a remote server
nc -zv google.com 443
nmap -p 80,443 google.com             # Port scanner

# Make HTTP requests from the terminal
curl https://api.github.com
curl -I https://google.com            # Show only response headers
curl -X POST -d '{"name":"John"}' https://api.example.com

# Monitor network traffic live
iftop                                 # Live bandwidth usage by connection
nethogs                               # Bandwidth usage by process
```

---

## ✅ Phase 3 Checklist

Before moving to Phase 4, make sure you can confidently answer all of these:

- [ ] Can you explain the difference between public and private IP addresses?
- [ ] Do you understand what CIDR notation means? (e.g. what does `/24` mean?)
- [ ] Can you explain how DNS resolves a domain name, step by step?
- [ ] Do you know the most common DNS record types — A, CNAME, MX, TXT?
- [ ] Can you list at least 8 common ports and their services?
- [ ] Can you set up UFW firewall rules correctly on Ubuntu?
- [ ] Do you understand what NAT is and why it's needed?
- [ ] Can you use `dig`, `curl`, `ss`, and `ping` confidently?
- [ ] Do you know the most common HTTP status codes and what they mean?
- [ ] Can you read and understand an HTTP request and response?

---

## 🎯 Phase 3 Hands-On Tasks

### Task 1 — DNS Investigation
> Use `dig` to look up the `A`, `MX`, and `NS` records for your favorite website.  
> Try to trace how the domain resolves step by step.

### Task 2 — Port Scanning
> Run `ss -tulpn` on your server and identify every service that's listening — note the port and process name.

### Task 3 — Firewall Setup
> On your Ubuntu server, configure UFW to **only allow** ports `22`, `80`, and `443`.  
> Deny everything else. Test by trying to connect on a blocked port.

### Task 4 — HTTP Inspection
> Run the following and read every part of the output:
> ```bash
> curl -I https://google.com
> ```
> What status code do you get? What do the headers tell you?

### Task 5 — Hosts File Override
> Add this line to `/etc/hosts`:
> ```
> 127.0.0.1   mysite.local
> ```
> Then run `ping mysite.local` to confirm it resolves locally without DNS.

---

## 📚 Resources for Phase 3

| Resource | Type | Link |
|----------|------|-------|
| Cloudflare Learning Center | 📄 Docs | [cloudflare.com/learning](https://www.cloudflare.com/learning/) |
| How DNS Works (interactive comic) | 📖 Visual | [howdns.works](https://howdns.works) |
| Julia Evans — Networking Zines | 📖 Visual | [jvns.ca](https://jvns.ca) |
| NetworkChuck — Networking Series | 🎥 YouTube | Search on YouTube |
| Subnetting Practice | 🎮 Practice | [subnettingpractice.com](https://subnettingpractice.com) |
| MDN — HTTP Overview | 📄 Docs | [developer.mozilla.org](https://developer.mozilla.org/en-US/docs/Web/HTTP) |

---

## ⏭️ What's Next?

Once you've completed the checklist and all hands-on tasks:

### 👉 [Phase 4 — Web Servers (Nginx & Apache)](./PHASE_4_WEBSERVERS.md) ⚙️

> You'll install and configure real web servers, set up SSL/HTTPS, serve content to the world, and configure reverse proxies.

---

> 💬 **Tip:** Networking clicks differently for everyone. If subnetting or DNS feels confusing, draw it out on paper — visual diagrams make it much clearer than text alone.