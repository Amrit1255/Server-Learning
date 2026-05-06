# 📘 Linux Commands for DBA – Basic to Advanced

---

# 🔹 1. Basic Navigation Commands

```bash
pwd
ls
ls -l
ls -la
cd /path/to/folder
cd ..
cd ~
clear
history
```

---

# 🔹 2. File and Folder Commands

```bash
touch file.txt
mkdir backup
mkdir -p /backup/mysql/daily
cp file1.txt file2.txt
cp -r folder1 folder2
mv old.txt new.txt
rm file.txt
rm -rf folder_name
cat file.txt
less file.txt
head file.txt
tail file.txt
tail -f file.txt
```

---

# 🔹 3. Find Files and Folders

```bash
find / -name "my.cnf"
find /var/log -name "*.log"
find /backup -type f -mtime +7
find /backup -type f -mtime +7 -delete
locate my.cnf
which mysql
whereis mysql
```

---

# 🔹 4. File Permission Commands

```bash
ls -l
chmod 755 script.sh
chmod +x backup.sh
chmod 644 file.txt
chown mysql:mysql /var/lib/mysql
chown -R mysql:mysql /backup/mysql
```

---

# 🔹 5. User and Group Commands

```bash
whoami
id
who
w
users
sudo adduser dbuser
sudo passwd dbuser
sudo usermod -aG sudo dbuser
groups dbuser
sudo deluser dbuser
```

---

# 🔹 6. Process Management

```bash
ps aux
ps aux | grep mysql
top
htop
pidof mysqld
pgrep mysql
kill PID
kill -9 PID
pkill mysql
```

---

# 🔹 7. Service Management

```bash
sudo systemctl status mysql
sudo systemctl start mysql
sudo systemctl stop mysql
sudo systemctl restart mysql
sudo systemctl reload mysql
sudo systemctl enable mysql
sudo systemctl disable mysql
```

For PostgreSQL:

```bash
sudo systemctl status postgresql
sudo systemctl restart postgresql
```

For SQL Server on Linux:

```bash
sudo systemctl status mssql-server
sudo systemctl restart mssql-server
```

---

# 🔹 8. Disk Usage Commands

```bash
df -h
df -i
du -sh *
du -sh /var/lib/mysql
du -ah /var/lib/mysql | sort -rh | head -20
lsblk
blkid
mount
```

---

# 🔹 9. Memory Commands

```bash
free -h
free -m
vmstat 1
cat /proc/meminfo
```

---

# 🔹 10. CPU Commands

```bash
top
htop
uptime
lscpu
mpstat
sar -u 1 5
```

---

# 🔹 11. Disk I/O Commands

```bash
iostat
iostat -x 1 5
iotop
sar -d 1 5
```

---

# 🔹 12. Network Commands

```bash
ip addr
ifconfig
ping google.com
curl localhost
wget https://example.com
ss -tulnp
netstat -tulnp
ss -an | grep 3306
telnet localhost 3306
nc -zv localhost 3306
```

---

# 🔹 13. Port Checking for Databases

MySQL:

```bash
ss -tulnp | grep 3306
netstat -tulnp | grep 3306
```

PostgreSQL:

```bash
ss -tulnp | grep 5432
```

SQL Server:

```bash
ss -tulnp | grep 1433
```

---

# 🔹 14. Log Monitoring Commands

```bash
tail -f /var/log/syslog
tail -f /var/log/messages
tail -f /var/log/mysql/error.log
tail -f /var/log/postgresql/postgresql.log
journalctl -xe
journalctl -u mysql
journalctl -u mysql -f
journalctl -u postgresql -f
```

---

# 🔹 15. Search Inside Logs

```bash
grep "error" /var/log/mysql/error.log
grep -i "failed" /var/log/syslog
grep -i "connection" /var/log/mysql/error.log
grep -r "deadlock" /var/log/mysql/
```

---

