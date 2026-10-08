# Day 7 – SQL Practice

This folder contains my **Day 7 SQL practice**, focused on conditional logic, string functions, and SQL JOINs using MySQL.

## 📚 Topics Covered

- CASE Statements
  - Simple CASE
  - Searched CASE
- String Functions
- SQL JOINs
  - INNER JOIN
  - LEFT JOIN
  - RIGHT JOIN
  - FULL JOIN
  - CROSS JOIN
  - NATURAL JOIN
  - SELF JOIN

---

## 1. CASE Statements

`CASE` statements are used for conditional logic in SQL and work similarly to `if-then-else` statements.

Two types of CASE statements were covered:

1. **Simple CASE**
2. **Searched CASE**

### Simple CASE

A Simple CASE is used when comparing one column against multiple fixed values.

### Syntax

```sql
CASE column_name
    WHEN value1 THEN result1
    WHEN value2 THEN result2
    ELSE result
END
```

### Example

A shipping company wants to assign shipping rates based on destination:

| Destination | Shipping Rate |
|---|---:|
| USA | $20 |
| Canada | $30 |
| Mexico | $25 |
| Rest of World | $40 |

The query uses a Simple CASE statement to assign the appropriate shipping rate.

```sql
SELECT *,
       CASE destination
           WHEN 'usa' THEN 20
           WHEN 'canada' THEN 30
           WHEN 'mexico' THEN 25
           ELSE 40
       END AS shipping_rate
FROM orders;
```

---

## 2. Searched CASE

A Searched CASE is used when multiple conditions need to be evaluated using operators such as:

- `>`
- `<`
- `BETWEEN`
- Logical conditions

### Syntax

```sql
CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    ELSE result
END
```

### Example – Student Classification

Students are classified based on their marks:

- Above 80 → Excellent
- 60–80 → Good
- 40–60 → Average
- Below 40 → Needs Improvement

Example query:

```sql
SELECT *,
       CASE
           WHEN marks > 80 THEN 'Excellent'
           WHEN marks BETWEEN 60 AND 80 THEN 'Good'
           WHEN marks BETWEEN 40 AND 60 THEN 'Average'
           ELSE 'Needs Improvement'
       END AS classification
FROM students;
```

---

# 3. String Functions

Several MySQL string functions were practiced using a `customers` table.

| Function | Purpose |
|---|---|
| `UPPER()` | Converts text to uppercase |
| `LOWER()` | Converts text to lowercase |
| `CONCAT()` | Combines multiple strings |
| `SUBSTRING()` | Extracts part of a string |
| `TRIM()` | Removes leading and trailing spaces |
| `REPLACE()` | Replaces characters or text |
| `INSTR()` | Finds the position of a substring |
| `REVERSE()` | Reverses a string |
| `LEFT()` | Extracts characters from the beginning |
| `RIGHT()` | Extracts characters from the end |
| `FORMAT()` | Formats numbers with commas |

### UPPER()

Converts text to uppercase.

```sql
SELECT first_name,
       UPPER(first_name) AS uppercase
FROM customers;
```

### LOWER()

Converts text to lowercase.

```sql
SELECT first_name,
       LOWER(first_name) AS lowercase
FROM customers;
```

### CONCAT()

Combines first name and last name into a single field.

```sql
SELECT first_name,
       last_name,
       CONCAT(first_name, ' ', last_name) AS full_name
FROM customers;
```

### SUBSTRING()

Extracts a specific part of a string.

Example: Extracting the area code from a phone number.

```sql
SELECT phone_number,
       SUBSTRING(phone_number, 1, 3) AS area_code
FROM customers;
```

### TRIM()

Removes unnecessary spaces from the beginning and end of a string.

```sql
SELECT username,
       TRIM(username) AS trim_name
FROM customers;
```

### REPLACE()

Replaces a specific part of a string with another value.

Example: Replacing an email domain.

```sql
SELECT email,
       REPLACE(email, 'example.com', 'gmail.com') AS new_mail
FROM customers;
```

### INSTR()

Finds the position of a substring inside another string.

Example: Finding the position of `@` in an email.

```sql
SELECT email,
       INSTR(email, '@') AS position
FROM customers;
```

### REVERSE()

Reverses a string.

```sql
SELECT first_name,
       REVERSE(first_name) AS rev
FROM customers;
```

### LEFT()

Extracts characters from the beginning of a string.

Example: Checking whether an email starts with `alice`.

```sql
SELECT email,
       CASE
           WHEN LEFT(email, 5) = 'alice'
               THEN 'starts with alice'
           ELSE 'does not start with alice'
       END AS email_start_check
FROM customers;
```

### RIGHT()

Extracts characters from the end of a string.

Example: Checking whether a phone number ends with `7890`.

```sql
SELECT phone_number,
       CASE
           WHEN RIGHT(phone_number, 4) = '7890'
               THEN 'yes'
           ELSE 'no'
       END AS phone_check
FROM customers;
```

### REPLACE() – Character Replacement

Used to replace a specific character in a username.

```sql
SELECT username,
       REPLACE(username, 'a', 'z')
FROM customers;
```

### FORMAT()

Formats numbers using commas.

Example:

```text
1234567 → 1,234,567
```

```sql
SELECT FORMAT(1234567, 0) AS formatted_number;
```

---

# 4. SQL JOINs

A JOIN is used to combine rows from two or more tables based on a related column.

Tables are commonly related using:

- Primary Keys
- Foreign Keys

JOINs allow data from multiple tables to be retrieved in a single query.

