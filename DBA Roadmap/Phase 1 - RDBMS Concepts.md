# 📘 RDBMS Concepts – Complete Notes

---

# 🔹 1. What is RDBMS?

RDBMS (Relational Database Management System) is a type of database management system that stores data in the form of **tables (relations)**.

- Data is organized in **rows and columns**
- Relationships between tables are maintained using **keys**
- Uses **SQL (Structured Query Language)** for operations

👉 Examples:
- :contentReference[oaicite:0]{index=0}  
- :contentReference[oaicite:1]{index=1}  
- :contentReference[oaicite:2]{index=2}  
- :contentReference[oaicite:3]{index=3}  

```sql
CREATE DATABASE company_db;
USE company_db
```

---


# 🔹 2. Table, Row, Column

## 📌 Table
- A collection of related data stored in rows and columns
- Example: `Students`, `Orders`

## 📌 Row (Tuple)
- A single record in a table

## 📌 Column (Attribute)
- A field representing a property of the data

```sql
CREATE TABLE employees (
    employee_id INT,
    name VARCHAR(100),
    email VARCHAR(100),
    salary DECIMAL(10,2)
);

INSERT INTO employees VALUES
(1, 'Rahul Sharma', 'rahul@example.com', 45000.00);
```

---

# 🔹 3. Keys in RDBMS

## 🔑 Primary Key
- Uniquely identifies each record
- Cannot be NULL
- Only one per table
```sql
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);
```

## 🔑 Foreign Key
- Links two tables
- Refers to Primary Key in another table

```sql
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);
```

## 🔑 Candidate Key
- All possible keys that can uniquely identify records

## 🔑 Super Key
- Set of attributes that uniquely identify rows

## 🔑 Composite Key
- Combination of multiple columns to form a key
```sql 
CREATE TABLE project_assignments (
    employee_id INT,
    project_id INT,
    assigned_date DATE,
    PRIMARY KEY (employee_id, project_id)
);
```

---

# 🔹 4. Constraints

Constraints enforce rules on data.

- NOT NULL → Column cannot be empty
- UNIQUE → No duplicate values
- PRIMARY KEY → Unique + Not Null
- FOREIGN KEY → Maintains relationship
- CHECK → Validates condition
- DEFAULT → Sets default value

```sql
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    age INT CHECK (age >= 18),
    status VARCHAR(20) DEFAULT 'active'
);
```

---

# 🔹 5. Normalization

Process of organizing data to reduce redundancy.

## 📌 Types:
- 1NF → Atomic values (no repeating groups)
- 2NF → Remove partial dependency
- 3NF → Remove transitive dependency
- BCNF → Advanced form of 3NF

```sql
CREATE TABLE student_courses (
    student_id INT,
    student_name VARCHAR(100),
    course1 VARCHAR(100),
    course2 VARCHAR(100)
);
```

- After 1NF
```sql
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100)
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100)
);

CREATE TABLE student_course_mapping (
    student_id INT,
    course_id INT,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);
```

👉 Goal:
- Reduce redundancy
- Improve data integrity

---

# 🔹 6. Denormalization

- Opposite of normalization
- Used to improve performance
- Adds redundancy intentionally

```sql
CREATE TABLE order_summary (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    product_name VARCHAR(100),
    total_amount DECIMAL(10,2)
);
```

---

# 🔹 7. Indexing

Used to improve query performance.

## 📌 Types:
- Clustered Index → Defines physical order of data
- Non-Clustered Index → Separate structure pointing to data

```sql
CREATE INDEX idx_employee_email
ON employees(email);
```

👉 Benefits:
- Faster search
- Faster retrieval

👉 Drawback:
- Slower insert/update

---

# 🔹 8. Relationships

## 📌 Types:
- One-to-One (1:1)
```sql
CREATE TABLE employee_profiles (
    profile_id INT PRIMARY KEY,
    employee_id INT UNIQUE,
    address VARCHAR(255),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);
```
- One-to-Many (1:N)
```sql
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
```
- Many-to-Many (M:N)
```sql
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE subjects (
    subject_id INT PRIMARY KEY,
    subject_name VARCHAR(100)
);

CREATE TABLE student_subjects (
    student_id INT,
    subject_id INT,
    PRIMARY KEY (student_id, subject_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id)
);
```

---

# 🔹 9. SQL Basics

## 📌 Types of SQL Commands:

### 🔹 DDL (Data Definition Language)
- CREATE
- ALTER
- DROP

```sql
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10,2)
);

ALTER TABLE products ADD stock INT;

DROP TABLE products;
```

### 🔹 DML (Data Manipulation Language)
- INSERT
- UPDATE
- DELETE

```sql
INSERT INTO products VALUES (1, 'Laptop', 55000.00, 10);

UPDATE products
SET price = 52000.00
WHERE product_id = 1;

DELETE FROM products
WHERE product_id = 1;
```

### 🔹 DQL (Data Query Language)
- SELECT

