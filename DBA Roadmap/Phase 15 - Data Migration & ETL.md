# 📘 Data Migration & ETL – Complete Notes for DBA

---

# 🔹 13. Data Migration & ETL

Data Migration and ETL are important DBA skills used to move, clean, transform, and load data between systems.

---

# 🔹 1. What is Data Migration?

Data Migration is the process of moving data from one system, database, server, or platform to another.

Examples:

- MySQL to PostgreSQL
- On-premise database to cloud database
- Old application database to new application database
- SQL Server to Azure SQL
- Oracle to PostgreSQL

---

# 🔹 2. Why Data Migration is Needed?

Data migration is required when:

- Company changes database technology
- Application is upgraded
- Server is changed
- Database is moved to cloud
- Legacy system is replaced
- Data needs to be consolidated

---

# 🔹 3. Types of Data Migration

## 📌 Database Migration

Moving data from one database to another.

Example:

```text
MySQL → PostgreSQL
```

---

## 📌 Cloud Migration

Moving database from local server to cloud.

Example:

```text
Local MySQL → AWS RDS
```

---

## 📌 Application Migration

Moving data while upgrading or changing application.

Example:

```text
Old CRM → New CRM
```

---

## 📌 Storage Migration

Moving database files from one storage system to another.

Example:

```text
HDD → SSD
```

---

# 🔹 4. What is ETL?

ETL stands for:

```text
Extract → Transform → Load
```

ETL is the process of collecting data from sources, cleaning or modifying it, and loading it into a target system.

---

# 🔹 5. ETL Process

## 📌 Extract

Extract means collecting data from different sources.

Sources can be:

- Databases
- CSV files
- Excel files
- APIs
- Logs
- Cloud storage

Example:

```sql
SELECT *
FROM customers;
```

---

## 📌 Transform

Transform means cleaning, formatting, validating, or changing data.

Examples:

- Remove duplicates
- Convert date format
- Standardize names
- Handle missing values
- Calculate totals
- Change column names

Example:

```sql
SELECT 
    customer_id,
    UPPER(customer_name) AS customer_name,
    COALESCE(email, 'not_available@example.com') AS email
FROM customers;
```

---

## 📌 Load

Load means inserting transformed data into the target database.

Example:

```sql
INSERT INTO cleaned_customers (customer_id, customer_name, email)
SELECT 
    customer_id,
    UPPER(customer_name),
    COALESCE(email, 'not_available@example.com')
FROM customers;
```

---

# 🔹 6. Data Migration Steps

## 📌 Step 1: Requirement Analysis

Understand:

- Source database
- Target database
- Data size
- Downtime allowed
- Migration deadline
- Data dependencies

---

## 📌 Step 2: Data Assessment

Check:

- Number of tables
- Table size
- Data types
- Constraints
- Indexes
- Stored procedures
- Triggers
- Views

---

## 📌 Step 3: Schema Mapping

Map source schema to target schema.

Example:

| Source Column | Target Column |
|---|---|
| cust_id | customer_id |
| cust_name | customer_name |
| phone_no | phone |

---

## 📌 Step 4: Data Type Mapping

Example:

| MySQL | PostgreSQL |
|---|---|
| INT | INTEGER |
| VARCHAR | VARCHAR |
| DATETIME | TIMESTAMP |
| AUTO_INCREMENT | SERIAL / IDENTITY |

---

## 📌 Step 5: Data Extraction

Export data from source.

MySQL:

```bash
mysqldump -u root -p source_db > source_db.sql
```

PostgreSQL:

```bash
pg_dump -U postgres source_db > source_db.sql
```

---

## 📌 Step 6: Data Transformation

Clean and convert data before loading.

Example:

```sql
UPDATE customers
SET email = 'not_available@example.com'
WHERE email IS NULL;
```

---

## 📌 Step 7: Data Loading

Load data into target system.

MySQL:

```bash
mysql -u root -p target_db < source_db.sql
```

PostgreSQL:

```bash
psql -U postgres target_db < source_db.sql
```

---

## 📌 Step 8: Validation

Validate:

- Row count
- Data accuracy
- Constraints
- Indexes
- Application functionality

Example:

```sql
SELECT COUNT(*)
FROM customers;
```

---

## 📌 Step 9: Testing

Test:

- Queries
- Reports
- Application screens
- User login
- Transactions

---

## 📌 Step 10: Cutover

Cutover means switching from old system to new system.

Types:

- Big Bang Cutover
- Phased Cutover

---

# 🔹 7. Big Bang vs Phased Migration

| Type | Meaning | Advantage | Disadvantage |
|---|---|---|---|
| Big Bang | Entire migration at once | Fast | High risk |
| Phased | Migration in parts | Low risk | Takes more time |

---

# 🔹 8. Common ETL Tools

## 📌 Apache Airflow

- Workflow orchestration tool
- Used to schedule and manage ETL pipelines
- Python-based

---

## 📌 Talend

- ETL and data integration tool
- Drag-and-drop interface
- Used in enterprise systems

---

## 📌 AWS Glue

- Serverless ETL service by AWS
- Used for cloud-based ETL

---

## 📌 Azure Data Factory

- Cloud ETL tool by Microsoft
- Used for Azure data pipelines

---

## 📌 SSIS

- SQL Server Integration Services
- Used with Microsoft SQL Server

---

# 🔹 9. Data Import and Export

## 📌 MySQL Export

```bash
mysqldump -u root -p company_db > company_db.sql
```

---

## 📌 MySQL Import

```bash
mysql -u root -p company_db < company_db.sql
```

---

## 📌 PostgreSQL Export

```bash
pg_dump -U postgres company_db > company_db.sql
```

---

## 📌 PostgreSQL Import

```bash
psql -U postgres company_db < company_db.sql
```

---

## 📌 Export Table to CSV

MySQL:

```sql
SELECT *
INTO OUTFILE '/tmp/customers.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
FROM customers;
```

PostgreSQL:

```sql
COPY customers TO '/tmp/customers.csv' DELIMITER ',' CSV HEADER;
```

---

## 📌 Import CSV

MySQL:

```sql
LOAD DATA INFILE '/tmp/customers.csv'
INTO TABLE customers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
```

PostgreSQL:

```sql
COPY customers FROM '/tmp/customers.csv' DELIMITER ',' CSV HEADER;
```

---

# 🔹 10. Data Validation Techniques

## 📌 Row Count Validation

```sql
SELECT COUNT(*)
FROM source_customers;

SELECT COUNT(*)
FROM target_customers;
```

---

## 📌 Sum Validation

```sql
SELECT SUM(amount)
FROM source_orders;

SELECT SUM(amount)
FROM target_orders;
```

---

## 📌 Duplicate Check

```sql
SELECT email, COUNT(*)
FROM customers
GROUP BY email
HAVING COUNT(*) > 1;
```

---

## 📌 Null Check

```sql
SELECT *
FROM customers
WHERE email IS NULL;
```

---

## 📌 Data Comparison

```sql
SELECT *
FROM source_customers
WHERE customer_id NOT IN (
    SELECT customer_id
    FROM target_customers
);
```

---

# 🔹 11. Data Cleaning

Data cleaning improves data quality before loading.

---

## 📌 Remove Duplicates

```sql
DELETE FROM customers
WHERE customer_id NOT IN (
    SELECT MIN(customer_id)
    FROM customers
    GROUP BY email
);
```

---

## 📌 Handle NULL Values

```sql
UPDATE customers
SET email = 'not_available@example.com'
WHERE email IS NULL;
```

---

## 📌 Standardize Text

```sql
UPDATE customers
SET customer_name = UPPER(customer_name);
```

---

## 📌 Trim Extra Spaces

```sql
UPDATE customers
SET customer_name = TRIM(customer_name);
```

---

# 🔹 12. Data Transformation Examples

## 📌 Convert Date Format

