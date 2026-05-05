# 📘 SQL Mastery – Complete Notes for DBA Revision

---

# 🔹 1. What is SQL?

SQL stands for **Structured Query Language**.

It is used to communicate with relational databases.

With SQL, we can:

- Create databases
- Create tables
- Insert data
- Read data
- Update data
- Delete data
- Join multiple tables
- Create views
- Create stored procedures
- Manage users and permissions
- Handle transactions
- Optimize queries

---

# 🔹 2. Types of SQL Commands

SQL commands are mainly divided into 5 categories:

1. DDL → Data Definition Language
2. DML → Data Manipulation Language
3. DQL → Data Query Language
4. DCL → Data Control Language
5. TCL → Transaction Control Language

---

# 🔹 3. DDL – Data Definition Language

DDL commands are used to define or modify database structure.

Common DDL commands:

- CREATE
- ALTER
- DROP
- TRUNCATE
- RENAME

---

## 📌 CREATE DATABASE

```sql
CREATE DATABASE company_db;
```

---

## 📌 USE DATABASE

```sql
USE company_db;
```

---

## 📌 CREATE TABLE

```sql
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    salary DECIMAL(10,2),
    department_id INT,
    joining_date DATE
);
```

---

## 📌 ALTER TABLE – Add Column

```sql
ALTER TABLE employees
ADD phone VARCHAR(15);
```

---

## 📌 ALTER TABLE – Modify Column

```sql
ALTER TABLE employees
MODIFY salary DECIMAL(12,2);
```

---

## 📌 ALTER TABLE – Drop Column

```sql
ALTER TABLE employees
DROP COLUMN phone;
```

---

## 📌 DROP TABLE

```sql
DROP TABLE employees;
```

---

## 📌 TRUNCATE TABLE

```sql
TRUNCATE TABLE employees;
```

### Difference Between DELETE, DROP, and TRUNCATE

| Command | Meaning |
|---|---|
| DELETE | Deletes selected rows |
| TRUNCATE | Deletes all rows but keeps table structure |
| DROP | Deletes complete table structure and data |

---

# 🔹 4. DML – Data Manipulation Language

DML commands are used to manage data inside tables.

Common DML commands:

- INSERT
- UPDATE
- DELETE

---

## 📌 INSERT Data

```sql
INSERT INTO employees (
    employee_id,
    name,
    email,
    salary,
    department_id,
    joining_date
)
VALUES (
    1,
    'Rahul Sharma',
    'rahul@example.com',
    50000.00,
    101,
    '2024-01-15'
);
```

---

## 📌 INSERT Multiple Rows

```sql
INSERT INTO employees VALUES
(2, 'Priya Singh', 'priya@example.com', 60000.00, 102, '2024-02-10'),
(3, 'Aman Verma', 'aman@example.com', 45000.00, 101, '2024-03-05');
```

---

## 📌 UPDATE Data

```sql
UPDATE employees
SET salary = 55000.00
WHERE employee_id = 1;
```

---

## 📌 DELETE Data

```sql
DELETE FROM employees
WHERE employee_id = 3;
```

---

# 🔹 5. DQL – Data Query Language

DQL is used to retrieve data from database tables.

Main DQL command:

- SELECT

---

## 📌 SELECT All Columns

```sql
SELECT *
FROM employees;
```

---

## 📌 SELECT Specific Columns

```sql
SELECT name, email, salary
FROM employees;
```

---

## 📌 WHERE Clause

Used to filter records.

```sql
SELECT *
FROM employees
WHERE salary > 50000;
```

---

## 📌 AND Operator

```sql
SELECT *
FROM employees
WHERE salary > 50000
AND department_id = 101;
```

---

## 📌 OR Operator

```sql
SELECT *
FROM employees
WHERE department_id = 101
OR department_id = 102;
```

---

## 📌 NOT Operator

```sql
SELECT *
FROM employees
WHERE NOT department_id = 101;
```

---

# 🔹 6. SQL Operators

---

## 📌 Comparison Operators

