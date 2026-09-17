# 📚 SQL Learning – Day 3

## 📅 Day 3: Data Types, Constraints & SELECT Statement

Today I continued my SQL learning using **MySQL** and focused on understanding different **data types, constraints, and the SELECT statement**. I also practiced these concepts by creating tables, inserting records, modifying table definitions, and retrieving data.

---

## 🎯 Topics Covered

* Date and Time Data Types
* `DATETIME`
* `YEAR`
* `TIMESTAMP`
* `CURRENT_TIMESTAMP`
* `AUTO_INCREMENT`
* Custom `AUTO_INCREMENT` starting value
* `DEFAULT` constraint
* `NULL` and `NOT NULL`
* `SELECT` statement
* Selecting all columns
* Selecting specific columns
* Selecting multiple columns
* `DESC` / `DESCRIBE`

---

# 1️⃣ Date & Time Data Types

Created a `movies` table to understand different date and time related data types.

```sql
CREATE TABLE movies(
    movieid INT AUTO_INCREMENT PRIMARY KEY,
    moviename VARCHAR(100),
    showdatetime DATETIME,
    releaseyear YEAR(4),
    lastupdated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

### Data Types Practiced

| Data Type           | Purpose                                     |
| ------------------- | ------------------------------------------- |
| `DATETIME`          | Stores both date and time                   |
| `YEAR`              | Stores a year value                         |
| `TIMESTAMP`         | Stores date and time information            |
| `CURRENT_TIMESTAMP` | Automatically records the current timestamp |

### Example

```sql
INSERT INTO movies(moviename, showdatetime, releaseyear)
VALUES
('The Great Movie', '2023-08-10 20:00:00', 2023),
('Another Great Movie', '2023-08-11 18:00:00', 2023),
('Old Classic', '2023-08-11 16:00:00', 1990),
('Interesting Documentary', '2023-08-12 15:00:00', 2022),
('Kids Movie', '2023-08-12 14:00:00', 2023);
```

Also practiced:

```sql
SELECT * FROM movies;
DESC movies;
```

---

# 2️⃣ AUTO_INCREMENT

Learned that `AUTO_INCREMENT` allows MySQL to automatically generate a unique numeric value whenever a new record is inserted.

### Basic Example

```sql
CREATE TABLE persons(
    p_id INT AUTO_INCREMENT PRIMARY KEY,
    surname VARCHAR(25),
    firstname VARCHAR(25),
    city VARCHAR(25)
);
```

Records can be inserted without specifying `p_id`:

```sql
INSERT INTO persons (surname, firstname, city)
VALUES
('kapoor','karan','chandigarh'),
('niraj','shevade','wai'),
('sharma','kapil','amritsar');
```

MySQL automatically generates the IDs.

### Why AUTO_INCREMENT is Useful

* Automatically generates unique IDs
* Avoids manually managing IDs
* Commonly used with primary keys
* Makes inserting new records easier
* Can be referenced by foreign keys
* Provides sequential identifiers

> **Important:** AUTO_INCREMENT values are not guaranteed to be continuous because deleted rows or failed inserts can result in gaps.

---

# 3️⃣ Custom AUTO_INCREMENT Starting Value

Practiced changing the next AUTO_INCREMENT value.

```sql
ALTER TABLE persons AUTO_INCREMENT = 101;
```

This makes the next generated ID start from `101`.

Also learned that a custom starting value can be specified while creating the table:

```sql
CREATE TABLE persons1(
    p_id INT PRIMARY KEY AUTO_INCREMENT,
    surname VARCHAR(25),
    firstname VARCHAR(25),
    city VARCHAR(25)
) AUTO_INCREMENT = 101;
```

This allows the first automatically generated ID to start from `101`.

---

# 4️⃣ DEFAULT Constraint

The `DEFAULT` constraint provides a value automatically when no value is supplied for a particular column.

### Example

```sql
CREATE TABLE employees(
    id INT PRIMARY KEY,
    name VARCHAR(100),
    country VARCHAR(50) DEFAULT 'india'
);
```

When inserting without specifying `country`:

```sql
INSERT INTO employees (id, name)
VALUES
(1,'maverick'),
(2,'ironman'),
(3,'thor');
```

MySQL automatically assigns:

```text
india
```

to the `country` column.

### Explicit DEFAULT

A default value can also be specified explicitly during insertion using the `DEFAULT` keyword.

### Modifying a DEFAULT Value

Practiced changing the default value using:

```sql
ALTER TABLE employees
MODIFY country VARCHAR(50) DEFAULT 'Canada';
```

---

# 5️⃣ NULL and NOT NULL

Learned the difference between `NULL` and `NOT NULL`.

### NOT NULL

`NOT NULL` ensures that a column must contain a value.

Example:

```sql
CREATE TABLE student(
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age INT
);
```

The `name` column cannot contain `NULL`.

This would produce an error:

```sql
INSERT INTO student
VALUES (101, NULL, 21);
```

But this is valid:

```sql
INSERT INTO student
VALUES (101, 'Karan', NULL);
```

because `age` was not defined as `NOT NULL`.

### Important Understanding

`NULL` means **absence of a value**.

It is different from:

```text
0
''
'NULL'
```

These represent different things.

---

# 6️⃣ SELECT Statement ⭐

The `SELECT` statement is used to retrieve data from a database.

Created a `students1` table for practicing different types of SELECT queries.

```sql
CREATE TABLE students1(
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age INT
);
```

Inserted sample records:

```sql
INSERT INTO students1 (id, name, age)
VALUES
(1, 'Rahul Sharma', 20),
(2, 'Anjali Verma', 22),
(3, 'Vikram Singh', 19),
(4, 'Pooja Nair', 23),
(5, 'Rohit Mehra', 21);
```

---

## Selecting All Columns

```sql
SELECT * FROM students1;
```

`*` means all columns.

---

## Selecting a Specific Column

```sql
SELECT name FROM students1;
```

This returns only the `name` column.

---

## Selecting Multiple Columns

```sql
SELECT name, age
FROM students1;
```

This returns only the selected columns.

---

# 7️⃣ DESCRIBE / DESC

Practiced using:

```sql
DESC students1;
```

or:

```sql
DESCRIBE students1;
```

This displays information about the table structure, including:

* Column names
* Data types
* NULL/NOT NULL status
* Key information
* Default values
* Extra attributes such as AUTO_INCREMENT

---

# 🧠 Key Learnings

### AUTO_INCREMENT

Automatically generates IDs.

```sql
id INT AUTO_INCREMENT PRIMARY KEY
```

### DEFAULT

Provides a value when one isn't supplied.

```sql
country VARCHAR(50) DEFAULT 'India'
```

### NOT NULL

Prevents a column from storing `NULL`.

```sql
name VARCHAR(50) NOT NULL
```

### NULL

Represents the absence of a value.

### SELECT

Retrieves data from a table.

```sql
SELECT column_name
FROM table_name;
```

---

# 💻 Practical Work Completed

During Day 3, I practiced:

* [x] Created a database
* [x] Created tables using different data types
* [x] Used `DATETIME`
* [x] Used `YEAR`
* [x] Used `TIMESTAMP`
* [x] Used `CURRENT_TIMESTAMP`
* [x] Used `AUTO_INCREMENT`
* [x] Changed AUTO_INCREMENT starting value
* [x] Created a table with a custom AUTO_INCREMENT value
* [x] Used `DEFAULT`
* [x] Modified a DEFAULT value
* [x] Used `NULL`
* [x] Used `NOT NULL`
* [x] Inserted records
* [x] Used `SELECT *`
* [x] Selected specific columns
* [x] Selected multiple columns
* [x] Used `DESC`

---

# 📌 Commands Practiced

```sql
CREATE DATABASE
USE
CREATE TABLE
INSERT INTO
SELECT
ALTER TABLE
MODIFY
DESC
```

---

# 🚀 What's Next?

The next step is to go deeper into the `SELECT` statement and learn how to **filter, sort, and limit data**.

### Planned Topics

```text
SELECT
   ↓
WHERE
   ↓
Comparison Operators
   ↓
AND / OR / NOT
   ↓
IN
   ↓
BETWEEN
   ↓
LIKE
   ↓
IS NULL / IS NOT NULL
   ↓
ORDER BY
   ↓
LIMIT
   ↓
DISTINCT
```

This will form the foundation for writing practical SQL queries and eventually move toward **data analysis using SQL**.

---

## 📈 Learning Progress

**SQL Fundamentals**

```text
████████████░░░░░░░░  ~60%
```

### Completed So Far

* Database basics
* Data types
* Table creation
* Primary keys
* AUTO_INCREMENT
* DEFAULT
* NULL / NOT NULL
* Basic INSERT
* Basic SELECT

### Next Major Milestone

**Filtering & Sorting Data with SQL** 🔥
