# SQL Practice — Day 6

## 📌 Overview

Day 6 of my SQL learning journey focused on **advanced SQL querying and database performance concepts**.

The practice covered window functions, partitioning data for analysis, pagination using `LIMIT` and `OFFSET`, and MySQL indexes.

The goal of this practice session was to understand how SQL can be used not only for retrieving data, but also for performing **analytical calculations while preserving row-level details** and improving query performance.

---

## 📚 Topics Covered

### 1. Window Functions

Practiced the following window functions:

* `ROW_NUMBER()`
* `RANK()`
* `DENSE_RANK()`
* `LAG()`
* `LEAD()`
* `FIRST_VALUE()`

These functions were practiced using student score data and `PARTITION BY`.

---

### 2. `PARTITION BY`

Learned how `PARTITION BY` divides rows into logical groups inside a window function.

For example:

```sql
ROW_NUMBER() OVER (
    PARTITION BY class
    ORDER BY score DESC
)
```

This allows calculations such as ranking to restart for each group while keeping all individual rows in the result.

---

### 3. `ROW_NUMBER()`

Used `ROW_NUMBER()` to assign a unique sequential number to rows within each partition.

Key point:

* Every row receives a different number.
* Ranking restarts for each partition.
* Useful for ordered row numbering and pagination-related analysis.

---

### 4. `RANK()`

Practiced ranking records based on a particular column.

Key point:

* Equal values receive the same rank.
* Ranking gaps occur after ties.

Example:

```text
Score    Rank
95       1
90       2
90       2
85       4
```

---

### 5. `DENSE_RANK()`

Practiced `DENSE_RANK()` for ranking records while handling ties without creating gaps.

Example:

```text
Score    Dense Rank
95       1
90       2
90       2
85       3
```

---

### 6. `LAG()`

Used `LAG()` to access the value from the previous row.

Example use case:

```sql
LAG(score) OVER (
    PARTITION BY class
    ORDER BY score DESC
)
```

This can be useful for comparing a current value with a previous value.

---

### 7. `LEAD()`

Used `LEAD()` to access the value from the next row.

Example use case:

```sql
LEAD(score) OVER (
    PARTITION BY class
    ORDER BY score DESC
)
```

This can be useful for comparing a current row with a future row.

---

### 8. `FIRST_VALUE()`

Practiced `FIRST_VALUE()` to retrieve the first value within a window.

Using descending score order allowed the highest score within each class to be identified.

---

## 🔄 `GROUP BY` vs `PARTITION BY`

A major concept covered in this practice was the difference between `GROUP BY` and `PARTITION BY`.

### `GROUP BY`

* Groups rows together.
* Usually used with aggregate functions.
* Reduces the number of rows returned.
* Produces summary-level results.

Example:

```sql
SELECT department, AVG(salary)
FROM employee
GROUP BY department;
```

### `PARTITION BY`

* Used with window functions.
* Written inside `OVER()`.
* Does not remove individual rows.
* Allows aggregate calculations while preserving row-level details.
* Useful for analytical queries and detailed reports.

Example:

```sql
SELECT
    name,
    department,
    salary,
    AVG(salary) OVER (
        PARTITION BY department
    ) AS department_average
FROM employee;
```

### Key Difference

```text
GROUP BY
    → Groups and collapses rows

PARTITION BY
    → Groups rows for calculation but preserves rows
```

---

## 📊 Aggregate Functions with Window Functions

Practiced the concept of combining aggregate functions with `PARTITION BY`.

Examples include:

* `SUM() OVER()`
* `AVG() OVER()`
* `COUNT() OVER()`
* `MAX() OVER()`
* `MIN() OVER()`

This allows aggregate information to be displayed alongside individual records.

---

# 🔢 LIMIT and OFFSET

Learned how `LIMIT` and `OFFSET` can be used to control which rows are returned.

### Syntax

```sql
SELECT column_name
FROM table_name
LIMIT number OFFSET offset;
```

For example:

```sql
LIMIT 2 OFFSET 4;
```

means:

* Skip the first 4 rows.
* Return the next 2 rows.

---

## 🛒 Finding the Nth Most Expensive Product

Practiced sorting products by price and using `LIMIT` and `OFFSET` to retrieve specific positions.

Example:

```sql
SELECT productname, unitprice
FROM products
ORDER BY unitprice DESC
LIMIT 1 OFFSET 2;
```

This retrieves the **3rd most expensive product**.

Important concept:

```text
1st position → OFFSET 0
2nd position → OFFSET 1
3rd position → OFFSET 2
```

---

## 📦 Fetching a Range of Records

Practiced retrieving a middle range of products after sorting.

For positions 7 through 10:

```sql
SELECT productname, unitprice
FROM products
ORDER BY productname ASC
LIMIT 4 OFFSET 6;
```

This demonstrates how `LIMIT` and `OFFSET` can be combined to retrieve a specific range of records.

---

# 📄 Pagination

Learned how `LIMIT` and `OFFSET` can be used to implement pagination in applications.