## Types of JOINs Covered

- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- FULL JOIN
- CROSS JOIN
- NATURAL JOIN
- SELF JOIN

---

# 5. INNER JOIN

An `INNER JOIN` returns only the rows where matching values exist in both tables.

It represents the intersection between two tables.

### Syntax

```sql
SELECT column_name(s)
FROM table1
INNER JOIN table2
ON table1.column_name = table2.column_name;
```

### Example

```sql
SELECT t1.id,
       t1.name1,
       t2.id,
       t2.name2
FROM t1
INNER JOIN t2
ON t1.id = t2.id;
```

Only records having matching IDs in both tables are returned.

---

## Table Aliases

When using JOINs, both tables may contain columns with the same name.

For example, both `t1` and `t2` contain an `id` column.

Using `SELECT *` can result in duplicate column names and may create ambiguity when writing complex queries, filtering data, or working with application code.

### Best Practice

Use table aliases and explicitly specify the table when referencing columns.

```sql
SELECT a1.id,
       a1.name1,
       a2.name2
FROM t1 AS a1
INNER JOIN t2 AS a2
ON a1.id = a2.id;
```

---

# 6. LEFT JOIN

A `LEFT JOIN` returns:

- All rows from the left table
- Matching rows from the right table
- `NULL` values for the right table when there is no match

### Syntax

```sql
SELECT column_name(s)
FROM table1
LEFT JOIN table2
ON table1.column = table2.column;
```

### Example

```sql
SELECT *
FROM t1
LEFT JOIN t2
ON t1.id = t2.id;
```

---

# 7. RIGHT JOIN

A `RIGHT JOIN` returns:

- All rows from the right table
- Matching rows from the left table
- `NULL` values for the left table when there is no match

### Syntax

```sql
SELECT column_name(s)
FROM table1
RIGHT JOIN table2
ON table1.column = table2.column;
```

### Example

```sql
SELECT *
FROM t1
RIGHT JOIN t2
ON t1.id = t2.id;
```

> In some databases, `RIGHT JOIN` is also called `RIGHT OUTER JOIN`.

---

# 8. FULL JOIN

A `FULL JOIN` returns:

- Matching rows from both tables
- Non-matching rows from the left table
- Non-matching rows from the right table

### MySQL Note

MySQL does **not** directly support `FULL OUTER JOIN`.

It can be simulated using `LEFT JOIN`, `RIGHT JOIN`, and `UNION`.

### Example

```sql
SELECT *
FROM t1
LEFT JOIN t2
ON t1.id = t2.id

UNION

SELECT *
FROM t1
RIGHT JOIN t2
ON t1.id = t2.id;
```

---

# 9. CROSS JOIN

A `CROSS JOIN` produces the **Cartesian product** of two tables.

If:

- Table 1 has `X` rows
- Table 2 has `Y` rows

The resulting table will contain:

```text
X × Y
```

rows.

### Syntax

```sql
SELECT *
FROM table1
CROSS JOIN table2;
```

### Example

```sql
SELECT *
FROM t1
CROSS JOIN t2;
```

### Use Case

A CROSS JOIN is useful when every row from one table needs to be combined with every row from another table.

---

# 10. NATURAL JOIN

A `NATURAL JOIN` automatically joins tables using columns that have:

- The same column name
- Compatible data types

No explicit `ON` condition is required.

### Syntax

```sql
SELECT column_name(s)
FROM table1
NATURAL JOIN table2;
```

### Example

```sql
SELECT *
FROM t1
NATURAL JOIN t2;
```

### Important Note

`NATURAL JOIN` should be used carefully in real-world projects because the join condition is implicit and may produce unexpected results if the table structure changes.

---

# 🗄️ Tables Created

## Orders

Used for practicing **Simple CASE** statements and destination-based shipping rates.

### Columns

- `OrderID`
- `Destination`
- `Price`

---

## Students

Used for practicing **Searched CASE** statements and marks-based classification.

### Columns

- `ID`
- `Name`
- `Marks`

---

## Customers

Used for practicing **String Functions**.

### Columns

- `customer_id`
- `first_name`
- `last_name`
- `email`
- `phone_number`
- `username`
- `product_name`

---

## t1

Used for practicing SQL JOINs.

### Columns

- `id`
- `name1`

---

## t2

Used for practicing SQL JOINs.

### Columns

- `id`
- `name2`

---

# 🎯 Key Learnings

By the end of Day 7, I practiced:

- Conditional logic using `CASE`
- Simple CASE statements
- Searched CASE statements
- Conditional classification
- String manipulation in MySQL
- `UPPER()`
- `LOWER()`
- `CONCAT()`
- `SUBSTRING()`
- `TRIM()`
- `REPLACE()`
- `INSTR()`
- `REVERSE()`
- `LEFT()`
- `RIGHT()`
- `FORMAT()`
- Understanding SQL JOINs
- `INNER JOIN`
- `LEFT JOIN`
- `RIGHT JOIN`
- Simulating `FULL JOIN` using `UNION`
- `CROSS JOIN`
- `NATURAL JOIN`
- Using table aliases
- Avoiding column ambiguity in JOIN queries

---

# 📁 Files

```text
Day7/
│
├── Day7_sql.sql
└── README.md
```

### `Day7_sql.sql`

Contains the complete SQL practice code, including:

- Database creation
- Table creation
- Sample data
- CASE statement examples
- String function examples
- JOIN examples
- Practical SQL queries

### `README.md`

Contains the documentation and concepts covered during Day 7.

---
