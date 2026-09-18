# 📘 SQL Learning – Day 4

## 📅 Day 4: WHERE Clause, Sorting, Constraints & Keys

This session focused on retrieving specific data using the `WHERE` clause, sorting records using `ORDER BY`, and understanding SQL constraints and different types of database keys.

---

## 🗄️ Database Setup

Created a database named `day4_sql` and selected it for practice.

```sql
CREATE DATABASE day4_sql;
USE day4_sql;
```

---

# 1. WHERE Clause

The `WHERE` clause is used to filter records based on a specific condition.

### Basic Syntax

```sql
SELECT *
FROM table_name
WHERE condition;
```

### Examples

Select employees with salary greater than or equal to ₹5,00,000:

```sql
SELECT *
FROM employee
WHERE salary >= 500000;
```

Select an employee with a specific name:

```sql
SELECT *
FROM employee
WHERE name = 'amit';
```

Select employees whose name is not Amit:

```sql
SELECT *
FROM employee
WHERE name <> 'amit';
```

---

# 2. BETWEEN Operator

`BETWEEN` is used to search for values within an inclusive range.

```sql
SELECT *
FROM employee
WHERE salary BETWEEN 20000 AND 50000;
```

This includes both boundary values.

---

# 3. IN Operator

`IN` is used when we want to match a column against multiple specific values.

```sql
SELECT *
FROM employee
WHERE name IN ('amit', 'ramani', 'nikhil');
```

Instead of writing:

```sql
WHERE name = 'amit'
   OR name = 'ramani'
   OR name = 'nikhil'
```

we can use `IN`.

---

# 4. Operators Used with WHERE

| Operator  | Meaning                                 |
| --------- | --------------------------------------- |
| `=`       | Equal to                                |
| `<>`      | Not equal to                            |
| `!=`      | Not equal to                            |
| `>`       | Greater than                            |
| `<`       | Less than                               |
| `>=`      | Greater than or equal to                |
| `<=`      | Less than or equal to                   |
| `BETWEEN` | Within an inclusive range               |
| `LIKE`    | Pattern matching                        |
| `IN`      | Matches any value from a specified list |

---

# 5. LIKE Operator

The `LIKE` operator is used for pattern matching.

### `%` Wildcard

`%` represents zero or more characters.

Find names ending with `t`:

```sql
SELECT *
FROM employee
WHERE name LIKE '%t';
```

Find names starting with `n`:

```sql
SELECT *
FROM employee
WHERE name LIKE 'n%';
```

### `_` Wildcard

`_` represents exactly one character.

```sql
SELECT *
FROM employee
WHERE name LIKE '%i_';
```

This pattern matches names where `i` is the second-last character.

### Important Wildcards

| Wildcard | Meaning                 |
| -------- | ----------------------- |
| `%`      | Zero or more characters |
| `_`      | Exactly one character   |

---

# 6. ORDER BY

`ORDER BY` is used to sort query results.

### Ascending Order

```sql
SELECT *
FROM employee
ORDER BY salary ASC;
```

### Descending Order

```sql
SELECT *
FROM employee
ORDER BY salary DESC;
```

Sorting names:

```sql
SELECT *
FROM employee
ORDER BY name ASC;
```

```sql
SELECT *
FROM employee
ORDER BY name DESC;
```

### ASC vs DESC

| Keyword | Meaning          |
| ------- | ---------------- |
| `ASC`   | Ascending order  |
| `DESC`  | Descending order |

---

# 7. SQL Constraints

Constraints are rules applied to table columns to maintain **data integrity and accuracy**.

Constraints can be defined:

* While creating a table using `CREATE TABLE`
* After creating a table using `ALTER TABLE`

### Common SQL Constraints

* `NOT NULL`
* `UNIQUE`
* `PRIMARY KEY`
* `FOREIGN KEY`
* `CHECK`
* `DEFAULT`

---

# 8. UNIQUE Constraint

The `UNIQUE` constraint ensures that values in a column are not duplicated.

Example:

```sql
CREATE TABLE persons (
    p_id INT NOT NULL UNIQUE,
    name VARCHAR(50) UNIQUE,
    lastname VARCHAR(50),
    city VARCHAR(50)
);
```

Here:

* `p_id` cannot be `NULL` and must be unique.
* `name` must contain unique values.

Attempting to insert a duplicate name:

```sql
INSERT INTO persons
VALUES (2, 'amit', 'yadav', 'pune');
```

