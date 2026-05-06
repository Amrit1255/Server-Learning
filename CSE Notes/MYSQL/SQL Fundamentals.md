# 🏗️ Module 3 — SQL Fundamentals

> ## 🚀 Learn the Core Language of Databases
> ### SQL is the language that powers modern applications, analytics, banking systems, and enterprise software.

---

# 🌟 What You Will Learn

✅ What is SQL?  
✅ SQL Syntax Rules  
✅ SQL Statement Types  
✅ DDL Commands  
✅ DML Commands  
✅ DCL Commands  
✅ TCL Commands  
✅ Creating Databases  
✅ Creating Tables  
✅ Data Types  
✅ Constraints  
✅ SQL Naming Conventions  
✅ Real-World SQL Practices  

---

# 🧠 What is SQL?

## 📘 SQL = Structured Query Language

SQL is used to:

- Store data 💾
- Retrieve data 🔍
- Update data ✏️
- Delete data ❌
- Manage databases ⚙️

---

# 🌍 Real-World Usage of SQL

| Industry | Usage |
|---|---|
| 🏦 Banking | Transactions |
| 🛒 E-Commerce | Orders & Products |
| 🎓 Education | Student Records |
| 🏥 Healthcare | Patient Management |
| 📱 Social Media | User Data |

---

# 📌 Why SQL is Important?

✅ Industry Standard  
✅ Easy to Learn  
✅ Powerful Query Language  
✅ Used in Almost Every Company  
✅ Essential for Backend & DBA Roles  

---

# 🏛️ Types of SQL Commands

| Type | Purpose |
|---|---|
| DDL | Database Structure |
| DML | Data Manipulation |
| DQL | Data Query |
| DCL | Access Control |
| TCL | Transaction Management |

---

# 📖 1. DDL — Data Definition Language

Used to define database structures.

---

# 📌 DDL Commands

| Command | Purpose |
|---|---|
| CREATE | Create objects |
| ALTER | Modify objects |
| DROP | Delete objects |
| TRUNCATE | Remove all records |
| RENAME | Rename object |

---

# 🏗️ CREATE DATABASE

## 📌 Syntax

```sql
CREATE DATABASE company_db;
```

---

# 🧠 Example

```sql
CREATE DATABASE school_db;
```

---

# 📌 View Databases

```sql
SHOW DATABASES;
```

---

# 📌 Select Database

```sql
USE school_db;
```

---

# 🏗️ CREATE TABLE

---

# 📌 Syntax

```sql
CREATE TABLE table_name (
    column_name datatype constraints
);
```

---

# 🧠 Example

```sql
CREATE TABLE students (
    student_id INT,
    name VARCHAR(100),
    age INT
);
```

---

# 📊 Table Structure

| Column | Data Type |
|---|---|
| student_id | INT |
| name | VARCHAR |
| age | INT |

---

# 🛠️ ALTER TABLE

Used to modify existing tables.

---

# 📌 Add Column

```sql
ALTER TABLE students
ADD email VARCHAR(100);
```

---

# 📌 Modify Column

```sql
ALTER TABLE students
MODIFY name VARCHAR(200);
```

---

# 📌 Drop Column

```sql
ALTER TABLE students
DROP COLUMN email;
```

---

# ❌ DROP TABLE

Deletes table permanently.

---

# 📌 Syntax

```sql
DROP TABLE students;
```

⚠️ Data will be lost permanently.

---

# ⚡ TRUNCATE TABLE

Deletes all records quickly.

---

# 📌 Syntax

```sql
TRUNCATE TABLE students;
```

---

# 🧠 Difference Between DELETE & TRUNCATE

| Feature | DELETE | TRUNCATE |
|---|---|---|
| Removes Rows | Yes | Yes |
| WHERE Clause | Yes | No |
| Faster | No | Yes |
| Rollback Possible | Yes | Limited |

---

# ✏️ DML — Data Manipulation Language

Used to manipulate data.

---

# 📌 DML Commands

| Command | Purpose |
|---|---|
| INSERT | Add data |
| UPDATE | Modify data |
| DELETE | Remove data |

---

# ➕ INSERT INTO

---

# 📌 Syntax

```sql
INSERT INTO table_name
VALUES (...);
```

