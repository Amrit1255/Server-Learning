# ⚙️ Module 2 — MySQL Installation & Environment Setup

> ## 🚀 Setting Up a Professional MySQL Development Environment
> ### Learn how to install, configure, and manage MySQL like a real developer & DBA.

---

# 🌟 What You Will Learn

✅ Installing MySQL on Windows  
✅ Installing MySQL on Linux  
✅ Installing MySQL on macOS  
✅ MySQL Workbench Setup  
✅ MySQL CLI Usage  
✅ Docker MySQL Setup  
✅ XAMPP / WAMP / LAMP  
✅ MySQL Configuration Files  
✅ Starting & Stopping MySQL  
✅ Environment Variables  
✅ Common Installation Errors  

---

# 📌 Why Installation Knowledge Matters?

A database engineer should know:

- How databases run ⚙️
- How services start 🔄
- Where data is stored 💾
- How to troubleshoot startup issues 🚨
- How to configure performance 🔥

---

# 🐬 What Gets Installed in MySQL?

| Component | Purpose |
|---|---|
| MySQL Server | Database engine |
| MySQL Client | Connect to server |
| MySQL Workbench | GUI management tool |
| Connector Libraries | Language integrations |
| Configuration Files | Server settings |

---

# 🖥️ MySQL Installation on Windows

---

# 📥 Step 1 — Download MySQL

Visit:

👉 :contentReference[oaicite:0]{index=0} MySQL Official Website

Download:
- MySQL Community Server
- MySQL Installer

---

# 📦 Recommended Packages

| Package | Purpose |
|---|---|
| MySQL Server | Core database |
| MySQL Workbench | GUI |
| MySQL Shell | Advanced CLI |
| MySQL Router | Routing |
| Connector/Python | Python integration |

---

# ⚙️ Step 2 — Run Installer

Choose:

```text
Developer Default
```

This installs:
- Server
- Workbench
- Shell
- Connectors

---

# 🔐 Step 3 — Configure Password

Set:

```text
Root Password
```

Example:

```text
root@123
```

⚠️ Never use weak passwords in production.

---

# 🌐 Step 4 — Configure Port

Default MySQL Port:

```text
3306
```

---

# 📌 MySQL Service Name

Usually:

```text
MySQL80
```

---

# ▶️ Step 5 — Start MySQL Service

Windows Services:

```text
services.msc
```

Find:
```text
MySQL80
```

Start service if stopped.

---

# 🧠 Verify Installation

Open CMD:

```bash
mysql -u root -p
```

Enter password.

---

# ✅ Successful Output

```sql
mysql>
```

---

# 🐧 MySQL Installation on Linux (Ubuntu)

---

# 📦 Step 1 — Update Packages

```bash
sudo apt update
```

---

# 📥 Step 2 — Install MySQL

```bash
sudo apt install mysql-server
```

---

# ▶️ Step 3 — Start MySQL

```bash
sudo systemctl start mysql
```

---

# 🔄 Enable Auto Start

```bash
sudo systemctl enable mysql
```

---

# 📊 Check Status

```bash
sudo systemctl status mysql
```

---

# 🔐 Secure Installation

```bash
sudo mysql_secure_installation
```

---

# 📌 Security Configuration Includes

✅ Remove anonymous users  
✅ Disable remote root login  
✅ Remove test database  
✅ Reload privilege tables  

---

# 🧠 Login to MySQL

```bash
sudo mysql -u root -p
```

---

# 🍎 MySQL Installation on macOS

---

# 📥 Install Using Homebrew

```bash
brew install mysql
```

---

# ▶️ Start MySQL

```bash
brew services start mysql
```

---

# 📊 Check Status

```bash
brew services list
```

---

# 🧠 Login to MySQL

```bash
mysql -u root -p
```

---

# 🐳 Docker MySQL Setup

---

# 🌟 Why Docker?