will produce a unique constraint error if `amit` already exists.

### Important Points

* A table can have multiple `UNIQUE` constraints.
* `PRIMARY KEY` also guarantees uniqueness.
* A primary key cannot contain `NULL`.
* In MySQL, a `UNIQUE` column can generally contain multiple `NULL` values unless it is also defined as `NOT NULL`.

---

# 9. Adding UNIQUE Using ALTER TABLE

A `UNIQUE` constraint can be added after table creation.

```sql
CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    PhoneNumber VARCHAR(15),
    PRIMARY KEY (EmployeeID)
);
```

Add a unique constraint:

```sql
ALTER TABLE Employees
ADD UNIQUE (PhoneNumber);
```

Check the table structure:

```sql
DESC Employees;
```

Drop the unique index:

```sql
ALTER TABLE Employees
DROP INDEX PhoneNumber;
```

---

# 10. PRIMARY KEY

A **Primary Key** uniquely identifies every record in a table.

### Characteristics

* Values must be unique.
* Values cannot be `NULL`.
* A table can have only one primary key constraint.
* A primary key can consist of one column or multiple columns.

### Creating a Primary Key

```sql
CREATE TABLE persons1 (
    p_id INT PRIMARY KEY,
    last_name VARCHAR(255) NOT NULL,
    first_name VARCHAR(255),
    address VARCHAR(255),
    city VARCHAR(255)
);
```

Insert a valid record:

```sql
INSERT INTO persons1
VALUES (1, 'patil', 'sunil', 'nashik', 'nashik');
```

Trying to insert another record with `p_id = 1` will produce a duplicate key error.

A `NULL` primary key value is also not allowed.

---

# 11. Adding PRIMARY KEY Using ALTER TABLE

A table can initially be created without a primary key.

```sql
CREATE TABLE workers (
    pid INT,
    name VARCHAR(50),
    city VARCHAR(50)
);
```

Add the primary key later:

```sql
ALTER TABLE workers
ADD PRIMARY KEY (pid);
```

Check the structure:

```sql
DESC workers;
```

Drop the primary key:

```sql
ALTER TABLE workers
DROP PRIMARY KEY;
```

---

# 12. Composite / Compound Key

A **Composite Key**, also called a **Compound Key**, consists of two or more columns that together uniquely identify a row.

Example:

```sql
CREATE TABLE bookauthors (
    bookid INT,
    authorid INT,
    role VARCHAR(100),
    PRIMARY KEY (bookid, authorid)
);
```

Here:

```text
bookid + authorid
```

together form the primary key.

### Important Concept

The individual columns do **not** need to be unique.

For example:

| bookid | authorid |
| -----: | -------: |
|      1 |      101 |
|      1 |      102 |
|      2 |      101 |

This is valid because each **combination** is unique.

But:

```text
(1, 101)
(1, 101)
```

would violate the composite primary key.

---

# 13. Natural Key

A **Natural Key** is a real-world attribute that can naturally identify a record.

Examples:

* Social Security Number
* Email address
* Vehicle Identification Number (VIN)

The key has meaning in the real world.

---

# 14. Surrogate Key

A **Surrogate Key** is an artificial identifier generated specifically for identifying records.

Common examples include:

* Auto-incremented numbers
* GUIDs / UUIDs

Example:

```sql
EmployeeID INT AUTO_INCREMENT
```

Unlike a natural key, a surrogate key generally has no business meaning.

---

# 15. FOREIGN KEY

A **Foreign Key** establishes a relationship between two tables.

The table containing the foreign key is called the **child table**.

The table being referenced is called the **parent table**.

A foreign key generally references a primary key or an appropriate unique key in the parent table.

### Parent Table

```sql
CREATE TABLE university (
    id INT PRIMARY KEY,
    university VARCHAR(40)
);
```

Insert universities:

```sql
INSERT INTO university VALUES
(1, 'pune'),
(2, 'mumbai'),
(3, 'delhi'),
(4, 'madras');
```

### Child Table

```sql
CREATE TABLE student2 (
    seat_number INT PRIMARY KEY,
    name VARCHAR(40) NOT NULL,
    university_id INT NOT NULL,
    subject VARCHAR(30) NOT NULL,
    FOREIGN KEY (university_id)
        REFERENCES university(id)
);
```

Here:

```text
university.id
      ↑
      |
student2.university_id
```

`student2.university_id` references `university.id`.

This prevents a student from referencing a university ID that does not exist in the parent table.

