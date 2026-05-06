# 📘 NoSQL Databases – Complete Notes (Modern DBA Skill 🚀)

---

# 🔹 1. What is NoSQL?

NoSQL stands for **"Not Only SQL"**.

It is a type of database designed for:
- High scalability
- Flexible schema
- Large-scale data
- Fast performance

---

# 🔹 2. Why NoSQL?

Traditional RDBMS struggles with:
- Massive data (Big Data)
- High traffic systems
- Unstructured data

👉 NoSQL solves:
- Scalability issues
- Schema rigidity
- Performance bottlenecks

---

# 🔹 3. Types of NoSQL Databases

---

## 🔹 1. Document DB → MongoDB

Stores data in **JSON-like format (BSON)**.

---

### 📌 Features

- Schema-less (flexible structure)
- Nested data support
- Easy to scale
- Good for APIs and web apps

---

### 📌 Example Document

```json
{
  "user_id": 1,
  "name": "Rahul",
  "email": "rahul@example.com",
  "skills": ["Python", "SQL"],
  "address": {
    "city": "Delhi",
    "country": "India"
  }
}
```

## 📌 Basic Commands
```bash
db.users.insertOne({
  name: "Rahul",
  age: 25
});

db.users.find();

db.users.find({ age: 25 });
```
## 📌 Use Cases
- Web applications
- REST APIs
- Real-time apps
- Content management systems


# 🔹 2. Key-Value DB → Redis
Stores data as key-value pairs.

## 📌 Features
Extremely fast (in-memory)
Simple structure
Supports caching
Supports TTL (expiry)

## 📌 Example
```text
SET user:1 "Rahul"
GET user:1
```
## 📌 Advanced Example
```text
SET session:123 "active" EX 60
```
## 📌 Use Cases
- Caching
- Session management
- Real-time analytics
- Leaderboards

# 🔹 3. Column-based DB → Apache Cassandra
Stores data in column families.

## 📌 Features
- Highly scalable
- Distributed system
- Fault-tolerant
- No single point of failure

## 📌 Example
```sql
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    name TEXT,
    email TEXT
);
```

## 📌 Use Cases
- Big data applications
- IoT systems
- High-availability systems
- Write-heavy workloads

# 🔹 4. NoSQL vs RDBMS
| Feature      | NoSQL             | RDBMS         |
| ------------ | ----------------- | ------------- |
| Schema       | Flexible          | Fixed         |
| Scalability  | Horizontal        | Vertical      |
| Data Type    | Unstructured      | Structured    |
| Performance  | High (large data) | Moderate      |
| Transactions | Limited           | Strong (ACID) |

# 🔹 5. CAP Theorem (Important 🔥)

NoSQL systems follow CAP theorem:

- Consistency  
- Availability  
- Partition Tolerance  

👉 Only **2 out of 3** can be guaranteed.

---

# 🔹 6. When to Use NoSQL?

Use NoSQL when:

- Data is unstructured or semi-structured  
- Need high scalability  
- High traffic systems  
- Real-time applications  
- Big data processing  

---

# 🔹 7. When NOT to Use NoSQL?

Avoid NoSQL when:

- Strong ACID transactions required  
- Complex joins needed  
- Strict schema required  
- Financial systems (banking)  

---

# 🔹 8. Advantages of NoSQL

- High scalability  
- Flexible schema  
- Faster performance  
- Easy to handle big data  

---

# 🔹 9. Disadvantages of NoSQL

- Limited joins  
- Weak consistency (in some systems)  
- Complex queries  
- Learning curve  

---

# 🔹 10. Interview Questions (Very Important 🔥)

## Q1. What is NoSQL?
NoSQL is a non-relational database used for scalable and flexible data storage.

---

## Q2. Types of NoSQL?
- Document DB  
- Key-Value DB  
- Column-based DB  

---

## Q3. Difference between SQL and NoSQL?
- SQL → Structured, relational  
- NoSQL → Flexible, non-relational  

---

## Q4. What is MongoDB?
A document-based NoSQL database.

---

## Q5. What is Redis?
A key-value in-memory database used for caching.

---

## Q6. What is Cassandra?
A distributed column-based database.

---

## Q7. When to use NoSQL?
When scalability and performance are required.

---

# 🔹 11. Real-World Scenario

## 📌 Problem:
Website becomes slow with millions of users.

## 📌 Solution:
- Use Redis for caching  
- Use MongoDB for flexible data  
- Use Cassandra for distributed storage  
- Scale horizontally  

---

# 🎯 Final Summary

To master NoSQL:

- Understand different types  
- Learn MongoDB, Redis, Cassandra basics  
- Know when to use NoSQL vs SQL  
- Understand CAP theorem  
- Practice real-world use cases  