# 🔹 16. Archive and Compression Commands

```bash
tar -cvf backup.tar /backup
tar -xvf backup.tar
tar -czvf backup.tar.gz /backup
tar -xzvf backup.tar.gz
gzip backup.sql
gunzip backup.sql.gz
zip backup.zip backup.sql
unzip backup.zip
```

---

# 🔹 17. MySQL DBA Commands from Linux

```bash
mysql -u root -p
mysql -h localhost -u root -p
mysqladmin -u root -p status
mysqladmin -u root -p processlist
mysqladmin -u root -p variables
mysqladmin -u root -p extended-status
```

---

# 🔹 18. MySQL Backup and Restore

Backup:

```bash
mysqldump -u root -p database_name > backup.sql
mysqldump -u root -p --all-databases > all_databases.sql
mysqldump -u root -p database_name table_name > table_backup.sql
```

Compressed backup:

```bash
mysqldump -u root -p database_name | gzip > backup.sql.gz
```

Restore:

```bash
mysql -u root -p database_name < backup.sql
gunzip < backup.sql.gz | mysql -u root -p database_name
```

---

# 🔹 19. PostgreSQL DBA Commands from Linux

```bash
psql -U postgres
psql -U postgres -d database_name
pg_isready
```

List databases:

```bash
psql -U postgres -c "\l"
```

List tables:

```bash
psql -U postgres -d database_name -c "\dt"
```

---

# 🔹 20. PostgreSQL Backup and Restore

Backup:

```bash
pg_dump -U postgres database_name > backup.sql
pg_dumpall -U postgres > all_databases.sql
```

Restore:

```bash
psql -U postgres database_name < backup.sql
```

Custom format backup:

```bash
pg_dump -U postgres -Fc database_name > backup.dump
```

Custom format restore:

```bash
pg_restore -U postgres -d database_name backup.dump
```

---

# 🔹 21. Cron Job Commands

```bash
crontab -e
crontab -l
crontab -r
```

Daily backup at 2 AM:

```bash
0 2 * * * /home/dbuser/backup.sh
```

Run every 5 minutes:

```bash
*/5 * * * * /home/dbuser/check_db.sh
```

---

# 🔹 22. Bash Script for MySQL Backup

```bash
#!/bin/bash

DB_NAME="company_db"
DB_USER="root"
BACKUP_DIR="/backup/mysql"
DATE=$(date +%F_%H-%M-%S)

mkdir -p $BACKUP_DIR

mysqldump -u $DB_USER -p $DB_NAME > $BACKUP_DIR/${DB_NAME}_$DATE.sql

echo "Backup completed: ${DB_NAME}_$DATE.sql"
```

---

# 🔹 23. Bash Script with Compression

```bash
#!/bin/bash

DB_NAME="company_db"
DB_USER="root"
BACKUP_DIR="/backup/mysql"
DATE=$(date +%F_%H-%M-%S)

mkdir -p $BACKUP_DIR

mysqldump -u $DB_USER -p $DB_NAME | gzip > $BACKUP_DIR/${DB_NAME}_$DATE.sql.gz

echo "Compressed backup completed"
```

---

# 🔹 24. Delete Old Backups

Delete backups older than 7 days:

```bash
find /backup/mysql -type f -mtime +7 -delete
```

Delete `.sql.gz` backups older than 30 days:

```bash
find /backup/mysql -name "*.sql.gz" -type f -mtime +30 -delete
```

---

# 🔹 25. Check Database Server Health

```bash
systemctl status mysql
ps aux | grep mysql
df -h
free -h
top
ss -tulnp | grep 3306
tail -f /var/log/mysql/error.log
```

---

# 🔹 26. Troubleshooting Slow Database

```bash
top
htop
free -h
df -h
iostat -x 1 5
mysqladmin -u root -p processlist
tail -f /var/log/mysql/error.log
```

Inside MySQL:

```sql
SHOW PROCESSLIST;
SHOW FULL PROCESSLIST;
SHOW VARIABLES LIKE 'slow_query_log';
SHOW ENGINE INNODB STATUS;
```

---

# 🔹 27. Check Large Database Files

```bash
du -sh /var/lib/mysql/*
du -ah /var/lib/mysql | sort -rh | head -20
find /var/lib/mysql -type f -size +1G
```

---

# 🔹 28. Check Open Files

```bash
lsof
lsof -i
lsof -i :3306
lsof -p PID
```

---

# 🔹 29. Check Login and Security

```bash
last
lastlog
who
w
sudo cat /var/log/auth.log
grep "Failed password" /var/log/auth.log
```

---

# 🔹 30. Firewall Commands

UFW:

```bash
sudo ufw status
sudo ufw allow 22
sudo ufw allow 3306
sudo ufw deny 3306
sudo ufw enable
```

Firewalld:

```bash
sudo firewall-cmd --list-all
sudo firewall-cmd --add-port=3306/tcp --permanent
sudo firewall-cmd --reload
```

---

# 🔹 31. SSH Commands

```bash
ssh user@server_ip
ssh -i key.pem user@server_ip
scp backup.sql user@server_ip:/backup/
scp user@server_ip:/backup/backup.sql .
rsync -avz /backup/ user@server_ip:/backup/
```

---

# 🔹 32. Package Management

Ubuntu/Debian:

```bash
sudo apt update
sudo apt upgrade
sudo apt install mysql-server
sudo apt install postgresql
```

CentOS/RHEL:

```bash
sudo yum update
sudo yum install mysql-server
sudo yum install postgresql
```

---

# 🔹 33. System Information Commands

```bash
hostname
hostname -I
uname -a
cat /etc/os-release
uptime
date
timedatectl
```

---

# 🔹 34. Environment Variables

```bash
echo $PATH
env
export DB_PASS="secure_password"
```

---

# 🔹 35. Advanced Performance Commands

```bash
vmstat 1 5
iostat -x 1 5
sar -u 1 5
sar -r 1 5
sar -d 1 5
pidstat
pidstat -d
pidstat -r
```

---

# 🔹 36. Advanced DBA Troubleshooting Flow

## 📌 Database Not Starting

```bash
sudo systemctl status mysql
journalctl -u mysql -xe
tail -100 /var/log/mysql/error.log
df -h
free -h
```

---

## 📌 Database Port Not Listening

```bash
ss -tulnp | grep 3306
sudo systemctl status mysql
grep bind-address /etc/mysql/mysql.conf.d/mysqld.cnf
```

---

## 📌 Disk Full Issue

```bash
df -h
du -sh /*
du -ah /var/lib/mysql | sort -rh | head -20
find /backup -type f -mtime +7 -delete
```

---

## 📌 High CPU Issue

```bash
top
ps aux --sort=-%cpu | head
mysqladmin -u root -p processlist
```

---

## 📌 High Memory Issue

```bash
free -h
ps aux --sort=-%mem | head
```

---

# 🔹 37. Most Frequently Used DBA Linux Commands

```bash
pwd
ls -la
cd
cat
less
tail -f
grep
find
chmod
chown
ps aux
top
htop
kill -9
df -h
du -sh
free -h
systemctl status mysql
systemctl restart mysql
journalctl -u mysql -f
ss -tulnp
mysql -u root -p
mysqldump
crontab -e
scp
rsync
tar
gzip
```

---

# 🎯 Final Summary

A DBA should know Linux commands for:

- File handling
- Permissions
- Users and groups
- Process monitoring
- Service management
- Disk and memory monitoring
- Network troubleshooting
- Log analysis
- Backup and restore
- Cron job automation
- Security checks
- Performance troubleshooting

---

👉 **Core Focus:**

```text
DBA Linux Skill = Monitoring + Logs + Backup + Services + Troubleshooting
```