| Operator | Meaning |
|---|---|
| = | Equal to |
| != | Not equal to |
| <> | Not equal to |
| > | Greater than |
| < | Less than |
| >= | Greater than or equal |
| <= | Less than or equal |

```sql
SELECT *
FROM employees
WHERE salary >= 50000;
```

---

## 📌 BETWEEN Operator

```sql
SELECT *
FROM employees
WHERE salary BETWEEN 40000 AND 70000;
```

---

## 📌 IN Operator

```sql
SELECT *
FROM employees
WHERE department_id IN (101, 102, 103);
```

---

## 📌 LIKE Operator

Used for pattern matching.

```sql
SELECT *
FROM employees
WHERE name LIKE 'A%';
```

Meaning:

- `A%` → Starts with A
- `%a` → Ends with a
- `%man%` → Contains man

---

## 📌 IS NULL

```sql
SELECT *
FROM employees
WHERE email IS NULL;
```

---

## 📌 IS NOT NULL

```sql
SELECT *
FROM employees
WHERE email IS NOT NULL;
```

---

# 🔹 7. ORDER BY

Used to sort records.

---

## 📌 Ascending Order

```sql
SELECT *
FROM employees
ORDER BY salary ASC;
```

---

## 📌 Descending Order

```sql
SELECT *
FROM employees
ORDER BY salary DESC;
```

---

## 📌 Multiple Column Sorting

```sql
SELECT *
FROM employees
ORDER BY department_id ASC, salary DESC;
```

---

# 🔹 8. LIMIT / TOP

Used to restrict number of records.

---

## 📌 MySQL / PostgreSQL

```sql
SELECT *
FROM employees
LIMIT 5;
```

---

## 📌 SQL Server

```sql
SELECT TOP 5 *
FROM employees;
```

---

# 🔹 9. DISTINCT

Used to remove duplicate values.

```sql
SELECT DISTINCT department_id
FROM employees;
```

---

# 🔹 10. Aggregate Functions

Aggregate functions perform calculations on multiple rows.

Common aggregate functions:

- COUNT()
- SUM()
- AVG()
- MIN()
- MAX()

---

## 📌 COUNT

```sql
SELECT COUNT(*) AS total_employees
FROM employees;
```

---

## 📌 SUM

```sql
SELECT SUM(salary) AS total_salary
FROM employees;
```

---

## 📌 AVG

```sql
SELECT AVG(salary) AS average_salary
FROM employees;
```

---

## 📌 MIN

```sql
SELECT MIN(salary) AS minimum_salary
FROM employees;
```

---

## 📌 MAX

```sql
SELECT MAX(salary) AS maximum_salary
FROM employees;
```

---

# 🔹 11. GROUP BY

GROUP BY is used to group rows based on one or more columns.

```sql
SELECT department_id, COUNT(*) AS total_employees
FROM employees
GROUP BY department_id;
```

---

## 📌 GROUP BY with SUM

```sql
SELECT department_id, SUM(salary) AS total_salary
FROM employees
GROUP BY department_id;
```

---

# 🔹 12. HAVING Clause

HAVING is used to filter grouped data.

WHERE filters rows before grouping.

HAVING filters groups after grouping.

```sql
SELECT department_id, COUNT(*) AS total_employees
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 5;
```

---

# 🔹 13. WHERE vs HAVING

| WHERE | HAVING |
|---|---|
| Filters rows | Filters groups |
| Used before GROUP BY | Used after GROUP BY |
| Cannot use aggregate functions directly | Can use aggregate functions |

Example:

```sql
SELECT department_id, AVG(salary) AS avg_salary
FROM employees
WHERE salary > 30000
GROUP BY department_id
HAVING AVG(salary) > 50000;
```

---

# 🔹 14. SQL Joins

Joins are used to combine data from multiple tables.

Types of joins:

- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- FULL JOIN
- CROSS JOIN
- SELF JOIN

---

## 📌 Sample Tables

```sql
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10,2),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);
```

---

## 📌 INNER JOIN

Returns only matching records from both tables.

```sql
SELECT e.employee_id, e.name, d.department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id;
```

---

## 📌 LEFT JOIN

Returns all records from left table and matching records from right table.