---

# 🧠 Example

```sql
INSERT INTO students
VALUES (1, 'Amrit', 22);
```

---

# 📌 Insert Specific Columns

```sql
INSERT INTO students (student_id, name)
VALUES (2, 'Rahul');
```

---

# 📦 Multiple Inserts

```sql
INSERT INTO students
VALUES
(3, 'Priya', 21),
(4, 'Rohit', 23);
```

---

# 🔍 DQL — Data Query Language

Used to retrieve data.

---

# 📌 SELECT Statement

---

# 📌 Syntax

```sql
SELECT column_name
FROM table_name;
```

---

# 🧠 Example

```sql
SELECT * FROM students;
```

---

# 📊 Output

| student_id | name | age |
|---|---|---|
| 1 | Amrit | 22 |
| 2 | Rahul | 20 |

---

# 📌 Select Specific Columns

```sql
SELECT name, age
FROM students;
```

---

# 🔎 WHERE Clause

Filters records.

---

# 📌 Syntax

```sql
SELECT *
FROM students
WHERE age > 21;
```

---

# ⚖️ Comparison Operators

| Operator | Meaning |
|---|---|
| = | Equal |
| != | Not Equal |
| > | Greater Than |
| < | Less Than |
| >= | Greater Equal |
| <= | Less Equal |

---

# 📌 DISTINCT Keyword

Removes duplicate values.

---

# 🧠 Example

```sql
SELECT DISTINCT age
FROM students;
```

---

# 📌 ORDER BY

Sorts data.

---

# 🧠 Ascending Order

```sql
SELECT *
FROM students
ORDER BY age ASC;
```

---

# 🧠 Descending Order

```sql
SELECT *
FROM students
ORDER BY age DESC;
```

---

# 📌 LIMIT Clause

Limits number of rows.

---

# 🧠 Example

```sql
SELECT *
FROM students
LIMIT 5;
```

---

# 📌 GROUP BY

Groups similar records.

---

# 🧠 Example

```sql
SELECT age, COUNT(*)
FROM students
GROUP BY age;
```

---

# 📌 HAVING Clause

Filters grouped data.

---

# 🧠 Example

```sql
SELECT age, COUNT(*)
FROM students
GROUP BY age
HAVING COUNT(*) > 1;
```

---

# ✏️ UPDATE Statement

Used to modify existing data.

---

# 📌 Syntax

```sql
UPDATE table_name
SET column = value
WHERE condition;
```

---

# 🧠 Example

```sql
UPDATE students
SET age = 25
WHERE student_id = 1;
```

---

# ⚠️ Important Warning

Without WHERE:

```sql
UPDATE students
SET age = 25;
```

❌ ALL rows will update.

---

# ❌ DELETE Statement

Removes records.

---

# 📌 Syntax

```sql
DELETE FROM table_name
WHERE condition;
```

---

# 🧠 Example

```sql
DELETE FROM students
WHERE student_id = 1;
```

---

# ⚠️ Dangerous Query

```sql
DELETE FROM students;
```

❌ Deletes ALL records.

---

# 🔐 DCL — Data Control Language

Used for permissions & security.

---

# 📌 DCL Commands

| Command | Purpose |
|---|---|
| GRANT | Give permissions |
| REVOKE | Remove permissions |

---

# 🧠 GRANT Example

```sql
GRANT SELECT
ON school_db.*
TO 'amrit'@'localhost';
```

---

# 🧠 REVOKE Example

```sql
REVOKE SELECT
ON school_db.*
FROM 'amrit'@'localhost';
```

---

# 🔄 TCL — Transaction Control Language

Controls transactions.

---

# 📌 TCL Commands

| Command | Purpose |
|---|---|
| COMMIT | Save transaction |
| ROLLBACK | Undo transaction |
| SAVEPOINT | Partial rollback |

---

# 🧠 COMMIT Example

```sql
COMMIT;
```

---

# 🧠 ROLLBACK Example

```sql
ROLLBACK;
```

---

# 🧠 SAVEPOINT Example

```sql
SAVEPOINT sp1;
```

---

# 📌 SQL Data Types

---

# 🔢 Numeric Types

