# 🧱 Phase 1 — Foundation (Weeks 1–3)

> **Goal:** Understand what a server actually is before touching any code.  
> No prior knowledge needed — start here from absolute zero.

---

## 📌 Table of Contents

- [Topic 1 — What is a Server?](#-topic-1-what-is-a-server)
- [Topic 2 — Client–Server Model](#-topic-2-clientserver-model)
- [Topic 3 — How the Internet Works](#-topic-3-how-the-internet-works)
- [Topic 4 — The OSI Model](#-topic-4-the-osi-model-7-layers)
- [Topic 5 — Request & Response Cycle](#-topic-5-request--response-cycle)
- [Topic 6 — TCP vs UDP](#-topic-6-tcp-vs-udp)
- [Phase 1 Checklist](#-phase-1-checklist)
- [Phase 1 Task](#-phase-1-task)
- [Resources](#-resources-for-phase-1)

---

## 📖 Topic 1: What is a Server?

Think of the internet like a **restaurant**:

- 🧑 **You (the client)** sit at a table and place an order
- 🍽️ **The waiter** carries your request and brings back the response
- 👨‍🍳 **The kitchen (the server)** is where everything is actually prepared

A **server** is just a computer that *serves* data to other computers.  
It's always on, always listening, and responds whenever someone asks for something.

### Types of Servers

| Type | What it does | Example |
|------|-------------|---------|
| Web Server | Serves HTML/CSS/JS files | Nginx, Apache |
| App Server | Runs your backend logic | Node.js, Django |
| Database Server | Stores & retrieves data | PostgreSQL, MySQL |
| File Server | Stores and shares files | FTP, NFS |
| Mail Server | Handles emails | Postfix, Gmail |

---

## 📖 Topic 2: Client–Server Model

```
Client                        Server
  |                              |
  |  --- HTTP Request -------->  |
  |                              |  (processes request)
  |  <-- HTTP Response --------  |
  |                              |
```

| Role | Description |
|------|-------------|
| **Client** | Your browser, mobile app, or any program making a request |
| **Server** | The machine receiving and responding to that request |
| **Protocol** | The agreed set of rules they use to communicate (e.g. HTTP) |

---

## 📖 Topic 3: How the Internet Works

### 🔹 IP Address
Every device on the internet has an **IP address** — like a home address for your computer.

```
Private IP:  192.168.1.1       ← inside your home/office network
Public IP:   142.250.190.46    ← visible to the outside world (e.g. Google)
```

---

### 🔹 DNS (Domain Name System)

Humans remember names. Computers remember numbers. DNS bridges the gap.

```
You type:      google.com
DNS resolves:  → 142.250.190.46
Browser goes:  → that IP address
```

> 💡 Think of DNS as the **phonebook of the internet**.

---

### 🔹 HTTP vs HTTPS

| Protocol | Stands For | Secure? | Use |
|----------|-----------|---------|-----|
| HTTP | HyperText Transfer Protocol | ❌ No — plain text | Never in production |
| HTTPS | HTTP + SSL/TLS Encryption | ✅ Yes — encrypted | Always in production |

> ⚠️ Always use **HTTPS** in production. Always.

---

### 🔹 Ports

A port is like a **door** on a server. Different services listen on different doors.

| Port | Service |
|------|---------|
| `80` | HTTP |
| `443` | HTTPS |
| `22` | SSH |
| `3306` | MySQL |
| `5432` | PostgreSQL |
| `27017` | MongoDB |
| `6379` | Redis |

> 💡 When you visit `google.com`, your browser secretly connects to `google.com:443`

---

## 📖 Topic 4: The OSI Model (7 Layers)

You don't need to memorize this deeply yet — just understand the concept.  
Data travels through **7 layers** when moving from one device to another.

```
Layer 7 — Application   → What you use        (HTTP, FTP, DNS)
Layer 6 — Presentation  → Data format          (SSL/TLS, encryption)
Layer 5 — Session       → Manages connections
Layer 4 — Transport     → Delivery method      (TCP / UDP)
Layer 3 — Network       → Routing via IPs      (IP addresses)
Layer 2 — Data Link     → MAC addresses        (switches)
Layer 1 — Physical      → Cables, WiFi signals
```

> 🧠 **Memory Trick (top → bottom):**  
> _"All People Seem To Need Data Processing"_

### Layers You'll Use Most as a Server Engineer

| Layer | Why It Matters |
|-------|----------------|
| Layer 7 (Application) | HTTP, DNS — what you configure daily |
| Layer 4 (Transport) | TCP vs UDP — how data is delivered |
| Layer 3 (Network) | IP addresses — how traffic is routed |

---

## 📖 Topic 5: Request & Response Cycle

Here's **exactly** what happens when you type `https://google.com` and hit Enter:

```
Step 1  → Browser checks local DNS cache
Step 2  → Asks DNS resolver: "What's the IP for google.com?"
Step 3  → DNS returns IP: 142.250.190.46
Step 4  → Browser opens TCP connection to that IP on port 443
Step 5  → SSL/TLS handshake (secure connection established)
Step 6  → Browser sends HTTP GET request:

          GET / HTTP/1.1
          Host: google.com
          User-Agent: Chrome/...

Step 7  → Google's server processes the request
Step 8  → Server sends HTTP Response:

          HTTP/1.1 200 OK
          Content-Type: text/html

          <html>...</html>

Step 9  → Browser renders the HTML page on your screen
```

> ⚡ All of this happens in **milliseconds**.

---

## 📖 Topic 6: TCP vs UDP

These are the two main **transport protocols** — how data packets are actually delivered.

| Feature | TCP | UDP |
|---------|-----|-----|
| Full Form | Transmission Control Protocol | User Datagram Protocol |
| Reliable? | ✅ Guarantees delivery | ❌ Fire and forget |
| Speed | Slower | Faster |
| Order Guaranteed? | ✅ Yes | ❌ No |
| Use Case | Websites, emails, file transfers | Video streaming, gaming, DNS |

> 💡 HTTP uses **TCP** — because every single byte of a webpage must arrive correctly.

---

## ✅ Phase 1 Checklist

Before moving to Phase 2, make sure you can confidently answer all of these:

- [ ] What is a server and how does it differ from a client?
- [ ] What is an IP address? What is the difference between public and private?
- [ ] What does DNS do? Explain it in plain English.
- [ ] What is the difference between HTTP and HTTPS?
- [ ] What are ports? What port does SSH use? What about HTTPS?
- [ ] Explain the OSI model in your own words.
- [ ] Walk through what happens step-by-step when you visit a website.
- [ ] What is the difference between TCP and UDP? When would you use each?

---

## 🎯 Phase 1 Hands-On Task

> Open your browser, go to **any website**, and open **DevTools → Network Tab**  
> *(Press `F12` or `Ctrl+Shift+I` → click the Network tab → reload the page)*

**Observe and note down:**

- The HTTP requests being made
- HTTP status codes — `200` (OK), `301` (Redirect), `404` (Not Found)
- Request & Response headers being sent
- How long each request takes (ms)

This will make everything above feel **real**.

---

## 📚 Resources for Phase 1

| Resource | Type | Where to Find |
|----------|------|---------------|
| NetworkChuck — How the Internet Works | 🎥 YouTube | Search on YouTube |
| CS50 Web Programming — Lecture 0 | 🎥 Video | [cs50.harvard.edu/web](https://cs50.harvard.edu/web) |
| How DNS Works (interactive comic) | 📖 Article | [howdns.works](https://howdns.works) |
| MDN — HTTP Overview | 📄 Docs | [developer.mozilla.org](https://developer.mozilla.org/en-US/docs/Web/HTTP/Overview) |
| Cloudflare Learning Center | 📄 Docs | [cloudflare.com/learning](https://www.cloudflare.com/learning/) |

---

## ⏭️ What's Next?

Once you've gone through all topics and ticked off the checklist, you're ready for:

### 👉 [Phase 2 — Linux & Command Line](./PHASE_2_LINUX.md)

> You'll learn to navigate servers like a pro using the terminal — the most essential skill in your server journey. 🐧

---

> 💬 **Tip:** Don't rush. Spend time on each topic until it *clicks*. A strong foundation here makes everything else easier.