```sql
SELECT e.name, d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id;
```

---

## 📌 RIGHT JOIN

Returns all records from right table and matching records from left table.

```sql
SELECT e.name, d.department_name
FROM employees e
RIGHT JOIN departments d
ON e.department_id = d.department_id;
```

---

## 📌 FULL JOIN

Returns all records from both tables.

```sql
SELECT e.name, d.department_name
FROM employees e
FULL JOIN departments d
ON e.department_id = d.department_id;
```

---

## 📌 CROSS JOIN

Returns Cartesian product.

```sql
SELECT e.name, d.department_name
FROM employees e
CROSS JOIN departments d;
```

---

## 📌 SELF JOIN

A table joins with itself.

```sql
CREATE TABLE staff (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    manager_id INT
);

SELECT e.name AS employee_name,
       m.name AS manager_name
FROM staff e
LEFT JOIN staff m
ON e.manager_id = m.employee_id;
```

---

# 🔹 15. Subqueries

A subquery is a query inside another query.

---

## 📌 Subquery in WHERE

```sql
SELECT *
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);
```

---

## 📌 Subquery with IN

```sql
SELECT *
FROM employees
WHERE department_id IN (
    SELECT department_id
    FROM departments
    WHERE department_name IN ('IT', 'HR')
);
```

---

## 📌 Subquery in FROM

```sql
SELECT department_id, avg_salary
FROM (
    SELECT department_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
) AS dept_avg;
```

---

# 🔹 16. Correlated Subquery

A correlated subquery depends on the outer query.

```sql
SELECT e1.name, e1.salary, e1.department_id
FROM employees e1
WHERE e1.salary > (
    SELECT AVG(e2.salary)
    FROM employees e2
    WHERE e2.department_id = e1.department_id
);
```

Meaning:

Show employees whose salary is greater than the average salary of their own department.

---

# 🔹 17. EXISTS Operator

EXISTS checks whether a subquery returns any record.

```sql
SELECT department_name
FROM departments d
WHERE EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.department_id = d.department_id
);
```

---

# 🔹 18. CTE – Common Table Expression

CTE makes complex queries easier to read.

```sql
WITH department_salary AS (
    SELECT department_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
)
SELECT *
FROM department_salary
WHERE avg_salary > 50000;
```

---

# 🔹 19. Recursive CTE

Used for hierarchical data like employee-manager structure.

```sql
WITH RECURSIVE employee_hierarchy AS (
    SELECT employee_id, name, manager_id
    FROM staff
    WHERE manager_id IS NULL

    UNION ALL

    SELECT s.employee_id, s.name, s.manager_id
    FROM staff s
    INNER JOIN employee_hierarchy eh
    ON s.manager_id = eh.employee_id
)
SELECT *
FROM employee_hierarchy;
```

---

# 🔹 20. Window Functions

Window functions perform calculations across rows related to current row.

Common window functions:

- ROW_NUMBER()
- RANK()
- DENSE_RANK()
- LEAD()
- LAG()
- SUM() OVER()
- AVG() OVER()

---

## 📌 ROW_NUMBER

```sql
SELECT name,
       salary,
       ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num
FROM employees;
```

---

## 📌 RANK

```sql
SELECT name,
       salary,
       RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees;
```

---

## 📌 DENSE_RANK

```sql
SELECT name,
       salary,
       DENSE_RANK() OVER (ORDER BY salary DESC) AS dense_salary_rank
FROM employees;
```

---

## 📌 Difference Between RANK and DENSE_RANK

If salaries are:

| Name | Salary |
|---|---|
| A | 90000 |
| B | 80000 |
| C | 80000 |
| D | 70000 |

RANK result:

| Name | Rank |
|---|---|
| A | 1 |
| B | 2 |
| C | 2 |
| D | 4 |

DENSE_RANK result:

| Name | Dense Rank |
|---|---|
| A | 1 |
| B | 2 |
| C | 2 |
| D | 3 |

---

## 📌 PARTITION BY

Used to divide data into groups for window calculations.

```sql
SELECT name,
       department_id,
       salary,
       RANK() OVER (
           PARTITION BY department_id
           ORDER BY salary DESC
       ) AS department_salary_rank
FROM employees;
```