✅ Easy setup  
✅ Isolated environment  
✅ Portable databases  
✅ Useful for DevOps  

---

# 📦 Pull MySQL Image

```bash
docker pull mysql
```

---

# 🚀 Run MySQL Container

```bash
docker run --name mysql-container \
-e MYSQL_ROOT_PASSWORD=root123 \
-p 3306:3306 \
-d mysql
```

---

# 📊 Check Running Containers

```bash
docker ps
```

---

# 🧠 Connect Inside Container

```bash
docker exec -it mysql-container bash
```

---

# 📌 Login to MySQL Inside Docker

```bash
mysql -u root -p
```

---

# 🖥️ MySQL Workbench

## 📘 GUI Tool for MySQL Management

Provided by:
:contentReference[oaicite:1]{index=1}

---

# 🌟 Features of Workbench

✅ Query Execution  
✅ Database Design  
✅ ER Diagrams  
✅ User Management  
✅ Backup & Restore  
✅ Performance Dashboard  

---

# 🧠 Common Workbench Operations

| Task | Usage |
|---|---|
| Create Database | GUI |
| Run SQL Queries | SQL Editor |
| Export Data | Data Export |
| Import Backup | Data Import |

---

# 📌 Connect to Local MySQL

Connection Parameters:

| Parameter | Value |
|---|---|
| Hostname | localhost |
| Port | 3306 |
| Username | root |
| Password | your_password |

---

# 💻 MySQL Command Line Interface (CLI)

---

# 📌 Open MySQL CLI

```bash
mysql -u root -p
```

---

# 📌 Show Databases

```sql
SHOW DATABASES;
```

---

# 📌 Create Database

```sql
CREATE DATABASE company_db;
```

---

# 📌 Use Database

```sql
USE company_db;
```

---

# 📌 Exit MySQL

```sql
EXIT;
```

---

# 🧠 Important MySQL Directories

---

# 🖥️ Windows Paths

| Purpose | Path |
|---|---|
| Data Files | ProgramData/MySQL |
| Config File | my.ini |
| Logs | MySQL/logs |

---

# 🐧 Linux Paths

| Purpose | Path |
|---|---|
| Data Directory | /var/lib/mysql |
| Config File | /etc/mysql/my.cnf |
| Logs | /var/log/mysql |

---

# ⚙️ MySQL Configuration File

---

# 📘 Common Files

| OS | File |
|---|---|
| Linux | my.cnf |
| Windows | my.ini |

---

# 🌟 Important Configuration Parameters

```ini
[mysqld]

port=3306
max_connections=200
innodb_buffer_pool_size=1G
```

---

# 🧠 Important Parameters

| Parameter | Purpose |
|---|---|
| port | MySQL port |
| max_connections | Maximum users |
| innodb_buffer_pool_size | Memory allocation |
| bind-address | Network access |

---

# 🔄 Restart MySQL After Config Change

---

# 🐧 Linux

```bash
sudo systemctl restart mysql
```

---

# 🖥️ Windows

Restart service from:
```text
services.msc
```

---

# 🔐 MySQL Authentication

---

# 📌 Root User

Default administrator account.

---

# 📌 Create New User

```sql
CREATE USER 'amrit'@'localhost'
IDENTIFIED BY 'password123';
```

---

# 📌 Grant Privileges

```sql
GRANT ALL PRIVILEGES
ON *.*
TO 'amrit'@'localhost';
```

---

# 📌 Reload Privileges

```sql
FLUSH PRIVILEGES;
```

---

# 🧠 MySQL Port

Default:

```text
3306
```

---

# 🌐 Change Port Example

```ini
port=3307
```

---

# 🧠 Environment Variables

---

# 📌 Why Add MySQL to PATH?

Allows commands like:

```bash
mysql
mysqldump
mysqladmin
```

from anywhere.

---

# 🖥️ Windows PATH Example