Example with 5 records per page:

```text
Page 1 → LIMIT 5 OFFSET 0
Page 2 → LIMIT 5 OFFSET 5
Page 3 → LIMIT 5 OFFSET 10
Page 4 → LIMIT 5 OFFSET 15
```

General formula:

```text
OFFSET = (page_number - 1) × records_per_page
```

Pagination is useful when large datasets need to be displayed in smaller, manageable sections.

---

# ⚡ MySQL Indexes

Introduced the concept of database indexes and their role in improving data retrieval performance.

An index can be thought of as a **quick reference structure** that helps the database locate data more efficiently.

Indexes can help with:

* Searching
* Filtering
* Sorting
* Data retrieval
* Query performance

Indexes also have trade-offs because they require additional storage and need to be maintained when data is inserted, updated, or deleted.

---

## 🔑 Primary Key Index

Practiced creating a table with a primary key and examining its index.

```sql
CREATE TABLE users (
    id INT AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100),
    PRIMARY KEY (id)
);
```

A primary key:

* Uniquely identifies a row.
* Cannot contain `NULL`.
* Must contain unique values.
* Automatically has an associated index in MySQL.

Indexes can be inspected using:

```sql
SHOW INDEX FROM users;
```

---

## 🔐 Unique Index

Practiced creating a unique index to prevent duplicate values.

```sql
CREATE UNIQUE INDEX idx_unique_email
ON users(email);
```

A unique index ensures that duplicate values cannot be inserted into the indexed column.

Also practiced defining uniqueness directly in the table:

```sql
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255) UNIQUE
);
```

---

## 📇 Standard / Column Index

Practiced creating a normal index on a column.

```sql
CREATE INDEX idx_product_name
ON products(name);
```

This type of index can improve lookup and filtering operations involving the indexed column.

---

# 🔍 SHOW INDEX

Practiced inspecting indexes on a table using:

```sql
SHOW INDEX FROM table_name;
```

This helps examine the indexes currently associated with a table.

---

# 🧪 EXPLAIN

Introduced `EXPLAIN` for understanding how MySQL plans to execute a query.

Example:

```sql
EXPLAIN
SELECT *
FROM products
WHERE name = 'Laptop';
```

`EXPLAIN` is useful when analyzing query execution and investigating query performance.

---

# 🗑️ DROP INDEX

Practiced removing indexes.

### Syntax

```sql
DROP INDEX index_name
ON table_name;
```

Alternative syntax:

```sql
ALTER TABLE table_name
DROP INDEX index_name;
```

Also practiced verifying the index before and after removing it using:

```sql
SHOW INDEX FROM table_name;
```

---

# 🛠️ Practical SQL Work

The practice file contains hands-on examples involving:

* Student ranking
* Class-wise analysis
* Previous and next row comparisons
* Highest-value analysis
* Product price ranking
* Selecting specific records by position
* Pagination
* Primary key indexes
* Unique indexes
* Standard indexes
* Query execution analysis
* Removing indexes

---

# 🧠 Key Takeaways

```text
ROW_NUMBER()
→ Unique sequential numbering

RANK()
→ Same rank for ties + gaps

DENSE_RANK()
→ Same rank for ties + no gaps

LAG()
→ Access previous row

LEAD()
→ Access next row

FIRST_VALUE()
→ Get the first value in a window

PARTITION BY
→ Divide rows into groups without collapsing them

GROUP BY
→ Group rows and produce summarized results

LIMIT
→ Control number of rows returned

OFFSET
→ Skip rows before returning results

INDEX
→ Improve data retrieval performance

UNIQUE INDEX
→ Prevent duplicate values

EXPLAIN
→ Analyze query execution plan

DROP INDEX
→ Remove an index
```

---

## 🎯 Learning Outcome

By the end of Day 6, I practiced moving beyond basic SQL queries into **analytical SQL and database optimization concepts**.

The main focus was understanding how to:

* Rank records within groups.
* Compare current, previous, and next rows.
* Perform calculations without losing row-level information.
* Differentiate `GROUP BY` from `PARTITION BY`.
* Retrieve specific records using `LIMIT` and `OFFSET`.
* Implement pagination logic.
* Understand and create MySQL indexes.
* Enforce uniqueness using unique indexes.
* Inspect indexes using `SHOW INDEX`.
* Use `EXPLAIN` for query analysis.
* Remove indexes when required.

---

## 📂 Practice File

The SQL queries and examples for this learning session are available in the accompanying `.sql` file.

This repository is part of my ongoing **Daily SQL Practice** journey, where I continuously build practical SQL skills through hands-on queries and database exercises.

---

## 🚀 Skills Practiced

**SQL | MySQL | Window Functions | PARTITION BY | GROUP BY | ROW_NUMBER | RANK | DENSE_RANK | LAG | LEAD | FIRST_VALUE | LIMIT | OFFSET | Pagination | Database Indexing | EXPLAIN | Query Optimization**