---

## 📌 LEAD

Shows next row value.

```sql
SELECT name,
       salary,
       LEAD(salary) OVER (ORDER BY salary DESC) AS next_salary
FROM employees;
```

---

## 📌 LAG

Shows previous row value.

```sql
SELECT name,
       salary,
       LAG(salary) OVER (ORDER BY salary DESC) AS previous_salary
FROM employees;
```

---

# 🔹 21. CASE Statement

CASE is used for conditional logic.

```sql
SELECT name,
       salary,
       CASE
           WHEN salary >= 80000 THEN 'High Salary'
           WHEN salary >= 50000 THEN 'Medium Salary'
           ELSE 'Low Salary'
       END AS salary_category
FROM employees;
```

---

# 🔹 22. String Functions

---

## 📌 CONCAT

```sql
SELECT CONCAT(name, ' - ', email) AS employee_info
FROM employees;
```

---

## 📌 UPPER

```sql
SELECT UPPER(name) AS uppercase_name
FROM employees;
```

---

## 📌 LOWER

```sql
SELECT LOWER(email) AS lowercase_email
FROM employees;
```

---

## 📌 LENGTH

```sql
SELECT name, LENGTH(name) AS name_length
FROM employees;
```

---

## 📌 SUBSTRING

```sql
SELECT SUBSTRING(name, 1, 3) AS short_name
FROM employees;
```

---

# 🔹 23. Date Functions

---

## 📌 Current Date

```sql
SELECT CURRENT_DATE;
```

---

## 📌 Current Timestamp

```sql
SELECT CURRENT_TIMESTAMP;
```

---

## 📌 Extract Year

```sql
SELECT name, YEAR(joining_date) AS joining_year
FROM employees;
```

---

## 📌 Date Difference

```sql
SELECT name,
       DATEDIFF(CURRENT_DATE, joining_date) AS days_worked
FROM employees;
```

---

# 🔹 24. Numeric Functions

---

## 📌 ROUND

```sql
SELECT ROUND(AVG(salary), 2) AS rounded_avg_salary
FROM employees;
```

---

## 📌 CEIL

```sql
SELECT CEIL(salary) AS salary_ceil
FROM employees;
```

---

## 📌 FLOOR

```sql
SELECT FLOOR(salary) AS salary_floor
FROM employees;
```

---

# 🔹 25. NULL Handling

NULL means missing or unknown value.

---

## 📌 IFNULL / COALESCE

```sql
SELECT name,
       COALESCE(email, 'No Email Provided') AS email_address
FROM employees;
```

---

## 📌 NULLIF

```sql
SELECT NULLIF(100, 100) AS result;
```

Output:

```text
NULL
```

---

# 🔹 26. Constraints in SQL

Constraints are rules applied to table columns.

Types:

- NOT NULL
- UNIQUE
- PRIMARY KEY
- FOREIGN KEY
- CHECK
- DEFAULT

---

## 📌 NOT NULL

```sql
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);
```

---

## 📌 UNIQUE

```sql
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    email VARCHAR(100) UNIQUE
);
```

---

## 📌 CHECK

```sql
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10,2) CHECK (salary > 0)
);
```

---

## 📌 DEFAULT

```sql
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    status VARCHAR(20) DEFAULT 'active'
);
```

---

# 🔹 27. Indexes

Indexes improve search performance.

---

## 📌 Create Index

```sql
CREATE INDEX idx_employee_email
ON employees(email);
```

---

## 📌 Composite Index

```sql
CREATE INDEX idx_department_salary
ON employees(department_id, salary);
```

---

## 📌 Drop Index

MySQL:

```sql
DROP INDEX idx_employee_email
ON employees;
```

PostgreSQL:

```sql
DROP INDEX idx_employee_email;
```

---

## 📌 When Index is Useful

Index is useful when:

- Column is frequently searched
- Column is used in WHERE
- Column is used in JOIN
- Column is used in ORDER BY
- Table has large amount of data

---

## 📌 When Index is Not Useful

Index is not useful when:

- Table is very small
- Column has too many duplicate values
- Column is frequently updated
- Query returns most rows of table

---

# 🔹 28. Views

A view is a virtual table based on a SQL query.

---

## 📌 Create View

```sql
CREATE VIEW high_salary_employees AS
SELECT employee_id, name, salary
FROM employees
WHERE salary > 70000;
```

---

## 📌 Use View

```sql
SELECT *
FROM high_salary_employees;
```

---

## 📌 Drop View

```sql
DROP VIEW high_salary_employees;
```

---

# 🔹 29. Stored Procedures

Stored procedure is a saved SQL program that can be reused.

---

## 📌 Create Procedure

```sql
DELIMITER //

CREATE PROCEDURE GetEmployeesByDepartment(IN dept_id INT)
BEGIN
    SELECT *
    FROM employees
    WHERE department_id = dept_id;
END //

DELIMITER ;
```

---

## 📌 Call Procedure

```sql
CALL GetEmployeesByDepartment(101);
```

---

# 🔹 30. Functions

A function returns a single value.

```sql
DELIMITER //

CREATE FUNCTION GetAnnualSalary(monthly_salary DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN monthly_salary * 12;
END //

DELIMITER ;
```

Use function:

```sql
SELECT name, GetAnnualSalary(salary) AS annual_salary
FROM employees;
```

---

# 🔹 31. Triggers

Trigger automatically executes when an event happens.

Events:

- INSERT
- UPDATE
- DELETE

---

## 📌 Audit Table

```sql
CREATE TABLE employee_audit (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    action_type VARCHAR(50),
    action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

---

## 📌 INSERT Trigger

```sql
DELIMITER //

CREATE TRIGGER after_employee_insert
AFTER INSERT ON employees
FOR EACH ROW
BEGIN
    INSERT INTO employee_audit(employee_id, action_type)
    VALUES (NEW.employee_id, 'INSERT');
END //

DELIMITER ;
```

---

# 🔹 32. Transactions

A transaction is a group of SQL operations executed as one unit.

---

## 📌 ACID Properties

| Property | Meaning |
|---|---|
| Atomicity | All operations complete or none |
| Consistency | Database remains valid |
| Isolation | Transactions do not interfere |
| Durability | Committed data is permanently saved |

---

## 📌 Transaction Example

```sql
START TRANSACTION;

UPDATE accounts
SET balance = balance - 1000
WHERE account_id = 1;

UPDATE accounts
SET balance = balance + 1000
WHERE account_id = 2;

COMMIT;
```

---

## 📌 Rollback Example

```sql
START TRANSACTION;

DELETE FROM employees
WHERE employee_id = 5;

ROLLBACK;
```

---

## 📌 Savepoint Example

```sql
START TRANSACTION;

UPDATE accounts
SET balance = balance - 500
WHERE account_id = 1;

SAVEPOINT step1;

UPDATE accounts
SET balance = balance + 500
WHERE account_id = 2;

ROLLBACK TO step1;