```text
C:\Program Files\MySQL\MySQL Server 8.0\bin
```

---

# 🚨 Common Installation Errors

---

# ❌ ERROR 1 — Port Already in Use

```text
Port 3306 already occupied
```

✅ Solution:
- Stop conflicting service
- Change MySQL port

---

# ❌ ERROR 2 — Access Denied

```text
Access denied for user 'root'
```

✅ Solution:
- Reset password
- Check privileges

---

# ❌ ERROR 3 — Service Won’t Start

✅ Check:
- Logs
- Port conflicts
- Corrupted data files

---

# 📊 Check Running Port

---

# 🐧 Linux

```bash
sudo netstat -tulnp
```

---

# 🖥️ Windows

```bash
netstat -ano
```

---

# 🧠 Useful MySQL Commands

| Command | Purpose |
|---|---|
| SHOW DATABASES; | List databases |
| SHOW TABLES; | List tables |
| SELECT VERSION(); | MySQL version |
| STATUS; | Connection info |

---

# 🚀 MySQL Versions

| Version | Notes |
|---|---|
| MySQL 5.7 | Older stable |
| MySQL 8.0 | Modern features |
| MariaDB | Fork of MySQL |

---

# ⚔️ MySQL vs MariaDB

| Feature | MySQL | MariaDB |
|---|---|---|
| Owner | Oracle | Community |
| Compatibility | High | High |
| Features | Enterprise focus | Open-source focus |

---

# 📌 XAMPP / WAMP / LAMP

---

# 🧠 What are These?

Bundles including:
- Web Server
- Database
- PHP

---

# 📦 XAMPP

| Letter | Meaning |
|---|---|
| X | Cross Platform |
| A | Apache |
| M | MySQL |
| P | PHP |
| P | Perl |

---

# 🌟 Why Developers Use XAMPP?

✅ Easy local development  
✅ Fast setup  
✅ PHP + MySQL together  

---

# 🧠 Real-World Deployment Architecture

```text
Frontend App
      |
      v
Backend API
      |
      v
MySQL Database Server
      |
      v
Storage Disk
```

---

# 📌 Best Practices

✅ Use strong passwords  
✅ Secure root account  
✅ Change default credentials  
✅ Keep backups  
✅ Use latest MySQL version  
✅ Monitor logs regularly  

---

# ❌ Common Mistakes

❌ Using root for applications  
❌ Weak passwords  
❌ Ignoring logs  
❌ No backups  
❌ Exposing MySQL publicly  

---

# 📝 Quick Revision Summary

| Topic | Key Point |
|---|---|
| Default Port | 3306 |
| Config File | my.cnf / my.ini |
| GUI Tool | MySQL Workbench |
| CLI Login | mysql -u root -p |
| Linux Service | systemctl |
| Docker | Portable setup |

---

# 📌 Interview Questions

---

# ❓ Q1. Default MySQL Port?

```text
3306
```

---

# ❓ Q2. How to Start MySQL in Linux?

```bash
sudo systemctl start mysql
```

---

# ❓ Q3. What is MySQL Workbench?

GUI tool for MySQL management.

---

# ❓ Q4. Difference Between MySQL Client & Server?

| Component | Purpose |
|---|---|
| Client | Sends queries |
| Server | Processes queries |

---

# ❓ Q5. What is my.cnf?

Configuration file for MySQL server.

---

# ❓ Q6. How to Secure MySQL Installation?

Using:

```bash
mysql_secure_installation
```

---

# 🎯 Module Completion Checklist

✅ Installed MySQL  
✅ Connected using CLI  
✅ Learned Workbench  
✅ Understood Config Files  
✅ Learned Docker Setup  
✅ Learned Services Management  
✅ Learned Authentication Basics  

---

# ❤️ End of Module 2

> ## “A strong DBA is created by understanding the system beneath the queries.”

🚀 Next Module:
# 🏗️ SQL Fundamentals