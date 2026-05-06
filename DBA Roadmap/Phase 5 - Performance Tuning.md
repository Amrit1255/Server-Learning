# 📘 Database Performance Tuning – Complete Notes

---

# 🔹 1. What is Performance Tuning?

Performance tuning is the process of **optimizing database performance** to make queries faster and efficient.

Goal:
- Reduce query execution time
- Improve system performance
- Optimize resource usage (CPU, Memory, Disk)

---

# 🔹 2. Why Performance Tuning is Important?

- Improves user experience
- Reduces server load
- Handles large data efficiently
- Prevents system crashes
- Critical for real-time systems

---

# 🔹 3. Query Optimization (Core Skill 🔥)

## 📌 Bad Query Example

```sql
SELECT *
FROM employees;
```

## 📌 Optimized Query
```sql
SELECT employee_id, name, salary
FROM employees;
```

## 📌 Avoid Full Table Scan
 - Bad
 ```sql
 SELECT *
FROM employees
WHERE name = 'Rahul';
```
- Better (with index):
```sql
CREATE INDEX idx_name ON employees(name);

SELECT *
FROM employees
WHERE name = 'Rahul';
```

## 📌 Avoid Functions on Indexed Columns

- Bad
```sql
SELECT *
FROM employees
WHERE YEAR(joining_date) = 2024;
```
- Good
```sql
SELECT *
FROM employees
WHERE joining_date BETWEEN '2024-01-01' AND '2024-12-31';
```

# 🔹 4. Execution Plan (EXPLAIN)
Used to understand how query is executed.

```sql
EXPLAIN
SELECT *
FROM employees
WHERE salary > 50000;
```

## 📌 What to Look in EXPLAIN

- Type (ALL = bad, INDEX = good)
- Rows scanned
- Index used
- Extra (Using where, Using index)

# 🔹 5. Indexing (Most Important 🔥)
Indexes improve search speed.

## 📌 Create Index
```sql
CREATE INDEX idx_salary
ON employees(salary);
```

## 📌 Composite Index
```sql
CREATE INDEX idx_dept_salary
ON employees(department_id, salary);
```

## 📌 When to Use Index
- Frequently used in WHERE clause
- Used in JOIN conditions
- Used in ORDER BY
- Large tables

## 📌 When NOT to Use Index
- Small tables
- Columns with many duplicate values
- Columns frequently updated

# 🔹 6. Query Writing Best Practices

## 📌 Use WHERE instead of HAVING
- Bad
```sql
SELECT department_id, COUNT(*)
FROM employees
GROUP BY department_id
HAVING department_id = 101;
```
- Good
```sql
SELECT department_id, COUNT(*)
FROM employees
WHERE department_id = 101
GROUP BY department_id;
```

## 📌 Avoid SELECT *
- Bad
```sql
SELECT * FROM employees;
```
- Good
```sql
SELECT name, salary FROM employees;
```

## 📌 Use LIMIT
```sql
SELECT *
FROM employees
LIMIT 10;
```

## 📌 Use EXISTS instead of IN (for large data)
```sql
SELECT *
FROM employees e
WHERE EXISTS (
    SELECT 1
    FROM departments d
    WHERE e.department_id = d.department_id
);
```


# 🔹 7. Joins Optimization

## 📌 Avoid Unnecessary Joins

- Bad
```sql
SELECT *
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id;
```
- 'Only join needed tables'

## 📌 Use Indexed Columns in Joins
```sql
CREATE INDEX idx_dept_id ON employees(department_id);

SELECT *
FROM employees e
JOIN departments d
ON e.department_id = d.department_id;
```

# 🔹 8. Subquery vs JOIN

- Bad (slow subquery):
```sql
SELECT *
FROM employees
WHERE department_id IN (
    SELECT department_id FROM departments
);
```
- Better (JOIN)
```sql
SELECT e.*
FROM employees e
JOIN departments d
ON e.department_id = d.department_id;
```

# 🔹 9. Caching
Caching Stores Frequently accessed data

Types:
- Query cache
- Application cache (Redis)

## 📌 Example
Instead of hitting DB repeatedly:
- Store results in cache


# 🔹 10. Connection Pooling
Connection pooling reuses database connections.

Benefits:
- Faster performance
- Reduced overhead

# 🔹 11. Database Design Optimization

## 📌 Proper Data Types

- Bad
```sql
salary VARCHAR(100)
```

- Good
```sql
salary DECIMAL(10,2)
```


## 📌 Normalize Tables
- Avoid redundancy
- Maintain integrity

## 📌 Denormalize When Needed
- Improve read performance


# 🔹 12. Partitioning
Split large tables into smaller parts.

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

# 🔹 13. Monitoring & Logs

## 📌 Check Slow Queries
- MySQL:
```sql
SHOW VARIABLES LIKE 'slow_query_log';
```
## 📌 Enable Slow Query Log
```sql
SET GLOBAL slow_query_log = 'ON';
```

## 📌 PostgreSQL

```sql
EXPLAIN ANALYZE
SELECT * FROM employees;
```

# 🔹 14. Hardware Optimization
- Use SSD instead of HDD
- Increase RAM
- Use better CPU
- Optimize disk I/O

# 🔹 15. Transaction Optimization

## 📌 Keep Transactions Short
- Bad
```sql
START TRANSACTION;

-- Long operations

COMMIT;
```

## 📌 Use Proper Isolation Level
```sql
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
```

# 🔹 16. Avoid Deadlocks
- Access tables in same order
- Keep transactions short
- Use proper indexing

# 🔹 17. Batch Processing
Instead of:
```sql
INSERT INTO logs VALUES (...);
-- repeated many times
```

Use this
```sql
INSERT INTO logs VALUES (...), (...), (...);
```

# 🔹 18. Pagination Optimization
- Bad:
```sql
SELECT * FROM employees LIMIT 10000, 10;
```
- Good
```sql
SELECT *
FROM employees
WHERE employee_id > 10000
LIMIT 10;
```

# 🔹 19. Interview Questions (Very Important 🔥)

## Q1. What is Index?
Index improves speed of data retrieval.

---

## Q2. What is EXPLAIN?
Shows how query executes.

---

## Q3. Why is query slow?
- No index  
- Full table scan  
- Poor query design  
- Large data  

---

## Q4. How to optimize query?
- Use index  
- Avoid SELECT *  
- Use joins instead of subqueries  
- Use proper conditions  

---

## Q5. What is partitioning?
Splitting large table into smaller parts.

---

## Q6. What is caching?
Storing frequent results for faster access.

---

## Q7. Difference between WHERE and HAVING?
WHERE filters rows, HAVING filters grouped data.

---

# 🔹 20. Real-World Scenario

## 📌 Problem:
Website is slow while loading products.

## 📌 Solution:
- Add index on product_id  
- Optimize queries  
- Use caching  
- Use pagination  
- Analyze query with EXPLAIN  

---

# 🎯 Final Summary

To master Performance Tuning:

- Learn indexing deeply  
- Understand EXPLAIN plans  
- Write optimized queries  
- Avoid full table scans  
- Use proper joins  
- Monitor slow queries  
- Optimize transactions  
- Use caching and partitioning  

---

👉 **Core Focus:**
Performance = Query + Index + Design + Hardware