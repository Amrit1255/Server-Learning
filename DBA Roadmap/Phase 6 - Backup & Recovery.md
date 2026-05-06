# 📘 Backup & Recovery – Complete Notes (Critical for DBA ⚠️)

---

# 🔹 1. What is Backup?

Backup is the process of **creating a copy of database data** so it can be restored in case of:

- Data loss
- System failure
- Human error
- Cyber attacks
- Hardware failure

---

# 🔹 2. What is Recovery?

Recovery is the process of **restoring data from backup** to bring the database back to a consistent state.

---

# 🔹 3. Why Backup & Recovery is Important?

- Prevents data loss
- Ensures business continuity
- Required for disaster recovery
- Critical for production systems
- Highly asked in interviews 🔥

---

# 🔹 4. Types of Backup

---

## 📌 Full Backup

- Complete copy of entire database
- Easy to restore
- Takes more time and storage

```bash
mysqldump -u root -p company_db > full_backup.sql
```
## 📌 Incremental Backup
- Backs up only data changed since last backup
- Faster and smaller
- Requires full backup + increments to restore

## 📌 Differential Backup
- Backs up data changed since last full backup
- Faster restore than incremental

## 📌 Comparison
| Type         | Backup Size | Restore Speed | Complexity |
| ------------ | ----------- | ------------- | ---------- |
| Full         | Large       | Fast          | Simple     |
| Incremental  | Small       | Slow          | Complex    |
| Differential | Medium      | Medium        | Medium     |


# 🔹 5. Backup Methods

## 📌 Logical Backup
- Backup in SQL format
- Human-readable
- Example: mysqldump

```bash
mysqldump -u root -p company_db > backup.sql
```

## 📌 Physical Backup
- Copy of actual data files
- Faster backup/restore
- Not human-readable

# 🔹 6. Backup Strategies

## 📌 3-2-1 Rule
- 3 copies of data
- 2 different storage types
- 1 offsite backup

## 📌 Example Strategy
- Full backup → Weekly
- Incremental backup → Daily
- Store backup → Local + Cloud

# 🔹 7. Restore / Recovery

📌 MySQL Restore
```bash
mysql -u root -p company_db < backup.sql
```

📌 PostgreSQL Restore
```bash
psql -U postgres company_db < backup.sql
```

📌 SQL Server Restore
```sql
RESTORE DATABASE company_db
FROM DISK = 'C:\backup\company_db.bak';
```

# 🔹 8. Point-In-Time Recovery (PITR)
Restore database to a specific point in time.

Used when:
- Data deleted accidentally
- Need to recover exact state

## 📌 Concept
- Use full backup + transaction logs


# 🔹 9. Transaction Logs
Transaction logs store all changes made to database.

Used for:
- Recovery
- Rollback
- Auditing

# 🔹 10. Disaster Recovery (DR)
Disaster Recovery is a plan to restore database after failure.

📌 Examples of Disaster
- Server crash
- Disk failure
- Fire / flood
- Cyber attack

📌 DR Strategies
- Backup & restore
- Replication
- ailover systems

# 🔹 11. Replication
Replication copies data from one server to another.

## 📌 Types
- Master-Slave (Primary-Replica)
- Master-Master

## 📌 Benefits
- Data redundancy
- Load balancing
- High availability

# 🔹 12. Failover
Failover automatically switches to backup server when primary fails.

## 📌 Example
- Primary DB fails → Secondary DB becomes active

# 🔹 13. Backup Automation

## 📌 Cron Job Example (Linux)
```bash
0 2 * * * mysqldump -u root -p password company_db > /backup/db.sql
```
Runs daily at 2 AM

# 🔹 14. Backup Security
- Encrypt backups
- Store securely
- Limit access
- Use strong passwords

# 🔹 15. Testing Backups (Very Important 🔥)

Always test backups.

## 📌 Why?
- Backup may be corrupted  
- Restore process may fail  

## 📌 Practice
- Restore backup in test environment  
- Verify data integrity  

---

# 🔹 16. Monitoring Backups

- Check backup logs  
- Verify success/failure  
- Alert on failure  

---

# 🔹 17. Interview Questions (Very Important 🔥)

## Q1. What is Backup?
Backup is a copy of database data used for recovery.

---

## Q2. What is Recovery?
Restoring data from backup to consistent state.

---

## Q3. Types of Backup?
- Full  
- Incremental  
- Differential  

---

## Q4. What is PITR?
Point-In-Time Recovery restores data to a specific time.

---

## Q5. What is Replication?
Copying data from one server to another.

---

## Q6. What is Failover?
Switching to backup server when primary fails.

---

## Q7. Why test backups?
To ensure backup works during real failure.

---

# 🔹 18. Real-World Scenario

## 📌 Problem:
Accidentally deleted customer table.

## 📌 Solution:
- Restore from last full backup  
- Apply incremental logs  
- Use PITR if needed  

---

# 🎯 Final Summary

To master Backup & Recovery:

- Understand backup types  
- Learn restore process  
- Use transaction logs  
- Implement replication  
- Plan disaster recovery  
- Automate backups  
- Test backups regularly  

---

👉 **Core Focus:**
Backup = Safety, Recovery = Survival