| Type | Usage |
|---|---|
| INT | Integer |
| BIGINT | Large Integer |
| DECIMAL | Accurate decimals |
| FLOAT | Approximate decimals |

---

# 🔤 String Types

| Type | Usage |
|---|---|
| CHAR | Fixed length |
| VARCHAR | Variable length |
| TEXT | Large text |

---

# 📅 Date & Time Types

| Type | Usage |
|---|---|
| DATE | Date |
| TIME | Time |
| DATETIME | Date & Time |
| TIMESTAMP | Automatic timestamp |

---

# 📌 Constraints in SQL

Used to enforce rules.

---

# 🔐 Types of Constraints

| Constraint | Purpose |
|---|---|
| PRIMARY KEY | Unique identifier |
| NOT NULL | Cannot be empty |
| UNIQUE | Unique values |
| DEFAULT | Default value |
| CHECK | Validate data |
| FOREIGN KEY | Relationship |

---

# 🧠 PRIMARY KEY Example

```sql
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100)
);
```

---

# 🧠 NOT NULL Example

```sql
name VARCHAR(100) NOT NULL
```

---

# 🧠 DEFAULT Example

```sql
status VARCHAR(20) DEFAULT 'active'
```

---

# 📌 SQL Naming Conventions

---

# ✅ Best Practices

| Object | Convention |
|---|---|
| Database | lowercase |
| Table | plural nouns |
| Column | snake_case |

---

# 🧠 Example

```text
students
employee_salary
order_items
```

---

# ❌ Avoid

```text
StudentTable123
MyData
test_table_final_final
```

---

# 🌍 Real-World SQL Workflow

```text
Application
    |
    v
Backend API
    |
    v
SQL Query
    |
    v
MySQL Database
```

---

# 🔥 Real-World Example

## 🛒 E-Commerce System

### Tables:
- users
- products
- orders
- payments

---

# 🧠 Example Query

```sql
SELECT *
FROM products
WHERE price > 1000
ORDER BY price DESC;
```

---

# 🚀 SQL Query Execution Flow

```text
1. Query Written
2. Parser Checks Syntax
3. Optimizer Creates Plan
4. Storage Engine Fetches Data
5. Result Returned
```

---

# 📌 Interview Questions

---

# ❓ Q1. What is SQL?

Language used to manage relational databases.

---

# ❓ Q2. Difference Between DELETE & TRUNCATE?

DELETE removes selectively; TRUNCATE removes all quickly.

---

# ❓ Q3. What is PRIMARY KEY?

Unique identifier for rows.

---

# ❓ Q4. What is WHERE Clause?

Filters rows based on conditions.

---

# ❓ Q5. Difference Between CHAR & VARCHAR?

| CHAR | VARCHAR |
|---|---|
| Fixed Length | Variable Length |

---

# ❓ Q6. What is GROUP BY?

Groups rows with similar values.

---

# ❓ Q7. Difference Between DDL & DML?

| DDL | DML |
|---|---|
| Structure | Data |

---

# 🚀 Best Practices

✅ Always use WHERE in UPDATE/DELETE  
✅ Use meaningful table names  
✅ Use constraints properly  
✅ Normalize data  
✅ Avoid duplicate data  

---

# ❌ Common Mistakes

❌ Missing WHERE clause  
❌ Using SELECT * unnecessarily  
❌ Poor naming conventions  
❌ No constraints  
❌ Storing inconsistent data  

---

# 📝 Quick Revision Summary

| Concept | Key Point |
|---|---|
| CREATE | Create objects |
| INSERT | Add data |
| SELECT | Retrieve data |
| UPDATE | Modify data |
| DELETE | Remove data |
| WHERE | Filter rows |
| GROUP BY | Group data |
| ORDER BY | Sort data |

---

# 🎯 Module Completion Checklist

✅ Learned SQL Basics  
✅ Understood DDL Commands  
✅ Understood DML Commands  
✅ Learned SELECT Queries  
✅ Learned Filtering & Sorting  
✅ Learned Constraints  
✅ Learned Transactions Basics  

---

# ❤️ End of Module 3

> ## “SQL is not just a language — it is the backbone of modern software systems.”

🚀 Next Module:
# 📦 MySQL Data Types