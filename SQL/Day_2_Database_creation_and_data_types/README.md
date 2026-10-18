# SQL Learning — Day 2

This repository contains my **Day 2 SQL practice using MySQL Command Line Client**.

In this session, I went beyond basic database and table operations and learned about **SQL command categories, ACID properties, comments, and different SQL data types**. I also practiced these concepts by creating tables, inserting data, and updating records.

---

## 📚 Topics Covered

### 1. ACID Properties

Learned about the **ACID properties** of database transactions:

* **Atomicity** — A transaction is treated as a single unit; it either completes fully or does not happen.
* **Consistency** — Data remains valid and follows the defined rules before and after a transaction.
* **Isolation** — Transactions operate independently without interfering with each other.
* **Durability** — Once a transaction is committed, the changes are permanently saved.

---

## 2. Types of SQL Commands

Learned the major categories of SQL commands:

### DDL — Data Definition Language

Used for defining and modifying the structure of database objects.

Commands covered:

```text
CREATE
ALTER
DROP
TRUNCATE
```

### DML — Data Manipulation Language

Used for manipulating data inside tables.

Commands covered:

```text
INSERT
UPDATE
DELETE
```

### DQL — Data Query Language

Used for retrieving data.

```sql
SELECT
```

### TCL — Transaction Control Language

Used for controlling database transactions.

```text
COMMIT
ROLLBACK
SAVEPOINT
```

### DCL — Data Control Language

Used for controlling database permissions.

```text
GRANT
REVOKE
```

These command categories were covered as part of the Day 2 theory.

---

## 3. SQL Comments

Learned how to write comments in SQL.

### Single-line comment using `--`

```sql
-- This is a single-line comment
```

### Single-line comment using `#`

```sql
# This is also a single-line comment
```

### Multi-line comment

```sql
/*
This is a
multi-line comment
*/
```

Comments are useful for documenting SQL scripts and explaining what different queries do.

---

# 🧮 4. SQL Data Types

One of the main topics practiced during Day 2 was **SQL data types**.

The data types covered were broadly divided into:

```text
Numeric
Character / String
Date & Time
Binary
ENUM
```

The session specifically included practice with numeric, character/string, binary, and ENUM types.

---

## 5. Numeric Data Types

### Integer Data Types

Learned about integer data types such as:

```text
SMALLINT
MEDIUMINT
INT
BIGINT
```

These are used to store whole numbers.

### Fixed-Point Data Type

Practiced the concept of `DECIMAL`:

```sql
DECIMAL(7,2)
```

The first number represents the total number of digits, while the second represents the number of digits after the decimal point.

---

## 6. Creating a Table Using Different Data Types

Created an `Indian_Data` table to practice different numeric and other data types:

```sql
CREATE TABLE Indian_Data(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    state_code TINYINT UNSIGNED,
    population BIGINT UNSIGNED,
    literacy_rate FLOAT(5,2),
    area_in_km DOUBLE(10,2),
    is_union_teritory BOOL
);
```

This table provided practical experience with:

* `INT`
* `TINYINT`
* `BIGINT`
* `FLOAT`
* `DOUBLE`
* `BOOL`
* `UNSIGNED`
* `AUTO_INCREMENT`
* `PRIMARY KEY`

---

## 7. UNSIGNED

Practiced the `UNSIGNED` attribute with numeric columns:

```sql
id INT UNSIGNED
```

```sql
population BIGINT UNSIGNED
```

```sql
state_code TINYINT UNSIGNED
```

`UNSIGNED` is useful when a numeric column should not contain negative values.

---

## 8. AUTO_INCREMENT

Used:

```sql
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY
```

`AUTO_INCREMENT` automatically generates a new number for the `id` whenever a new record is inserted.

For example:

```text
id
1
2
3
4
```

The `id` values did not need to be manually provided while inserting the Indian data.

---

## 9. PRIMARY KEY

The `id` column was also defined as:

```sql
PRIMARY KEY
```

A primary key is used to uniquely identify each record in a table.

The combination:

```sql
INT UNSIGNED AUTO_INCREMENT PRIMARY KEY
```

was practiced as a common way to create a unique automatically generated ID.

---

## 10. FLOAT, DOUBLE and BOOL

The `Indian_Data` table used:

```sql
literacy_rate FLOAT(5,2)
```

to store decimal values such as:

```text
72.36
86.54
90.01
```

It also used:

```sql
area_in_km DOUBLE(10,2)
```

for area values with decimal precision.

For the Union Territory column:

```sql
is_union_teritory BOOL
```

Boolean values were inserted using:

```sql
FALSE
```

and later changed to:

```sql
TRUE
```

---

## 11. Inserting Data

Inserted multiple Indian data records in a single query:

```sql
INSERT INTO Indian_Data
(state_code, population, literacy_rate, area_in_km, is_union_teritory)
VALUES
(1,23124356,72.36,342239.45,FALSE),
(2,12345678,86.54,564387.40,FALSE),
(3,7895356,90.01,409867.56,FALSE),
(4,7890123,67.89,786959.34,FALSE);
```

---

## 12. UPDATE Statement

