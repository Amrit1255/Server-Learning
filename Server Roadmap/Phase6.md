# 🗄️ Phase 6 — Databases on Server (Weeks 15–17)

> **Goal:** Store and retrieve data reliably on your server.  
> Learn to install, secure, query, and back up real databases in production.

---

## 📌 Table of Contents

- [Topic 1 — What is a Database Server?](#-topic-1-what-is-a-database-server)
- [Topic 2 — PostgreSQL Install & Setup](#-topic-2-postgresql--install--setup)
- [Topic 3 — PostgreSQL Users & Databases](#-topic-3-postgresql--create-users--databases)
- [Topic 4 — PostgreSQL Basic SQL Operations](#-topic-4-postgresql--basic-sql-operations)
- [Topic 5 — PostgreSQL Configuration & Security](#-topic-5-postgresql--configuration--security)
- [Topic 6 — MySQL Install & Setup](#-topic-6-mysql--install--setup)
- [Topic 7 — Redis Caching & Sessions](#-topic-7-redis--caching--sessions)
- [Topic 8 — Database Backups](#-topic-8-database-backups)
- [Topic 9 — Connecting Your App to the Database](#-topic-9-connecting-your-app-to-the-database)
- [Topic 10 — Database Best Practices](#-topic-10-database-best-practices)
- [Phase 6 Checklist](#-phase-6-checklist)
- [Phase 6 Hands-On Tasks](#-phase-6-hands-on-tasks)
- [Resources](#-resources-for-phase-6)

---

## 📖 Topic 1: What is a Database Server?

A **database server** stores, organizes, and retrieves data for your applications. Without it, your app has no memory — every restart would wipe everything clean.

```
Your App (Node.js / Python)
        |
        | SQL query: "SELECT * FROM users WHERE id = 1"
        ↓
  Database Server
        |
        | Returns: { id: 1, name: "John", email: "john@example.com" }
        ↓
Your App sends response to client
```

### Types of Databases

| Type | Examples | Best For |
|------|---------|---------|
| Relational (SQL) | PostgreSQL, MySQL, SQLite | Structured data with relationships |
| Document (NoSQL) | MongoDB, CouchDB | Flexible JSON-like documents |
| Key-Value | Redis, Memcached | Caching, sessions, queues |
| Column-Based | Cassandra, HBase | Big data, time-series data |
| Search Engine | Elasticsearch | Full-text search |

> 💡 **Start with PostgreSQL** — it's powerful, reliable, and the industry standard for most modern applications.

---

## 📖 Topic 2: PostgreSQL — Install & Setup

```bash
# Install PostgreSQL
sudo apt update
sudo apt install postgresql postgresql-contrib

# Check status
sudo systemctl status postgresql

# Enable on boot
sudo systemctl enable postgresql

# Check version
psql --version
```

### Connect to PostgreSQL

```bash
# PostgreSQL creates a default Linux user called "postgres"
# Switch to that user to access the database shell
sudo -i -u postgres

# Open the PostgreSQL interactive shell
psql

# Or do it in a single command
sudo -u postgres psql
```

### Inside the PostgreSQL Shell (psql)

```sql
-- List all databases
\l

-- List all users
\du

-- Connect to a specific database
\c mydatabase

-- List all tables in the current database
\dt

-- Describe a table's structure
\d tablename

-- Show the current connected user
SELECT current_user;

-- Exit psql
\q
```

---

## 📖 Topic 3: PostgreSQL — Create Users & Databases

> ⚠️ **Never use the default `postgres` superuser for your apps.** Always create a dedicated user with limited privileges.

```sql
-- Connect as the postgres superuser
sudo -u postgres psql

-- Create a new database user
CREATE USER myappuser WITH PASSWORD 'strongpassword123';

-- Create a new database
CREATE DATABASE myappdb;

-- Grant full access on the database to the user
GRANT ALL PRIVILEGES ON DATABASE myappdb TO myappuser;

-- Exit
\q
```

```bash
# Test the new user connection
psql -h localhost -U myappuser -d myappdb
```

### Connection String Format

```
postgresql://username:password@host:port/database

# Example:
postgresql://myappuser:strongpassword123@localhost:5432/myappdb
```

---

## 📖 Topic 4: PostgreSQL — Basic SQL Operations

```sql
-- Connect to your database first
\c myappdb

-- ── CREATE ──────────────────────────────────────────
CREATE TABLE users (
    id         SERIAL PRIMARY KEY,
    name       VARCHAR(100) NOT NULL,
    email      VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

-- ── INSERT ──────────────────────────────────────────
INSERT INTO users (name, email) VALUES ('John Doe', 'john@example.com');
INSERT INTO users (name, email) VALUES ('Jane Smith', 'jane@example.com');

-- ── SELECT ──────────────────────────────────────────
SELECT * FROM users;
SELECT name, email FROM users WHERE id = 1;
SELECT * FROM users ORDER BY created_at DESC;
SELECT * FROM users LIMIT 10 OFFSET 0;
SELECT COUNT(*) FROM users;
SELECT * FROM users WHERE email LIKE '%@example.com';

-- ── UPDATE ──────────────────────────────────────────
UPDATE users SET name = 'John Updated' WHERE id = 1;

-- ── DELETE ──────────────────────────────────────────
DELETE FROM users WHERE id = 1;

-- ── DROP (careful!) ─────────────────────────────────
DROP TABLE users;
```

---

## 📖 Topic 5: PostgreSQL — Configuration & Security

### Config File Locations

```bash
# Main PostgreSQL configuration
sudo nano /etc/postgresql/*/main/postgresql.conf

# Client authentication rules
sudo nano /etc/postgresql/*/main/pg_hba.conf
```

### Key postgresql.conf Settings

```conf
# Bind address — localhost only is most secure
listen_addresses = 'localhost'
# listen_addresses = '*'        ← Only enable if truly needed

# Connection limits
max_connections = 100

# Performance tuning
shared_buffers = 256MB
work_mem = 4MB
```

### pg_hba.conf — Authentication Rules

```
# TYPE  DATABASE    USER        ADDRESS         METHOD
local   all         postgres                    peer
local   all         all                         md5       # Local password auth
host    all         all         127.0.0.1/32    md5       # IPv4 localhost
host    all         all         ::1/128         md5       # IPv6 localhost
```

### Firewall — Block External Database Access

```bash
# PostgreSQL runs on port 5432
# NEVER expose it publicly unless you have a very specific reason

# Block all external access to PostgreSQL
sudo ufw deny 5432

# Only allow from a specific trusted IP (e.g. your app server)
sudo ufw allow from 10.0.0.5 to any port 5432
```

---

## 📖 Topic 6: MySQL — Install & Setup

```bash
# Install MySQL
sudo apt update
sudo apt install mysql-server

# Run the security hardening wizard
sudo mysql_secure_installation
# Prompts to answer:
# → Set root password             → Yes
# → Remove anonymous users        → Yes
# → Disallow root remote login    → Yes
# → Remove test database          → Yes
# → Reload privilege tables       → Yes

# Check status
sudo systemctl status mysql
sudo systemctl enable mysql
```

### Connect to MySQL

```bash
# Connect as root
sudo mysql

# Or with password prompt
mysql -u root -p
```

### Inside the MySQL Shell

```sql
-- List all databases
SHOW DATABASES;

-- Create a database
CREATE DATABASE myappdb;

-- Select a database to use
USE myappdb;

-- Show all tables
SHOW TABLES;

-- Describe a table
DESCRIBE tablename;

-- Exit
EXIT;
```

### Create MySQL Users & Grant Permissions

```sql
-- Create a user (localhost only)
CREATE USER 'myappuser'@'localhost' IDENTIFIED BY 'strongpassword123';

-- Grant all privileges on a specific database
GRANT ALL PRIVILEGES ON myappdb.* TO 'myappuser'@'localhost';

-- Apply the changes
FLUSH PRIVILEGES;

EXIT;
```

### MySQL Connection String Format

```
mysql://username:password@host:port/database

# Example:
mysql://myappuser:strongpassword123@localhost:3306/myappdb
```

---

## 📖 Topic 7: Redis — Caching & Sessions

**Redis** is an in-memory key-value store — blazing fast for caching, sessions, rate limiting, and job queues.

```bash
# Install Redis
sudo apt install redis-server

# Enable and start
sudo systemctl enable redis-server
sudo systemctl start redis-server

# Verify it's working
redis-cli ping          # Should return: PONG
```

### Basic Redis Commands

```bash
# Set a key-value pair
SET username "john"
SET counter 0

# Get a value
GET username                            # → "john"

# Set with expiry (TTL in seconds)
SET session:abc123 "user_data" EX 3600  # Expires in 1 hour

# Check remaining TTL
TTL session:abc123

# Delete a key
DEL username

# Check if a key exists
EXISTS username                         # → 1 (yes) or 0 (no)

# Increment a counter atomically
INCR counter                            # → 1
INCR counter                            # → 2

# List all keys (avoid on large datasets in production)
KEYS *

# Flush everything — use with extreme caution!
FLUSHALL
```

### Common Redis Use Cases

| Use Case | Redis Command Pattern |
|----------|----------------------|
| API rate limiting | `INCR requests:userId EX 60` |
| Session storage | `SET session:token userData EX 86400` |
| Caching DB results | `SET cache:users jsonData EX 300` |
| Job queues | `LPUSH queue:jobs jobData` + `RPOP` |
| Leaderboards | Sorted sets with `ZADD` |

### Redis Security Config

```bash
sudo nano /etc/redis/redis.conf

# Bind to localhost only — never expose Redis publicly
bind 127.0.0.1

# Set a strong password
requirepass yourStrongRedisPassword

# Restart after making changes
sudo systemctl restart redis-server
```

---

## 📖 Topic 8: Database Backups

> ⚠️ **Backups are not optional.** Set them up before you need them — not after disaster strikes.

### PostgreSQL Backups

```bash
# Backup a single database (plain SQL dump)
pg_dump myappdb > backup_myappdb_$(date +%Y%m%d).sql

# Backup with gzip compression (recommended)
pg_dump myappdb | gzip > backup_myappdb_$(date +%Y%m%d).sql.gz

# Backup all databases at once
pg_dumpall > backup_all_$(date +%Y%m%d).sql

# Restore from a plain SQL backup
psql myappdb < backup_myappdb_20260219.sql

# Restore from a compressed backup
gunzip -c backup_myappdb_20260219.sql.gz | psql myappdb
```

### MySQL Backups

```bash
# Backup a single database
mysqldump -u myappuser -p myappdb > backup_myappdb_$(date +%Y%m%d).sql

# Backup with compression
mysqldump -u myappuser -p myappdb | gzip > backup_myappdb_$(date +%Y%m%d).sql.gz

# Backup all databases
mysqldump -u root -p --all-databases > backup_all_$(date +%Y%m%d).sql

# Restore a database
mysql -u myappuser -p myappdb < backup_myappdb_20260219.sql
```

### Automated Backups with Cron

```bash
# Open crontab editor
crontab -e
```

```bash
# Backup PostgreSQL every day at 2:00 AM
0 2 * * * pg_dump myappdb | gzip > /backups/pg_$(date +\%Y\%m\%d).sql.gz

# Backup MySQL every Sunday at 3:00 AM
0 3 * * 0 mysqldump -u myappuser -pYourPassword myappdb | gzip > /backups/mysql_$(date +\%Y\%m\%d).sql.gz

# Delete backups older than 7 days every day at 4:00 AM
0 4 * * * find /backups -name "*.sql.gz" -mtime +7 -delete
```

### Cron Schedule Format

```
* * * * *   command to run
│ │ │ │ │
│ │ │ │ └── Day of week  (0=Sunday, 6=Saturday)
│ │ │ └──── Month        (1–12)
│ │ └────── Day of month (1–31)
│ └──────── Hour         (0–23)
└────────── Minute       (0–59)
```

---

## 📖 Topic 9: Connecting Your App to the Database

### Node.js + PostgreSQL

```bash
npm install pg
```

```javascript
const { Pool } = require('pg')

const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
})

// Basic query
async function getUsers() {
  const result = await pool.query('SELECT * FROM users')
  return result.rows
}

// Parameterized query — always use this to prevent SQL injection
async function getUserById(id) {
  const result = await pool.query(
    'SELECT * FROM users WHERE id = $1',
    [id]
  )
  return result.rows[0]
}
```

### Node.js + MySQL

```bash
npm install mysql2
```

```javascript
const mysql = require('mysql2/promise')

const pool = mysql.createPool({
  host: 'localhost',
  user: 'myappuser',
  password: process.env.DB_PASSWORD,
  database: 'myappdb',
})

async function getUsers() {
  const [rows] = await pool.query('SELECT * FROM users')
  return rows
}
```

### Node.js + Redis (Caching Pattern)

```bash
npm install ioredis
```

```javascript
const Redis = require('ioredis')

const redis = new Redis({
  host: 'localhost',
  port: 6379,
  password: process.env.REDIS_PASSWORD,
})

// Cache-aside pattern — check cache first, fall back to DB
async function getCachedUsers() {
  const cached = await redis.get('cache:users')
  if (cached) return JSON.parse(cached)       // ✅ Cache hit

  const users = await getFromDatabase()       // Cache miss — hit DB
  await redis.setex('cache:users', 300, JSON.stringify(users))  // Cache 5 min
  return users
}
```

---

## 📖 Topic 10: Database Best Practices

```
✅ Always create a dedicated user per app — never use root
✅ Use strong, unique passwords for all database users
✅ Never expose database ports publicly — firewall them
✅ Always use parameterized queries — never string concatenation (prevents SQL injection)
✅ Set up automated daily backups
✅ Test your backups regularly by actually restoring them
✅ Store connection strings in .env — never hardcode them in code
✅ Use connection pooling in production (not a new connection per request)
✅ Add indexes to columns you frequently query or filter by
✅ Monitor and optimize slow queries
✅ Bind databases to localhost unless remote access is truly required
```

---

## ✅ Phase 6 Checklist

Before moving to Phase 7, make sure you can confidently tick all of these:

- [ ] Can you install and start PostgreSQL on a fresh server?
- [ ] Can you create a dedicated database user with limited privileges?
- [ ] Can you create a database and run basic CRUD SQL queries?
- [ ] Can you install and configure MySQL securely?
- [ ] Can you install Redis and use basic Redis commands?
- [ ] Do you know how to secure your databases (firewall, bind address, users)?
- [ ] Can you back up a PostgreSQL or MySQL database manually?
- [ ] Can you set up automated nightly backups with cron?
- [ ] Can you connect a Node.js or Python app to a database?
- [ ] Can you explain and apply the database best practices?

---

## 🎯 Phase 6 Hands-On Tasks

### Task 1 — PostgreSQL Setup
> Install PostgreSQL, create a dedicated user and database, connect with `psql`, create a `users` table, and insert several records. Practice all CRUD operations.

### Task 2 — MySQL Setup
> Install MySQL, run `mysql_secure_installation`, create a user and database, and perform basic CRUD operations from the MySQL shell.

### Task 3 — Redis Caching
> Install Redis, set key-value pairs with expiry times, and connect to Redis from a Node.js or Python app to implement a simple caching layer.

### Task 4 — Backup & Restore
> Back up your PostgreSQL database with `pg_dump`. Drop the database entirely. Restore it from the backup file. Confirm all data is back.

### Task 5 — Automate Backups
> Create a `/backups` directory and set up two cron jobs:
> 1. Back up your database every night at 2 AM
> 2. Delete backup files older than 7 days every morning at 4 AM

---

## 📚 Resources for Phase 6

| Resource | Type | Link |
|----------|------|-------|
| PostgreSQL Official Docs | 📄 Docs | [postgresql.org/docs](https://www.postgresql.org/docs/) |
| MySQL Official Docs | 📄 Docs | [dev.mysql.com/doc](https://dev.mysql.com/doc/) |
| Redis Official Docs | 📄 Docs | [redis.io/docs](https://redis.io/docs/) |
| DigitalOcean PostgreSQL Guides | 📄 Guides | [digitalocean.com/community](https://www.digitalocean.com/community/tags/postgresql) |
| SQLZoo — SQL Practice | 🎮 Practice | [sqlzoo.net](https://sqlzoo.net) |
| Redis University (Free) | 🎓 Course | [university.redis.com](https://university.redis.com) |

---

## ⏭️ What's Next?

Once your checklist is complete and all tasks are done:

### 👉 [Phase 7 — Docker & Containers](./PHASE_7_DOCKER.md) 🐳

> You'll learn the modern way to package, ship, and run applications — making your deployments consistent, portable, and scalable across any environment.

---

> 💬 **Tip:** Always test your backups by restoring them on a separate server or database. A backup you've never tested is a backup you can't trust.