# 📘 Database Design & Architecture – Complete Notes

---

# 🔹 1. ER Diagrams (Entity Relationship Modeling)

ER Diagram is used to visually represent the structure of a database.

It shows:
- Entities (tables)
- Attributes (columns)
- Relationships between entities

---

## 📌 Components of ER Diagram

### 🔹 Entity
- Real-world object (e.g., Student, Employee)
- Represented as a rectangle

### 🔹 Attribute
- Property of an entity (e.g., name, age)
- Represented as an oval

### 🔹 Relationship
- Association between entities
- Represented as a diamond

---

## 📌 Types of Relationships

- One-to-One (1:1)
- One-to-Many (1:N)
- Many-to-Many (M:N)

---

## 📌 Example

Student → Enrolls → Course

---

## 📌 SQL Mapping Example

```sql
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100)
);

CREATE TABLE enrollments (
    student_id INT,
    course_id INT,
    PRIMARY KEY (student_id, course_id)
);
```

# 🔹 2. Schema Design (OLTP vs OLAP)

Schema design defines how data is structured in a database.

## 📌 OLTP (Online Transaction Processing)

Used for:

- Daily operations
- Real-time systems

Features:
- Highly normalized
- Fast INSERT, UPDATE, DELETE
- Small transactions
- Used in banking, e-commerce

Example:
- Order processing system

## 📌 OLAP (Online Analytical Processing)

Used for:

- Data analysis
- Reporting

Features:
- Denormalized
- Large queries
- Historical data
- Used in data warehouses

Example:
- Business analytics dashboard

## 📌 Difference Table

| Feature   | OLTP            | OLAP            |
| --------- | --------------- | --------------- |
| Purpose   | Transactions    | Analysis        |
| Data Type | Current         | Historical      |
| Structure | Normalized      | Denormalized    |
| Speed     | Fast operations | Complex queries |
| Example   | Banking system  | BI reports      |


# 🔹 3. Data Modeling

Data modeling defines how data is stored and related.

## 📌 Star Schema

Structure:

- One central fact table
- Multiple dimension tables

Features:
- Simple design
- Faster queries
- Used in OLAP systems

## 📌 Example
```sql
CREATE TABLE sales_fact (
    sale_id INT,
    product_id INT,
    customer_id INT,
    amount DECIMAL(10,2)
);

CREATE TABLE product_dim (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100)
);

CREATE TABLE customer_dim (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100)
);
```

## 📌 Snowflake Schema

Structure:

- Normalized version of star schema
- Dimension tables split into sub-tables

Features:
- Less redundancy
- More complex joins

## 📌 Example
```sql
CREATE TABLE product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category_id INT
);

CREATE TABLE category (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100)
);
```

## 📌 Star vs Snowflake
| Feature       | Star Schema | Snowflake Schema |
| ------------- | ----------- | ---------------- |
| Complexity    | Simple      | Complex          |
| Redundancy    | High        | Low              |
| Performance   | Faster      | Slightly slower  |
| Normalization | Low         | High             |


# 🔹 4. Partitioning & Sharding

## 📌 Partitioning

Partitioning splits a table into smaller parts inside the same database.

Types:
- Range Partitioning
- List Partitioning
- Hash Partitioning

## 📌 Example (Range Partitioning)
```sql
CREATE TABLE sales (
    sale_id INT,
    sale_date DATE,
    amount DECIMAL(10,2)
)
PARTITION BY RANGE (YEAR(sale_date)) (
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025)
);
```

## 📌 Benefits:
- Faster queries
- Better performance
- Easier maintenance

## 📌 Sharding

Sharding splits data across multiple databases/servers.

Example:
- Users A–M → Server 1
- Users N–Z → Server 2

## 📌 Benefits:
- Horizontal scaling
- Handles large data
- Improves performance

## 📌 Partitioning vs Sharding
| Feature    | Partitioning    | Sharding           |
| ---------- | --------------- | ------------------ |
| Scope      | Single database | Multiple databases |
| Scaling    | Limited         | High               |
| Complexity | Easy            | Complex            |


# 🔹 5. Data Warehousing Basics

A Data Warehouse is a system used for reporting and analysis.

📌 Features
- Stores historical data
- Optimized for read queries
- Used for business intelligence

📌 ETL Process

ETL = Extract, Transform, Load

Steps:
- Extract → Collect data from sources
- Transform → Clean and process data
- Load → Store into warehouse

## 📌 Example
```sql
-- Extract
SELECT * FROM orders;

-- Transform
SELECT customer_id, SUM(amount) AS total_sales
FROM orders
GROUP BY customer_id;

-- Load
INSERT INTO sales_summary
SELECT customer_id, SUM(amount)
FROM orders
GROUP BY customer_id;
```

## 📌 Fact vs Dimension Tables
| Type      | Description                                   |
| --------- | --------------------------------------------- |
| Fact      | Contains measurable data (sales, revenue)     |
| Dimension | Contains descriptive data (customer, product) |


## 📌 Example

Fact Table:
- sales_fact

Dimension Tables:
- customer_dim
- product_dim

# 🎯 Final Summary
To master Database Design & Architecture:

- Understand ER diagrams and relationships
- Know difference between OLTP and OLAP
- Learn Star and Snowflake schema
- Understand partitioning and sharding
- Learn data warehouse basics and ETL process

👉 Focus on:

- Design clarity
- Performance optimization
- Scalability
- Real-world data modeling