Practiced modifying existing records using `UPDATE`.

For example, changed the `is_union_teritory` value for IDs 2 and 4:

```sql
UPDATE Indian_Data
SET is_union_teritory = TRUE
WHERE id IN (2,4);
```

This demonstrated the use of:

```text
UPDATE
SET
WHERE
IN
```

to modify specific records.

---

# 🔤 13. String Data Types

Learned about different string/character data types.

### CHAR

```text
CHAR
```

* Fixed-length character data
* Maximum length covered: 255 characters
* May use blank spaces for unused length
* Data can be clipped if it exceeds the defined size

### VARCHAR

```text
VARCHAR
```

* Variable-length character data
* Stores only the required amount of space
* More efficient for values whose lengths vary

### TEXT

```text
TEXT
```

* Used for storing larger strings or paragraphs
* Maximum length covered: 65,535 characters

These three string data types were specifically covered in the Day 2 practice.

---

# 🗃️ 14. BLOB

Learned about the binary data type:

```text
BLOB
```

BLOB stands for **Binary Large Object** and is used for storing binary data.

This was covered as part of the Day 2 data type theory.

---

# 📋 15. ENUM

Learned about the `ENUM` data type.

`ENUM` allows a column to store **one value from a predefined list**.

Example:

```sql
color ENUM('red','blue','white')
```

This means the `color` column is restricted to the values:

```text
red
blue
white
```

---

## 16. Practical ENUM Example

Created a `products` table:

```sql
CREATE TABLE products(
    productcode CHAR(50),
    productname VARCHAR(100),
    description VARCHAR(255),
    color ENUM('red','blue','white')
);
```

Inserted valid ENUM values:

```sql
INSERT INTO products VALUES
('P01','apple','fresh and juicy','red'),
('p02','banana','sweet and delicious','blue'),
('p03','carrot','crunchy and healthy','white');
```

Then intentionally attempted to insert an invalid value:

```sql
INSERT INTO products
VALUE('p04','carrot','crunchy and healthy','pink');
```

Since `pink` was not included in the predefined ENUM list, this was expected to return an error.

---

# 🏗️ Database & Table Practice

Along with the theory, I practiced creating and working with databases and tables.

### Database

```sql
CREATE DATABASE d2b24;
```

### Select Database

```sql
USE d2b24;
```

### Employee Table

```sql
CREATE TABLE emp(
    eid INT,
    ename VARCHAR(50),
    esal INT
);
```

### Insert Employee Data

```sql
INSERT INTO emp
VALUES
(1,'amit',25000),
(2,'suraj',29000),
(3,'ajit',28000);
```

### Student Table

```sql
CREATE TABLE student(
    sid INT,
    sname VARCHAR(50),
    smarks INT
);
```

### Insert Student Data

```sql
INSERT INTO student
VALUES
(101,'Karan',99),
(102,'Niraj',85),
(103,'Manish',60);
```

These exercises helped reinforce the basic workflow of creating tables, inserting data, and retrieving records.

---

# ⚠️ Error & Learning

During the practice, I also encountered SQL syntax errors while experimenting with commands.

This helped reinforce an important point:

> SQL commands must follow the correct syntax and structure expected by MySQL.

Making mistakes and correcting them is part of the practical learning process.

---

# 🧠 Key Learnings

By the end of Day 2, I learned:

* ACID properties of databases
* Different categories of SQL commands
* DDL, DML, DQL, TCL and DCL
* SQL comments
* Numeric data types
* Integer data types
* `DECIMAL`
* `FLOAT`
* `DOUBLE`
* `UNSIGNED`
* `AUTO_INCREMENT`
* `PRIMARY KEY`
* Boolean/`BOOL`
* Character data types
* `CHAR`
* `VARCHAR`
* `TEXT`
* Binary data type `BLOB`
* `ENUM`
* Creating databases
* Creating tables
* Inserting multiple records
* Retrieving records using `SELECT`
* Updating records using `UPDATE`
* Using `WHERE`
* Using `IN`
* Understanding restrictions imposed by `ENUM`

---

# 🎯 Day 2 Learning Workflow

```text
SQL Theory
    ↓
ACID Properties
    ↓
SQL Command Categories
    ↓
SQL Comments
    ↓
Data Types
    ↓
Numeric Data Types
    ↓
String Data Types
    ↓
Binary & ENUM
    ↓
Create Database
    ↓
Create Tables
    ↓
Insert Data
    ↓
Select Data
    ↓
Update Data
```

---

# 📁 Practice File

The SQL commands and practice performed during this session are available in:

```text
day02.sql
```

---

# 🚀 Progress

**Day 1 — SQL Basics ✅**

* Database creation
* Database selection
* Table creation
* Data insertion
* Data retrieval

**Day 2 — SQL Concepts & Data Types ✅**

* ACID properties
* SQL command categories
* Comments
* Numeric data types
* String data types
* BLOB
* ENUM
* UNSIGNED
* AUTO_INCREMENT
* PRIMARY KEY
* INSERT
* SELECT
* UPDATE

More SQL concepts and hands-on practice will be added as I continue learning.