COMMIT;
```

---

# 🔹 33. DCL – Data Control Language

DCL commands are used to manage permissions.

---

## 📌 GRANT

```sql
GRANT SELECT, INSERT
ON company_db.*
TO 'db_user'@'localhost';
```

---

## 📌 REVOKE

```sql
REVOKE INSERT
ON company_db.*
FROM 'db_user'@'localhost';
```

---

# 🔹 34. SQL Execution Order

SQL query is written in this order:

```sql
SELECT
FROM
WHERE
GROUP BY
HAVING
ORDER BY
LIMIT
```

But SQL executes logically in this order:

1. FROM
2. JOIN
3. WHERE
4. GROUP BY
5. HAVING
6. SELECT
7. DISTINCT
8. ORDER BY
9. LIMIT

Example:

```sql
SELECT department_id, COUNT(*) AS total_employees
FROM employees
WHERE salary > 30000
GROUP BY department_id
HAVING COUNT(*) > 2
ORDER BY total_employees DESC
LIMIT 5;
```

---

# 🔹 35. Query Optimization Basics

Query optimization means improving SQL query performance.

---

## 📌 Use Specific Columns Instead of SELECT *

Bad:

```sql
SELECT *
FROM employees;
```

Good:

```sql
SELECT employee_id, name, salary
FROM employees;
```

---

## 📌 Use Indexes

```sql
CREATE INDEX idx_salary
ON employees(salary);
```

---

## 📌 Avoid Functions on Indexed Columns

Bad:

```sql
SELECT *
FROM employees
WHERE YEAR(joining_date) = 2024;
```

Good:

```sql
SELECT *
FROM employees
WHERE joining_date BETWEEN '2024-01-01' AND '2024-12-31';
```

---

## 📌 Use EXPLAIN

```sql
EXPLAIN
SELECT *
FROM employees
WHERE email = 'rahul@example.com';
```

---

# 🔹 36. Important SQL Interview Questions

---

## Q1. What is SQL?

SQL is Structured Query Language used to create, manage, retrieve, and manipulate data in relational databases.

---

## Q2. Difference between DELETE, TRUNCATE, and DROP?

| DELETE | TRUNCATE | DROP |
|---|---|---|
| Deletes selected rows | Deletes all rows | Deletes table |
| WHERE allowed | WHERE not allowed | Table removed |
| Slower | Faster | Fast |
| Structure remains | Structure remains | Structure removed |

---

## Q3. Difference between WHERE and HAVING?

WHERE filters rows before grouping.

HAVING filters groups after grouping.

---

## Q4. Difference between Primary Key and Foreign Key?

Primary Key uniquely identifies a record in a table.

Foreign Key creates relationship between two tables.

---

## Q5. Difference between INNER JOIN and LEFT JOIN?

INNER JOIN returns only matching rows.

LEFT JOIN returns all rows from left table and matching rows from right table.

---

## Q6. What is Index?

Index is a database object used to speed up data retrieval.

---

## Q7. What is View?

View is a virtual table based on a SQL query.

---

## Q8. What is Stored Procedure?

Stored procedure is a saved SQL block that can be reused.

---

## Q9. What is Trigger?

Trigger is SQL code that automatically runs when INSERT, UPDATE, or DELETE happens.

---

## Q10. What is Transaction?

Transaction is a group of SQL operations executed as a single unit.

---

# 🔹 37. Most Important SQL Practice Queries

---

## 📌 Find Second Highest Salary

```sql
SELECT MAX(salary) AS second_highest_salary
FROM employees
WHERE salary < (
    SELECT MAX(salary)
    FROM employees
);
```

---

## 📌 Find Duplicate Emails

```sql
SELECT email, COUNT(*) AS total
FROM employees
GROUP BY email
HAVING COUNT(*) > 1;
```

---

## 📌 Find Employees Without Department

```sql
SELECT e.*
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id
WHERE d.department_id IS NULL;
```

---

## 📌 Find Highest Salary in Each Department

```sql
SELECT department_id, MAX(salary) AS highest_salary
FROM employees
GROUP BY department_id;
```

---

## 📌 Find Employees Having Salary Greater Than Department Average

```sql
SELECT e1.*
FROM employees e1
WHERE e1.salary > (
    SELECT AVG(e2.salary)
    FROM employees e2
    WHERE e2.department_id = e1.department_id
);
```

---

## 📌 Find Top 3 Salaries Using Window Function

```sql
SELECT *
FROM (
    SELECT name,
           salary,
           DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_rank
    FROM employees
) ranked_employees
WHERE salary_rank <= 3;
```

---

# 🎯 Final Summary

To master SQL, focus on:

- SELECT queries
- WHERE filtering
- GROUP BY and HAVING
- Joins
- Subqueries
- CTEs
- Window functions
- Indexing
- Views
- Stored procedures
- Triggers
- Transactions
- Query optimization
- Backup and recovery basics
- User permissions

SQL is one of the most important skills for a DBA because every database operation depends on strong query understanding.

A good DBA should not only write SQL queries but also understand:

- How queries execute
- Why queries become slow
- How indexes improve performance
- How transactions protect data
- How permissions protect database security
- How joins connect business data
- How stored procedures automate database logic

---