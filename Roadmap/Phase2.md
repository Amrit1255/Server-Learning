# 🐧 Phase 2 — Linux & Command Line (Weeks 3–6)

> **Goal:** Servers run on Linux — you must speak its language.  
> No GUI, no shortcuts — just you and the terminal.

---

## 📌 Table of Contents

- [Topic 1 — Why Linux?](#-topic-1-why-linux)
- [Topic 2 — The Linux File System](#-topic-2-the-linux-file-system)
- [Topic 3 — Essential Linux Commands](#-topic-3-essential-linux-commands)
- [Topic 4 — Users & Groups](#-topic-4-users--groups)
- [Topic 5 — SSH — Connecting to Remote Servers](#-topic-5-ssh--connecting-to-remote-servers)
- [Topic 6 — File Editing — Nano & Vim](#-topic-6-file-editing--nano--vim)
- [Topic 7 — Package Management](#-topic-7-package-management)
- [Topic 8 — Logs — Your Best Friend](#-topic-8-logs--your-best-friend)
- [Phase 2 Checklist](#-phase-2-checklist)
- [Phase 2 Hands-On Tasks](#-phase-2-hands-on-tasks)
- [Resources](#-resources-for-phase-2)

---

## 📖 Topic 1: Why Linux?

Almost **every server in the world runs Linux**.  
AWS, Google Cloud, Netflix, Facebook — all Linux under the hood.

| Feature | Linux | Windows Server |
|---------|-------|---------------|
| Cost | ✅ Free & Open Source | ❌ Expensive license |
| Performance | ✅ Lightweight & fast | ❌ Heavy |
| Stability | ✅ Runs for years without restart | ❌ Needs frequent reboots |
| Control | ✅ Full control over everything | ❌ Limited |
| Community | ✅ Massive support | ❌ Smaller for servers |

### Most Popular Linux Distros for Servers

| Distro | Best For |
|--------|----------|
| **Ubuntu Server** | ✅ Beginners — start here |
| **CentOS / Rocky Linux** | Enterprise environments |
| **Debian** | Super stable, minimal setups |
| **Amazon Linux** | AWS cloud servers |

---

## 📖 Topic 2: The Linux File System

Everything in Linux is a file — even hardware devices. Here's the full structure:

```
/                   ← Root (top of everything)
├── etc/            ← Configuration files (nginx.conf, ssh config)
├── var/            ← Variable data (logs, databases)
│   └── log/        ← All log files live here
├── home/           ← User home directories
│   └── yourname/   ← Your personal files
├── usr/            ← Installed programs & libraries
├── bin/            ← Essential commands (ls, cp, mv)
├── tmp/            ← Temporary files (cleared on reboot)
├── root/           ← Home folder for the root user
└── mnt/            ← Mount point for external drives
```

> 💡 The folders you'll live in most: `/etc`, `/var/log`, `/home`

---

## 📖 Topic 3: Essential Linux Commands

This is your **survival kit**. Learn these until they're muscle memory.

---

### 🔹 Navigation

```bash
pwd               # Print current directory (Where am I?)
ls                # List files in current directory
ls -la            # List all files including hidden, with details
cd /etc           # Change into /etc directory
cd ..             # Go one level up
cd ~              # Go to your home directory
```

---

### 🔹 Files & Directories

```bash
mkdir myproject          # Create a new directory
touch file.txt           # Create an empty file
cp file.txt backup.txt   # Copy a file
mv file.txt /tmp/        # Move a file (also used to rename)
rm file.txt              # Delete a file
rm -rf myfolder/         # Delete a folder and everything inside ⚠️
cat file.txt             # Print file contents to terminal
less file.txt            # View file page by page (q to quit)
nano file.txt            # Edit a file in nano editor
```

> ⚠️ **Warning:** `rm -rf` permanently deletes everything with no undo. Always double-check before running it.

---

### 🔹 Searching & Finding

```bash
grep "error" file.txt          # Search for "error" inside a file
grep -r "error" /var/log/      # Search recursively in a folder
find / -name "nginx.conf"      # Find a file by name
find /var -size +100M          # Find files larger than 100MB
```

---

### 🔹 Permissions

```bash
ls -la                  # See file permissions
chmod 755 script.sh     # Change file permissions
chmod +x script.sh      # Make file executable
chown user:group file   # Change file owner
sudo command            # Run command as superuser (admin)
```

**Understanding Permission Strings:**

```
-rwxr-xr-x   1   root   root   4096   Feb 19   file.sh
 |||||||||||
 |└──┬──┘└──┬──┘└──┬──┘
 |   |      |      └── Others: r-x (read + execute)
 |   |      └───────── Group:  r-x (read + execute)
 |   └──────────────── Owner:  rwx (read + write + execute)
 └──────────────────── File type: - (file), d (directory)
```

**Permission Number Reference:**

| Number | Permission | Meaning |
|--------|-----------|---------|
| `7` | `rwx` | Read + Write + Execute |
| `6` | `rw-` | Read + Write |
| `5` | `r-x` | Read + Execute |
| `4` | `r--` | Read only |
| `0` | `---` | No permission |

---

### 🔹 Process Management

```bash
ps aux                  # List all running processes
top                     # Live process monitor (like Task Manager)
htop                    # Better version of top (install separately)
kill 1234               # Kill process with PID 1234
kill -9 1234            # Force kill a process
pkill nginx             # Kill a process by name
```

---

### 🔹 Disk & Memory

```bash
df -h                   # Disk usage (human readable)
du -sh /var/log/        # Size of a specific folder
free -h                 # RAM usage
uname -a                # System info (OS, kernel version)
uptime                  # How long the server has been running
```

---

### 🔹 Networking Commands

```bash
ip a                                 # Show IP addresses
ping google.com                      # Test connectivity
curl https://google.com              # Make an HTTP request from terminal
wget https://example.com/file.zip    # Download a file
netstat -tulpn                       # Show open ports & listening services
ss -tulpn                            # Modern alternative to netstat
```

---

## 📖 Topic 4: Users & Groups

Linux is a **multi-user** system — every file and process is owned by someone.

```bash
whoami                  # Who am I logged in as?
id                      # Show user ID and group info
adduser john            # Create a new user
usermod -aG sudo john   # Add john to the sudo group (admin access)
su - john               # Switch to user john
passwd john             # Change john's password
cat /etc/passwd         # List all users on the system
```

### Key System Users

| User | Role |
|------|------|
| `root` | Superuser — full access to everything. Use carefully. |
| `www-data` | Default user for Nginx / Apache web servers |
| `your user` | Your personal account — always work here, not as root |

> 💡 **Golden Rule:** Never run your server or apps as `root`. Always use a regular user with `sudo` access.

---

## 📖 Topic 5: SSH — Connecting to Remote Servers

**SSH (Secure Shell)** is how you connect to and control a remote server from your local terminal.

```bash
# Basic connection
ssh username@server-ip

# Example
ssh john@192.168.1.100

# Connect on a custom port
ssh -p 2222 john@192.168.1.100

# Connect using an SSH key file
ssh -i ~/.ssh/mykey.pem john@192.168.1.100
```

---

### 🔑 SSH Keys — Password-Free Login

SSH keys are **safer and more convenient** than passwords. Always use them.

```bash
# Step 1: Generate a key pair on YOUR local machine
ssh-keygen -t ed25519 -C "your@email.com"

# Step 2: Copy your public key to the server
ssh-copy-id john@192.168.1.100

# Step 3: Now login without a password
ssh john@192.168.1.100
```

**How SSH Keys Work:**

```
Your Machine                    Remote Server
     |                               |
     |  Has: Private Key 🔑          |  Has: Public Key 🔓
     |                               |
     |  ---- "Hey, it's me!" ------> |
     |                               |  (checks if keys match)
     |  <--- "Access granted!" ----- |
     |                               |
```

> 🔐 Your **private key** never leaves your machine. The server only stores your **public key**.

---

## 📖 Topic 6: File Editing — Nano & Vim

You'll constantly edit config files on servers. No GUI — just terminal editors.

---

### Nano (Beginner Friendly ✅ — Start Here)

```bash
nano filename.txt
```

| Shortcut | Action |
|----------|--------|
| `Ctrl + O` | Save file |
| `Ctrl + X` | Exit |
| `Ctrl + K` | Cut a line |
| `Ctrl + U` | Paste a line |
| `Ctrl + W` | Search |

---

### Vim (Powerful — Steeper Learning Curve)

```bash
vim filename.txt
```

**Vim has Modes — this trips up every beginner:**

| Mode | How to Enter | Purpose |
|------|-------------|---------|
| Normal | Default / Press `Esc` | Navigate the file |
| Insert | Press `i` | Type and edit text |
| Command | Press `Esc` then `:` | Save, quit, search |

**Essential Vim Commands:**

```bash
i          # Enter insert mode (start typing)
Esc        # Return to normal mode
:w         # Save file
:q         # Quit
:wq        # Save and quit
:q!        # Quit WITHOUT saving (force quit)
dd         # Delete current line
/word      # Search for "word"
n          # Jump to next search result
```

> 💡 **Tip:** Start with **nano** — it's simple and gets the job done. Learn Vim gradually as you get comfortable.

---

## 📖 Topic 7: Package Management

Installing software on Linux is done via a **package manager** — no downloading `.exe` files here.

```bash
# Ubuntu / Debian — uses apt
sudo apt update                    # Refresh the package list
sudo apt upgrade                   # Upgrade all installed packages
sudo apt install nginx             # Install nginx
sudo apt remove nginx              # Uninstall nginx
sudo apt search nginx              # Search for a package

# CentOS / Rocky Linux — uses dnf
sudo dnf install nginx
sudo dnf update
sudo dnf remove nginx
```

> 💡 Always run `sudo apt update` before installing anything to get the latest package list.

---

## 📖 Topic 8: Logs — Your Best Friend

When something breaks on a server (and it will 😅), **logs tell you exactly why**.

```bash
# System logs
cat /var/log/syslog                    # General system log (Ubuntu)
cat /var/log/messages                  # General system log (CentOS)

# Live log watching — most useful command in production!
tail -f /var/log/syslog                # Watch system logs in real time
tail -f /var/log/nginx/access.log      # Watch nginx access logs live
tail -f /var/log/nginx/error.log       # Watch nginx error logs live

# Systemd service logs
journalctl -xe                         # View recent system service logs
journalctl -u nginx                    # Logs for nginx service specifically
journalctl -f                          # Follow all logs in real time
```

> 💡 `tail -f` is one of the **most-used commands** in real server work. Get comfortable with it.

---

## ✅ Phase 2 Checklist

Before moving to Phase 3, make sure you can confidently tick all of these:

- [ ] Can you navigate the Linux file system without hesitation?
- [ ] Do you know what `/etc`, `/var/log`, and `/home` are for?
- [ ] Can you create, move, copy, and delete files from the terminal?
- [ ] Do you understand Linux file permissions (`rwx` / `755` / `644`)?
- [ ] Can you create users and assign them to groups with `sudo` access?
- [ ] Can you SSH into a remote server using an SSH key?
- [ ] Can you edit config files with `nano`?
- [ ] Can you install and remove packages with `apt`?
- [ ] Can you monitor running processes with `ps` and `top`?
- [ ] Can you read and follow logs in real time with `tail -f`?

---

## 🎯 Phase 2 Hands-On Tasks

### Task 1 — Set Up Your Lab
> Install **Ubuntu Server** on [VirtualBox](https://www.virtualbox.org/) (free & local)  
> OR spin up a cheap VPS on **DigitalOcean** ($4/mo) or **AWS Free Tier**.

### Task 2 — Explore the File System
> Navigate to `/etc`, `/var/log`, and `/home` — list what's inside each one and understand what you see.

### Task 3 — Create a User
> Create a new user called `devuser`, give it `sudo` access, and switch into it using `su`.

### Task 4 — SSH Key Login
> Generate an SSH key pair on your local machine and set up **password-free login** to your server.

### Task 5 — Install & Monitor
> Install `nginx`, verify it's running with `ps aux | grep nginx`, then watch its logs live with:
> ```bash
> tail -f /var/log/nginx/access.log
> ```

---

## 📚 Resources for Phase 2

| Resource | Type | Link |
|----------|------|-------|
| The Linux Command Line (free book) | 📖 Book | [linuxcommand.org](http://linuxcommand.org/tlcl.php) |
| OverTheWire: Bandit | 🎮 Game/Puzzle | [overthewire.org/wargames/bandit](https://overthewire.org/wargames/bandit/) |
| Linux Journey | 📄 Interactive | [linuxjourney.com](https://linuxjourney.com) |
| NetworkChuck Linux Series | 🎥 YouTube | Search on YouTube |
| Ubuntu Server Official Docs | 📄 Docs | [ubuntu.com/server/docs](https://ubuntu.com/server/docs) |

> 🎮 **Pro Tip:** **OverTheWire Bandit** is a free online game that teaches Linux commands through puzzles — one of the best ways to practice. Highly recommended!

---

## ⏭️ What's Next?

Once you're comfortable in the terminal and all checklist items are ticked:

### 👉 [Phase 3 — Networking Fundamentals](./PHASE_3_NETWORKING.md) 🌍

> You'll go deeper into how data actually moves — IP addresses, subnets, DNS, firewalls, and more.

---

> 💬 **Tip:** The terminal feels uncomfortable at first — that's completely normal. Stick with it. After a week of daily practice, it will start to feel natural.