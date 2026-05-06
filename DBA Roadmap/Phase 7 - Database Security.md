# 📘 Database Security – Complete Notes (Critical for DBA 🔐)

---

# 🔹 1. What is Database Security?

Database Security is the process of **protecting database systems from unauthorized access, misuse, and threats**.

It ensures:
- Data confidentiality
- Data integrity
- Data availability

---

# 🔹 2. Why Database Security is Important?

- Protects sensitive data (user info, financial data)
- Prevents data breaches
- Ensures compliance (GDPR, etc.)
- Maintains trust and reliability
- Highly asked in interviews 🔥

---

# 🔹 3. Core Security Concepts (CIA Triad)

---

## 📌 Confidentiality
- Only authorized users can access data

## 📌 Integrity
- Data remains accurate and unchanged

## 📌 Availability
- Data is accessible when needed

---

# 🔹 4. Authentication vs Authorization

---

## 📌 Authentication
- Verifying identity (login)

Example:
```sql
CREATE USER 'app_user'@'localhost' IDENTIFIED BY 'StrongPassword123!';
```
## 📌 Authorization
- Granting permissions

Example:
```sql
GRANT SELECT, INSERT ON company_db.* TO 'app_user'@'localhost';
```

# 🔹 5. User Management

## 📌 Create User
```sql
CREATE USER 'db_user'@'localhost' IDENTIFIED BY 'secure_pass';
```

## 📌 Grant Privileges
```sql
GRANT SELECT, INSERT, UPDATE ON company_db.* TO 'db_user'@'localhost';
```

## 📌 Revoke Privileges
```sql
REVOKE UPDATE ON company_db.* FROM 'db_user'@'localhost';
```

## 📌 Drop User
```sql
DROP USER 'db_user'@'localhost';
```

# 🔹 6. Roles (RBAC – Role-Based Access Control)
Roles simplify permission management.

## 📌 Create Role
```sql
CREATE ROLE 'read_only_user';
```

## 📌 Grant Privileges to Role
```sql
GRANT SELECT ON company_db.* TO 'read_only_user';
```

## 📌 Assign Role to User
```sql
GRANT 'read_only_user' TO 'db_user'@'localhost';
```

# 🔹 7. Password Security
- Use strong passwords
- Avoid default credentials
- Rotate passwords regularly
- Use password policies

# 🔹 8. Encryption

## 📌 Data at Rest
- Encrypt stored data

## 📌 Data in Transit
- Use SSL/TLS

## 📌 Example (MySQL SSL)
```sql
SHOW VARIABLES LIKE '%ssl%';
```

# 🔹 9. SQL Injection (Most Important 🔥)

SQL Injection is a major security risk.

## 📌 Example (Unsafe Query)
```sql
SELECT * FROM users
WHERE username = 'admin' AND password = '123';
```

## 📌 Attack Example
```sql
' OR '1'='1
```

## 📌 Prevention
- Use prepared statements
- Validate input
- Use ORM (Laravel, etc.)

## 📌 Prepared Statement Example
```sql
PREPARE stmt FROM
'SELECT * FROM users WHERE username = ? AND password = ?';
```


# 🔹 10. Auditing & Logging

Track database activity.

## 📌 Why?
- Detect suspicious activity
- Maintain logs for compliance

## 📌 Example
```sql
SHOW VARIABLES LIKE 'general_log';
```

# 🔹 11. Backup Security
- Encrypt backups
- Restrict access
- Store securely
- Use offsite storage

# 🔹 12. Network Security
- Restrict DB access to specific IPs
- Use firewall
- Disable remote root login

# 🔹 13. Least Privilege Principle
Give only required permissions.

## 📌 Example
Bad:
```sql
GRANT ALL PRIVILEGES ON *.* TO 'user';
```

Good:
```sql
GRANT SELECT ON company_db.* TO 'user';
```

# 🔹 14. Data Masking
Hide sensitive data.

## Example
```sql
SELECT CONCAT(SUBSTRING(phone,1,2),'****') AS masked_phone
FROM users;
```

# 🔹 15. Access Control Types
- Role-Based Access Control (RBAC)
- Attribute-Based Access Control (ABAC)

# 🔹 16. Secure Configuration
- Disable unnecessary services
- Change default ports
- Update DB regularly
- Patch vulnerabilities

# 🔹 17. Monitoring & Alerts
- Monitor login attempts
- Detect unusual queries
- Alert on suspicious activity

# 🔹 18. Interview Questions (Very Important 🔥)

## Q1. What is Database Security?
Protecting database from unauthorized access.

---

## Q2. Difference between Authentication and Authorization?
Authentication verifies identity, Authorization gives access.

---

## Q3. What is SQL Injection?
Attack using malicious SQL input.

---

## Q4. How to prevent SQL Injection?
- Prepared statements  
- Input validation  
- ORM  

---

## Q5. What is Encryption?
Protecting data using encoding.

---

## Q6. What is RBAC?
Role-Based Access Control.

---

## Q7. What is Least Privilege?
Give minimum required access.

---

# 🔹 19. Real-World Scenario

## 📌 Problem:
Unauthorized user accessed database.

## 📌 Solution:
- Check logs  
- Revoke access  
- Change passwords  
- Enable encryption  
- Restrict IP access  

---

# 🎯 Final Summary

To master Database Security:

- Manage users and roles  
- Use strong authentication  
- Apply least privilege principle  
- Prevent SQL injection  
- Encrypt data  
- Monitor database activity  
- Secure backups and network  

---

👉 **Core Focus:**
Security = Access Control + Encryption + Monitoring + Prevention