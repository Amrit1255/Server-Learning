# 📘 High Availability & Scalability – Complete Notes

---

# 🔹 1. What is High Availability (HA)?

High Availability ensures that the **database/system is always available** with minimal downtime.

Goal:
- Reduce downtime
- Ensure continuous access
- Handle failures automatically

---

# 🔹 2. What is Scalability?

Scalability is the ability of a system to **handle increasing load** (users, data, traffic).

---

## 📌 Types of Scalability

### 🔹 Vertical Scaling (Scale Up)
- Increase CPU, RAM, Storage
- Example: Upgrade server

### 🔹 Horizontal Scaling (Scale Out)
- Add more servers
- Distribute load

---

## 📌 Difference

| Feature        | Vertical Scaling     | Horizontal Scaling     |
|---------------|--------------------|----------------------|
| Approach      | Upgrade server     | Add servers          |
| Cost          | Expensive          | Flexible             |
| Limit         | Hardware limit     | Scalable             |
| Complexity    | Easy               | Complex              |

---

# 🔹 3. Replication (Core Concept 🔥)

Replication is copying data from one database server to another.

---

## 📌 Types of Replication

### 🔹 Master-Slave (Primary-Replica)
- One master (write)
- Multiple slaves (read)

### 🔹 Master-Master
- Both servers handle read/write

---

## 📌 Example

```text
User → Master DB (Write)
User → Replica DB (Read)
```
## 📌 Benefits
- Load balancing
- Data redundancy
- High availability
- Backup support

# 🔹 4. Failover
Failover automatically switches to backup server when primary fails.

## 📌 Types
- Automatic Failover
- Manual Failover

## 📌 Example
```text
Primary DB ❌ → Secondary DB ✅
```

# 🔹 5. Load Balancing
Load balancing distributes database requests across multiple servers.

## 📌 Example
```text
User Requests → Load Balancer → Multiple DB Servers
```
##c📌 Benefits
- Better performance
- Avoid overload
- High availability


# 🔹 6. Clustering
Clustering is a group of servers working together as one system.

## 📌 Types
- Active-Active (all nodes active)
- Active-Passive (one active, one standby)

## 📌 Benefits
- High availability
- Fault tolerance
- Scalability

# 🔹 7. Sharding (Horizontal Partitioning)
Sharding splits data across multiple databases.

## 📌 Example
```text
Users A–M → DB1
Users N–Z → DB2
```
## 📌 Benefits
- Handles large data
- Improves performance
- Enables horizontal scaling

# 🔹 8. Partitioning
Partitioning splits a large table into smaller parts within same DB.

## 📌 Types
- Range Partitioning
- List Partitioning
- Hash Partitioning

## 📌 Example
```sql
CREATE TABLE sales (
    sale_id INT,
    sale_date DATE
)
PARTITION BY RANGE (YEAR(sale_date)) (
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025)
);
```

# 🔹 9. CAP Theorem (Important Concept 🔥)
A distributed system can only guarantee two out of three:
- Consistency
- Availability
- Partition Tolerance

## 📌 Explanation
| Term         | Meaning                  |
| ------------ | ------------------------ |
| Consistency  | Same data across nodes   |
| Availability | System always responds   |
| Partition    | Network failure handling |

# 🔹 10. Caching (Performance Boost 🚀)
Caching stores frequently used data.

## 📌 Types
- Application Cache
- Database Cache
- Distributed Cache

## 📌 Tools
- Redis
- Memcached

# 🔹 11. Auto Scaling
Automatically increases/decreases resources based on load.

## 📌 Example
```text
High Traffic → Add Servers
Low Traffic → Remove Servers
```

# 🔹 12. Backup & Recovery Integration
HA systems must include:
- Regular backups
- Disaster recovery plan
- Replication setup


# 🔹 13. Monitoring & Alerts
Monitor system health.

## 📌 Tools
- Prometheus
- Grafana
- Nagios

## 📌 What to Monitor
- CPU usage
- Memory usage
- Disk I/O
- Query performance
- Replication lag

# 🔹 14. Real-World Architecture Example
```text
User → Load Balancer → App Server → Master DB
                                 → Replica DB
                                 → Cache (Redis)
```


# 🔹 15. Interview Questions (Very Important 🔥)

## Q1. What is High Availability?
System remains available with minimal downtime.

---

## Q2. What is Scalability?
Ability to handle increasing load.

---

## Q3. Vertical vs Horizontal Scaling?
Vertical = upgrade server, Horizontal = add servers.

---

## Q4. What is Replication?
Copying data between servers.

---

## Q5. What is Failover?
Switching to backup server when primary fails.

---

## Q6. What is Sharding?
Splitting data across multiple databases.

---

## Q7. What is Load Balancing?
Distributing requests across servers.

---

## Q8. What is CAP Theorem?
Only two of Consistency, Availability, Partition Tolerance can be guaranteed.

---

# 🔹 16. Real-World Scenario

## 📌 Problem:
Database crashes during peak traffic.

## 📌 Solution:
- Use replication  
- Enable failover  
- Add load balancer  
- Use caching  
- Scale horizontally  

---

# 🎯 Final Summary

To master High Availability & Scalability:

- Understand replication and failover  
- Learn load balancing  
- Use clustering and sharding  
- Apply caching  
- Monitor systems  
- Plan disaster recovery  