---

# 16. Adding FOREIGN KEY Using ALTER TABLE

A foreign key can also be added after creating the table.

```sql
ALTER TABLE student2
ADD CONSTRAINT fk1
FOREIGN KEY (university_id)
REFERENCES university(id);
```

The constraint is named:

```text
fk1
```

---

# 17. Dropping FOREIGN KEY

A foreign key constraint can be removed using `ALTER TABLE`.

```sql
ALTER TABLE student2
DROP CONSTRAINT student2_ibfk_1;
```

The exact constraint name can be checked using:

```sql
SHOW CREATE TABLE student2;
```

---

# 18. CHECK Constraint

The `CHECK` constraint restricts the values that can be inserted into a column or row.

Example:

```sql
CREATE TABLE Persons2 (
    P_Id INT NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    FirstName VARCHAR(255),
    Address VARCHAR(255),
    City VARCHAR(255),
    CHECK (P_Id > 0)
);
```

Here:

```sql
CHECK (P_Id > 0)
```

means `P_Id` must be greater than `0`.

This is valid:

```sql
INSERT INTO Persons2 (P_Id, LastName)
VALUES (3, 'Brown');
```

This violates the constraint:

```sql
INSERT INTO Persons2 (P_Id, LastName)
VALUES (-2, 'Brown');
```

because `-2` is not greater than `0`.

---

# 19. Named CHECK Constraint

A constraint can be given a specific name.

```sql
CREATE TABLE Person (
    P_Id INT NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    FirstName VARCHAR(255),
    Address VARCHAR(255),
    City VARCHAR(255),
    CONSTRAINT chk_Person
        CHECK (P_Id > 0 AND City = 'Sandnes')
);
```

Here:

```text
chk_Person
```

is the constraint name.

---

# 20. Adding CHECK Using ALTER TABLE

A `CHECK` constraint can be added after creating a table.

```sql
ALTER TABLE Person
ADD CHECK (P_Id > 10);
```

Or with a name:

```sql
ALTER TABLE Person
ADD CONSTRAINT chk_Person
CHECK (P_Id > 0 AND City = 'Sandnes');
```

A named constraint can later be removed:

```sql
ALTER TABLE Person
DROP CONSTRAINT chk_Person;
```

---

# 🧠 Key Concepts Learned

| Concept       | Purpose                                  |
| ------------- | ---------------------------------------- |
| `WHERE`       | Filters records                          |
| `BETWEEN`     | Filters a range                          |
| `IN`          | Matches multiple specified values        |
| `LIKE`        | Pattern matching                         |
| `ORDER BY`    | Sorts query results                      |
| `UNIQUE`      | Prevents duplicate values                |
| `NOT NULL`    | Prevents NULL values                     |
| `PRIMARY KEY` | Uniquely identifies records              |
| Composite Key | Uses multiple columns as one key         |
| Natural Key   | Real-world meaningful identifier         |
| Surrogate Key | Artificial/system-generated identifier   |
| `FOREIGN KEY` | Establishes relationships between tables |
| `CHECK`       | Restricts allowed values                 |

---

# 🎯 Day 4 Learning Outcomes

By the end of Day 4, I practiced and understood:

* Filtering records using `WHERE`
* Using comparison operators
* Using `BETWEEN`
* Using `IN`
* Pattern matching with `LIKE`
* Understanding `%` and `_` wildcards
* Sorting records with `ORDER BY`
* Understanding SQL constraints
* Creating `UNIQUE` constraints
* Adding and dropping constraints using `ALTER TABLE`
* Creating and modifying primary keys
* Understanding composite/compound keys
* Understanding natural keys
* Understanding surrogate keys
* Creating foreign key relationships
* Adding and removing foreign keys
* Understanding `CHECK` constraints
* Adding named `CHECK` constraints using `ALTER TABLE`

---

## 📌 Practice Summary

**Day 4 focused heavily on database integrity and relationships.**

The major progression was:

```text
Filtering Data
     ↓
WHERE + Operators
     ↓
LIKE + IN + BETWEEN
     ↓
Sorting
     ↓
Constraints
     ↓
UNIQUE
     ↓
PRIMARY KEY
     ↓
COMPOSITE KEY
     ↓
NATURAL & SURROGATE KEYS
     ↓
FOREIGN KEY
     ↓
CHECK CONSTRAINT
```

This session established the foundation for understanding how relational databases maintain **unique records, valid data, and relationships between tables**.
