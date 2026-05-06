# 📘 Automation & Scripting – Complete Notes (Important for DBA ⚙️)

---

# 🔹 10. Automation & Scripting

Automation helps DBAs **reduce manual work, avoid errors, and save time**.

Common areas of automation:
- Backups
- Monitoring
- Alerts
- Data cleanup
- Log rotation
- Report generation

---

# 🔹 1. Why Automation is Important?

- Reduces human errors  
- Saves time  
- Ensures consistency  
- Handles repetitive tasks  
- Essential for production systems  

---

# 🔹 2. Bash Scripting (Linux Automation 🔥)

Bash scripting is used to automate tasks in Linux.

---

## 📌 Basic Script Example

```bash id="k2x8k3"
#!/bin/bash
echo "Starting Backup..."

mysqldump -u root -p password company_db > /backup/db.sql
echo "Backup Completed!"
```

## 📌 Run Script
```bash
chmod +x backup.sh
./backup.sh
```

## 📌 Variables in Bash
```bash
DB_NAME="company_db"
mysqldump -u root -p password $DB_NAME > backup.sql
```
## 📌 Conditional Example
```bash
if [ -f backup.sql ]; then
    echo "Backup exists"
else
    echo "Backup failed"
fi
```

## 📌 Loop Example
```bash
for i in {1..5}
do
    echo "Running task $i"
done
```

# 🔹 3. Python for Automation (Advanced 🔥)
Python is widely used for:
 - Database scripts
 - Monitoring
 - Data processing
 - Automation tools

## 📌 Install MySQL Connector
```bash
pip install mysql-connector-python
```

## 📌 Connect to Database
```python
import mysql.connector

conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="password",
    database="company_db"
)

cursor = conn.cursor()
```

## 📌 Run Query
```python
cursor.execute("SELECT * FROM employees")

for row in cursor.fetchall():
    print(row)
```

## 📌 Insert Data
```python
query = "INSERT INTO employees (name, salary) VALUES (%s, %s)"
values = ("Rahul", 50000)

cursor.execute(query, values)
conn.commit()
```

## 📌 Automation Example (Backup)
```python
import os

os.system("mysqldump -u root -p password company_db > backup.sql")
```

# 🔹 4. Scheduling Jobs (Cron Jobs 🔥)
Cron is used to schedule tasks automatically.

## 📌 Open Cron Editor
```bash
crontab -e
```
##  📌 Cron Format
* * * * * command
| | | | |
| | | | └── Day of week (0–7)
| | | └──── Month (1–12)
| | └────── Day of month (1–31)
| └──────── Hour (0–23)
└────────── Minute (0–59)

# 📌 Examples
🔹 Run Backup Daily at 2 AM
```bash
0 2 * * * /home/user/backup.sh
```
🔹 Run Script Every 5 Minutes
```bash
*/5 * * * * /home/user/script.sh
```
🔹 Run Every Sunday
```bash
0 0 * * 0 /home/user/weekly.sh
```

# 🔹 5. Real-World DBA Automation Tasks
- Daily database backups
- Monitoring disk usage
- Checking slow queries
- Restarting services automatically
- Sending alerts (email/logs)


# 🔹 6. Logging in Automation
## 📌 Example
```bash
mysqldump -u root -p db > backup.sql >> backup.log 2>&1
```
- '>>' → append output
- '2>&1' → capture errors

# 🔹 7. Error Handling

## 📌 Bash Example

```bash
if mysqldump -u root -p db > backup.sql; then
    echo "Backup successful"
else
    echo "Backup failed"
fi
```
# 🔹 8. Security in Automation
- Avoid hardcoding passwords
- Use environment variables
- Restrict script permissions
- Encrypt sensitive data

## 📌 Example
```bash
export DB_PASS="secure_password"
```

# 🔹 9. Interview Questions (Very Important 🔥)

## Q1. What is automation?
Automating repetitive tasks using scripts.

---

## Q2. What is Bash scripting?
Shell scripting used in Linux for automation.

---

## Q3. What is cron job?
Task scheduler in Linux.

---

## Q4. Why use Python for DBA?
For advanced automation and data handling.

---

## Q5. How to schedule backup?
Using cron job.

---

# 🔹 10. Real-World Scenario

## 📌 Problem:
Manual backups are missed.

## 📌 Solution:
- Create bash script for backup  
- Schedule cron job  
- Log output  
- Monitor execution  

---

# 🎯 Final Summary

To master Automation & Scripting:

- Learn Bash scripting  
- Use Python for advanced tasks  
- Automate backups and monitoring  
- Schedule tasks using cron  
- Handle errors and logs  
- Secure automation scripts  


