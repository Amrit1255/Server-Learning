# 📘 Monitoring & Logging – Complete Notes (Important for DBA 📊)

---

# 🔹 11. Monitoring & Logging

Monitoring and Logging help DBAs **track performance, detect issues, and ensure system stability**.

---

# 🔹 1. What is Monitoring?

Monitoring is the process of **tracking system and database performance in real-time**.

---

## 📌 Why Monitoring is Important?

- Detect performance issues  
- Prevent system crashes  
- Identify slow queries  
- Ensure high availability  
- Improve user experience  

---

# 🔹 2. What is Logging?

Logging is the process of **recording database events and activities**.

---

## 📌 Types of Logs

- Error Logs → System errors  
- Query Logs → Executed queries  
- Slow Query Logs → Slow queries  
- Transaction Logs → Data changes  

---

# 🔹 3. Key Metrics to Monitor (Very Important 🔥)

---

## 📌 System Metrics

- CPU usage  
- Memory usage  
- Disk I/O  
- Network usage  

---

## 📌 Database Metrics

- Query execution time  
- Active connections  
- Locking / deadlocks  
- Cache hit ratio  
- Replication lag  

---

# 🔹 4. Monitoring Tools

---

## 📌 Common Tools

- Prometheus  
- Grafana  
- Nagios  

---

## 📌 Cloud Monitoring

- AWS CloudWatch  
- Azure Monitor  
- GCP Monitoring  

---

# 🔹 5. MySQL Logging

---

## 📌 Enable General Log

```sql
SET GLOBAL general_log = 'ON';
```

## 📌 Check Slow Query Log
```sql
SHOW VARIABLES LIKE 'slow_query_log';
```

## 📌 Enable Slow Query Log
```sql
SET GLOBAL slow_query_log = 'ON';
```

# 🔹 6. PostgreSQL Logging
## 📌 Enable Logging
```sql
SHOW log_statement;
```

## 📌 Analyze Query
```sql
EXPLAIN ANALYZE
SELECT * FROM employees;
```

# 🔹 7. Log File Monitoring
## 📌 View Logs (Linux)
```bash
tail -f /var/log/mysql/error.log
```

## 📌 Search Logs
```bash
grep "error" /var/log/mysql/error.log
```

# 🔹 8. Alerts & Notifications
## 📌 Why Alerts?
- Immediate issue detection
- Faster response

## 📌 Examples
- High CPU alert
- Disk full alert
- Slow query alert

# 🔹 9. Performance Monitoring

## 📌 Use EXPLAIN
```sql
EXPLAIN SELECT * FROM employees;
```

## 📌 Identify Slow Queries
```sql
SELECT * FROM employees
WHERE salary > 50000;
```

# 🔹 10. Dashboard Monitoring

## 📌 Grafana Example
- Visual dashboards
- Charts for CPU, memory, queries

# 🔹 11. Best Practices
- Enable slow query logging
- Monitor regularly
- Set alerts
- Analyze logs frequently
- Keep logs secure
- Rotate logs

# 🔹 12. Log Rotation
Prevents logs from filling disk.

## 📌 Example (Linux)
```bash
logrotate /etc/logrotate.conf
```

# 🔹 13. Security in Logs

- Avoid logging sensitive data  
- Restrict log access  
- Encrypt logs if needed  

---

# 🔹 14. Interview Questions (Very Important 🔥)

## Q1. What is Monitoring?
Tracking system performance.

---

## Q2. What is Logging?
Recording database activities.

---

## Q3. What are slow query logs?
Logs for queries taking long time.

---

## Q4. What is EXPLAIN?
Shows query execution plan.

---

## Q5. Why monitoring is important?
To detect and fix issues early.

---

## Q6. What tools are used?
Prometheus, Grafana, Nagios.

---

## Q7. What is log rotation?
Managing log file size.

---

# 🔹 15. Real-World Scenario

## 📌 Problem:
Database becomes slow.

## 📌 Solution:
- Check CPU and memory  
- Analyze slow query logs  
- Use EXPLAIN  
- Optimize queries  
- Set alerts  

---

# 🎯 Final Summary

To master Monitoring & Logging:

- Track system metrics  
- Enable logging  
- Analyze slow queries  
- Use monitoring tools  
- Set alerts  
- Rotate logs  
- Secure logs  
