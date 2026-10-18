# SQL Learning — Day 1

This repository contains my **Day 1 SQL practice using MySQL Command Line Client**.

The goal of this session was to understand the basic workflow of working with databases and tables in SQL.

## 📚 Topics Covered

### 1. Creating a Database

Created a database named `d1b24`:

```sql
CREATE DATABASE d1b24;
```

### 2. Selecting a Database

Used the `USE` command to select the database:

```sql
USE d1b24;
```

This tells MySQL which database I want to work with.

### 3. Creating Tables

Created a `student` table with three columns:

```sql
CREATE TABLE student (
    id INT,
    name VARCHAR(50),
    marks INT
);
```

Also created an `employee` table:

```sql
CREATE TABLE employee (
    emp_id INT,
    emp_name VARCHAR(50),
    emp_salary INT
);
```

### 4. Inserting Data

Inserted multiple records into the `student` table:

```sql
INSERT INTO student
VALUES
(1, 'Puja', 67),
(2, 'Rani', 88),
(3, 'Priya', 46);
```

Inserted employee records:

```sql
INSERT INTO employee
VALUES
(101, 'Karan', 10000),
(102, 'Niraj', 20000),
(103, 'Manish', 30000);
```

### 5. Retrieving Data

Used `SELECT *` to display all columns and rows from a table:

```sql
SELECT * FROM student;
```

```sql
SELECT * FROM employee;
```

## 🧠 Key Learnings

* A **database** contains tables.
* A **table** contains rows and columns.
* `CREATE DATABASE` creates a new database.
* `USE` selects the database we want to work with.
* `CREATE TABLE` creates a new table.
* `INSERT INTO` adds records to a table.
* `SELECT` retrieves data from a table.
* `*` means all columns.
* SQL statements are generally terminated with `;`.

## 📁 Practice File

The SQL commands practiced during this session are available in:

```text
day01.sql
```

## 🎯 Day 1 Goal

Understand the basic SQL workflow:

```text
Create Database
      ↓
Select Database
      ↓
Create Table
      ↓
Insert Data
      ↓
Retrieve Data
```

## 🚀 Progress

**Day 1 — SQL Basics ✅**

More SQL concepts and practice will be added as I continue learning.
