# 📘 Operating System Knowledge – Complete Notes (Important for DBA 🖥️)

---

# 🔹 1. Why OS Knowledge is Important for DBA?

A DBA works closely with the operating system because:

- Database runs on OS
- Performance depends on OS resources
- Troubleshooting requires OS-level checks
- Resource monitoring is OS-based

---

# 🔹 2. Common Operating Systems for DBAs

- Linux (Most important 🔥)
- Windows Server

---

# 🔹 3. Linux Basics (Must Know 🔥)

Linux is widely used for databases like MySQL, PostgreSQL, and Oracle.

---

## 📌 File System Navigation

```bash
pwd        # Show current directory
ls         # List files
ls -l      # Detailed list
cd /path   # Change directory
```

## 📌 File Permissions
```bash
ls -l
chmod 755 file.txt
chown user:group file.txt
```

## 📌 Process Management
```bash
ps aux               # List processes
top                  # Real-time processes
htop                 # Advanced monitoring
kill -9 PID          # Kill process
```

## 📌 Disk Usage
```bash
df -h                # Disk space
du -sh *             # Folder size
```

## 📌 Memory Usage
```bash
free -m              # Memory usage
```

## 📌 CPU Usage
```bash
top
```

## 📌 Networking
```bash
ping google.com
netstat -tuln
ss -tuln
```

## 📌 Logs
```bash
tail -f /var/log/syslog
tail -f /var/log/mysql/error.log
```


# 🔹 4. Linux for DBA (Important Commands 🔥)

## 📌 Check Running Database
```bash
ps aux | grep mysql
```

## 📌 Check Open Ports
```bash
netstat -tulnp | grep 3306
```

## 📌 Restart Database Service
```bash
sudo systemctl restart mysql
sudo systemctl status mysql
```

## 📌 Check Disk Space (DB Issue)
```bash
df -h
```

## 📌 Check Large Files
```bash
du -ah | sort -rh | head -10
```

# 🔹 5. Windows Server Basics
Used mainly for SQL Server environments.

## 📌 Task Manager
- Monitor CPU, Memory, Disk usage

🔹 6. Environment Variables
Used to configure system paths.

## 📌 Example
```bash
echo $PATH
```

# 🔹 7. Shell Scripting (Automation)
## 📌 Example Script
```bash
#!/bin/bash
mysqldump -u root -p password db_name > backup.sql
```
## 📌 Run Script
```bash
chmod +x backup.sh
./backup.sh
```

# 🔹 8. Cron Jobs (Automation 🔥)
Schedule tasks automatically.

# 📌 Example
```bash
crontab -e
0 2 * * * mysqldump -u root -p db > backup.sql
```

# 🔹 9. OS-Level Performance Tuning

## 📌 Key Areas
- CPU usage
- Memory usage
- Disk I/O
- Network

## 📌 Common Issues
- High CPU → heavy queries
- Low memory → slow performance
- Disk full → DB crash

# 🔹 10. File System for Databases
- Store DB files on fast disks (SSD)
- Separate data and logs
- Monitor disk usage

# 🔹 11. Security at OS Level
- Restrict user access
- Use SSH keys
- Disable root login


# 🔹 12. Interview Questions (Very Important 🔥)
Q1. Why OS knowledge is important for DBA?
Because DB performance and troubleshooting depend on OS.

Q2. How to check running processes?
```bash
ps aux
top
```
Q3. How to check disk usage?
```bash
df -h
du -sh
```

Q4. How to check memory usage?
```bash
free -m
```
Q5. How to kill process?
```bash
kill -9 PID
```
Q6. What is cron job?
Task scheduler in Linux.

Q7. Difference between Linux and Windows for DBA?
| Linux                      | Windows             |
| -------------------------- | ------------------- |
| Command-line based         | GUI-based           |
| Used for MySQL, PostgreSQL | Used for SQL Server |
| More flexible              | Easier to use       |