```sql
SELECT DATE_FORMAT(order_date, '%Y-%m-%d') AS formatted_date
FROM orders;
```

---

## 📌 Create Derived Column

```sql
SELECT 
    order_id,
    quantity,
    price,
    quantity * price AS total_amount
FROM order_items;
```

---

## 📌 Categorize Data

```sql
SELECT 
    customer_id,
    total_spent,
    CASE
        WHEN total_spent >= 100000 THEN 'Premium'
        WHEN total_spent >= 50000 THEN 'Gold'
        ELSE 'Regular'
    END AS customer_category
FROM customers;
```

---

# 🔹 13. Migration Challenges

Common challenges:

- Data type mismatch
- Character encoding issues
- Duplicate records
- Missing values
- Large data volume
- Downtime limitations
- Foreign key issues
- Index migration problems
- Stored procedure compatibility
- Application compatibility

---

# 🔹 14. Best Practices for Data Migration

- Take full backup before migration
- Perform migration in test environment first
- Validate row counts
- Validate business-critical data
- Keep rollback plan ready
- Document every step
- Minimize downtime
- Disable constraints temporarily only when required
- Rebuild indexes after migration if needed
- Monitor performance after migration

---

# 🔹 15. Rollback Plan

Rollback plan is used when migration fails.

Rollback may include:

- Restore old database backup
- Switch application back to old database
- Fix failed scripts
- Re-run migration after correction

---

# 🔹 16. ETL Pipeline Example

```text
Source DB / CSV / API
        ↓
Extract Data
        ↓
Clean and Transform Data
        ↓
Validate Data
        ↓
Load into Data Warehouse
        ↓
Generate Reports
```

---

# 🔹 17. Simple ETL SQL Example

```sql
INSERT INTO sales_summary (customer_id, total_sales)
SELECT 
    customer_id,
    SUM(amount) AS total_sales
FROM orders
GROUP BY customer_id;
```

---

# 🔹 18. Python ETL Example

```python
import mysql.connector
import csv

conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="password",
    database="company_db"
)

cursor = conn.cursor()

cursor.execute("SELECT customer_id, customer_name, email FROM customers")

with open("customers.csv", "w", newline="") as file:
    writer = csv.writer(file)
    writer.writerow(["customer_id", "customer_name", "email"])

    for row in cursor.fetchall():
        writer.writerow(row)

cursor.close()
conn.close()
```

---

# 🔹 19. Interview Questions (Very Important 🔥)

## Q1. What is Data Migration?

Data Migration is the process of moving data from one system or database to another.

---

## Q2. What is ETL?

ETL means Extract, Transform, Load.

---

## Q3. Difference between ETL and ELT?

| ETL | ELT |
|---|---|
| Transform before loading | Transform after loading |
| Used in traditional warehouses | Used in modern cloud warehouses |
| More controlled | More scalable |

---

## Q4. What is data validation?

Checking whether migrated data is accurate, complete, and consistent.

---

## Q5. What is schema mapping?

Mapping source database tables/columns with target database tables/columns.

---

## Q6. What is rollback plan?

A recovery plan used when migration fails.

---

## Q7. What are common migration challenges?

- Data type mismatch
- Missing values
- Duplicates
- Downtime
- Compatibility issues

---

# 🔹 20. Real-World Scenario

## 📌 Problem:

Company wants to migrate from local MySQL database to AWS RDS.

## 📌 Solution:

- Take full backup
- Create AWS RDS instance
- Export local MySQL database
- Import data into AWS RDS
- Validate row counts
- Test application connection
- Switch application to RDS endpoint
- Monitor performance

---

# 🎯 Final Summary

To master Data Migration & ETL:

- Understand migration types
- Learn ETL process
- Practice import/export
- Validate data after migration
- Handle data cleaning
- Prepare rollback plan
- Learn ETL tools like Airflow, Talend, SSIS, AWS Glue
- Document every migration step

---

👉 **Core Focus:**

```text
Data Migration = Move Data Safely
ETL = Extract + Transform + Load
```