```sql
SELECT * FROM products;

SELECT product_name, price
FROM products
WHERE price > 10000;
```

### 🔹 DCL (Data Control Language)
- GRANT
- REVOKE
```sql
GRANT SELECT, INSERT ON company_db.* TO 'db_user'@'localhost';

REVOKE INSERT ON company_db.* FROM 'db_user'@'localhost';
```

### 🔹 TCL (Transaction Control Language)
- COMMIT
- ROLLBACK
- SAVEPOINT

```sql
START TRANSACTION;

UPDATE accounts
SET balance = balance - 500
WHERE account_id = 1;

UPDATE accounts
SET balance = balance + 500
WHERE account_id = 2;

COMMIT;
```

---

# 🔹 10. Transactions

A transaction is a group of operations executed as a single unit.

```sql
START TRANSACTION;

UPDATE bank_accounts
SET balance = balance - 1000
WHERE account_id = 101;

UPDATE bank_accounts
SET balance = balance + 1000
WHERE account_id = 102;

COMMIT;
```

Rollback Example
```sql
START TRANSACTION;

DELETE FROM employees
WHERE employee_id = 5;

ROLLBACK;
```


## 📌 ACID Properties:

- Atomicity → All or nothing
- Consistency → Valid state maintained
- Isolation → Transactions don’t interfere
- Durability → Data persists after commit

---

# 🔹 11. Joins

Used to combine data from multiple tables.

## 📌 Types:
- INNER JOIN → Matching records only
```sql
SELECT e.name, d.department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id;
```

- LEFT JOIN → All from left + matched from right
```sql
SELECT e.name, d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id;
```

- RIGHT JOIN → All from right + matched from left
```sql
SELECT e.name, d.department_name
FROM employees e
RIGHT JOIN departments d
ON e.department_id = d.department_id;
```

- FULL JOIN → All records from both tables
```sql
SELECT e.name, d.department_name
FROM employees e
FULL JOIN departments d
ON e.department_id = d.department_id;
```
---

# 🔹 12. Views

- Virtual table based on query
- Does not store data physically

```sql
CREATE VIEW high_salary_employees AS
SELECT employee_id, name, salary
FROM employees
WHERE salary > 50000;
```

## 📌 Types:
- Simple View
- Complex View

---

# 🔹 13. Stored Procedures & Triggers

## 📌 Stored Procedure
- Precompiled SQL code
- Reusable

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

```sql
CALL GetEmployeesByDepartment(1);
```

## 📌 Trigger
- Automatically executes on events (INSERT, UPDATE, DELETE)
```sql
CREATE TABLE employee_audit (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    action_type VARCHAR(50),
    action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

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

# 🔹 14. Schema

- Logical structure of database
- Defines tables, relationships, constraints
```sql
CREATE SCHEMA company_schema;
```
```sql
CREATE TABLE company_schema.teams (
    team_id INT PRIMARY KEY,
    team_name VARCHAR(100)
);
```

---

# 🔹 15. Data Integrity

Ensures accuracy and consistency.

## 📌 Types:
- Entity Integrity
```sql
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);
```

- Referential Integrity
```sql
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);
```

- Domain Integrity
```sql
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10,2) CHECK (salary > 0)
);
```

---

# 🔹 16. Locks & Concurrency Control

- Prevents data conflicts
- Types:
  - Shared Lock
```sql
SELECT *
FROM employees
WHERE employee_id = 1
LOCK IN SHARE MODE;
```

  - Exclusive Lock
```sql
SELECT *
FROM employees
WHERE employee_id = 1
FOR UPDATE;
```

---

# 🔹 17. Deadlock

- Situation where two transactions wait for each other

-Transaction-1
```sql
START TRANSACTION;

UPDATE accounts
SET balance = balance - 100
WHERE account_id = 1;

UPDATE accounts
SET balance = balance + 100
WHERE account_id = 2;

COMMIT;
```

-Transaction-2
```sql
START TRANSACTION;

UPDATE accounts
SET balance = balance - 50
WHERE account_id = 2;

UPDATE accounts
SET balance = balance + 50
WHERE account_id = 1;

COMMIT;
```

👉 Solution:
- Detection & rollback
```sql
SHOW ENGINE INNODB STATUS;
```


---

# 🔹 18. Backup & Recovery Basics

- Full Backup
```sql
mysqldump -u root -p company_db > company_db_backup.sql
```

- Incremental Backup
- Log-based recovery

---

# 🔹 19. Advantages of RDBMS

- Data consistency
- Structured format
- Easy querying (SQL)
- Security

---

# 🔹 20. Disadvantages of RDBMS

- Complex setup
- Scaling issues
- Performance overhead for large data

---

# 🎯 Final Summary

RDBMS is the backbone of structured data systems.

To master:
- Understand tables, keys, constraints
- Learn SQL deeply
- Practice normalization
- Understand transactions & indexing

👉 Focus = Concepts + Practice + Real Queries