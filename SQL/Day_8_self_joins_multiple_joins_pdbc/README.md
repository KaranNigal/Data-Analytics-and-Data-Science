# Day 8 – SQL & Python MySQL Database Practice

## 📚 Overview

This practice session covered:

- Connecting Python with MySQL using `mysql.connector`
- Installing and verifying `mysql-connector-python`
- Checking the Python/Jupyter environment
- Creating a database from Python
- Selecting/using a database
- Creating a table from Python
- Inserting records from Python
- Using `commit()` to save database changes
- Handling MySQL connection errors with `try` / `except`
- SQL SELF JOIN
- Employee–Manager relationships
- Using aliases in a SELF JOIN
- Joining multiple tables
- Primary keys and foreign keys
- Combining `Orders`, `Employees1`, and `Customers` using JOINs

---

# 1. Python + MySQL Connection

## Installing the MySQL Connector

The Jupyter practice started by installing the MySQL connector:

```python
! pip install mysql-connector-python
```

The package was also checked/installed using Jupyter's `%pip` command:

```python
%pip --version
%pip install mysql-connector-python
```

The purpose of `mysql-connector-python` is to allow Python programs to connect and communicate with a MySQL database.

---

# 2. Checking the Python Environment

The Python interpreter being used by the Jupyter Notebook was checked with:

```python
import sys
print(sys.executable)
```

This is useful when a package appears to be installed but Python gives:

```text
ModuleNotFoundError: No module named 'mysql'
```

Checking `sys.executable` helps identify which Python environment the Jupyter Notebook is actually using.

---

# 3. Basic Python MySQL Connection

The basic connection code practiced was:

```python
import mysql.connector

try:
    conn = mysql.connector.connect(
        user='root',
        password='1111',
        host='localhost',
        port='3306'
    )

    if conn.is_connected():
        print('connected the DB')

except:
    print('DB not connected')
```

## Explanation

### Importing the connector

```python
import mysql.connector
```

Imports the MySQL connector library into Python.

### Creating the connection

```python
conn = mysql.connector.connect(...)
```

Creates a connection between Python and the MySQL server.

### Connection details

```python
user='root'
```

The MySQL username.

```python
password='1111'
```

The password for the MySQL user.

```python
host='localhost'
```

Indicates that the MySQL server is running on the local computer.

```python
port='3306'
```

Uses MySQL's port `3306`.

### Checking the connection

```python
if conn.is_connected():
```

Checks whether the connection is active.

### Exception handling

```python
except:
    print('DB not connected')
```

Runs if the connection attempt fails.

---

# 4. Creating a Database from Python

The Python practice then used a cursor to execute SQL commands.

```python
cur = conn.cursor()
cur.execute('create database pdbc_vs')
```

### Cursor

```python
cur = conn.cursor()
```

A cursor is used to execute SQL statements from Python.

### Execute SQL

```python
cur.execute('create database pdbc_vs')
```

Runs the SQL statement:

```sql
CREATE DATABASE pdbc_vs;
```

---

# 5. Selecting the Database

```python
cur.execute('use pdbc_vs')
```

This selects the `pdbc_vs` database for subsequent SQL operations.

Equivalent SQL:

```sql
USE pdbc_vs;
```

---

# 6. Creating a Table from Python

The practice created a `student` table:

```python
cur.execute('create table student(id int, name varchar(20), marks int)')
```

The equivalent SQL is:

```sql
CREATE TABLE student(
    id INT,
    name VARCHAR(20),
    marks INT
);
```

The table contains three columns:

| Column | Data Type |
|---|---|
| `id` | `INT` |
| `name` | `VARCHAR(20)` |
| `marks` | `INT` |

---

# 7. Inserting Data from Python

The practice inserted three records:

```python
cur.execute("insert into student values (1,'k',2),(2,'a',4),(3,'h',7)")
```

Equivalent SQL:

```sql
INSERT INTO student VALUES
(1, 'k', 2),
(2, 'a', 4),
(3, 'h', 7);
```

The inserted records are:

| id | name | marks |
|---:|---|---:|
| 1 | k | 2 |
| 2 | a | 4 |
| 3 | h | 7 |

---

# 8. `commit()` in Python MySQL

After inserting data, the practice used:

```python
conn.commit()
```

The comment in the practice code highlights that this is important for saving the database changes:

```python
conn.commit() # very important to save this in the data base
```

`commit()` commits the transaction so that changes such as the `INSERT` are saved to the database.

---

# 9. Python MySQL Error Handling

The practice also imported the MySQL error class:

```python
from mysql.connector import Error
```

Then used:

```python
except Error as msg:
    print(msg)
    print('DB not connected')
```

This allows the MySQL connector error to be displayed.

---

# 10. Complete Python Database Practice

The complete Python script practiced was:

```python
import mysql.connector
from mysql.connector import Error

try:
    conn = mysql.connector.connect(
        user='root',
        password='1111',
        host='localhost',
        port='3306'
    )

    if conn.is_connected():
        print('connected the DB')

    cur = conn.cursor()

    cur.execute('create database pdbc_vs')
    cur.execute('use pdbc_vs')
    cur.execute('create table student(id int, name varchar(20), marks int)')
    cur.execute("insert into student values (1,'k',2),(2,'a',4),(3,'h',7)")

    conn.commit()  # very important to save this in the data base

except Error as msg:
    print(msg)
    print('DB not connected')
```

---

# 11. SQL SELF JOIN

## Definition

A **SELF JOIN** is a join where a table is joined with itself.

From the practice:

> A SELF JOIN is a join where a table is joined with itself.

This is useful when rows in the same table have relationships with other rows in that same table.

---

# 12. SELF JOIN Use Cases

The practice identified these use cases:

- Employee and Manager relationship
- Hierarchical data
- Comparing rows within the same table

A common example is an employee table where every employee can have another employee as their manager.

---

# 13. Important SELF JOIN Rule

Aliases are mandatory in the practiced SELF JOIN example because the same table is being used multiple times.

For example:

```sql
employees AS e1
```

and:

```sql
employees AS e2
```

Here:

- `e1` represents one use of the `employees` table
- `e2` represents another use of the same `employees` table

This allows SQL to distinguish between the employee and their manager.

---

# 14. Creating the Employees Table

The SELF JOIN practice created:

```sql
CREATE TABLE Employees (
    EmployeeID INT,
    Name VARCHAR(50),
    ManagerID INT
);
```

The columns are:

| Column | Purpose |
|---|---|
| `EmployeeID` | Identifies the employee |
| `Name` | Employee's name |
| `ManagerID` | Identifies the employee's manager |

---

# 15. Employee Data

The following records were inserted:

```sql
INSERT INTO Employees (EmployeeID, Name, ManagerID) VALUES
(1, 'Alice', NULL),
(2, 'Bob', 1),
(3, 'Charlie', 1),
(4, 'Diana', 2),
(5, 'Evan', 2);
```

The resulting relationship can be understood as:

| EmployeeID | Name | ManagerID |
|---:|---|---:|
| 1 | Alice | NULL |
| 2 | Bob | 1 |
| 3 | Charlie | 1 |
| 4 | Diana | 2 |
| 5 | Evan | 2 |

This means:

- Alice has no manager listed.
- Bob's manager is employee `1` (Alice).
- Charlie's manager is employee `1` (Alice).
- Diana's manager is employee `2` (Bob).
- Evan's manager is employee `2` (Bob).

---

# 16. Viewing the Employees Table

The practice used:

```sql
SELECT * FROM employees;
```

This selects all columns and all rows from the `employees` table.

---

# 17. SELF JOIN Query

The practiced SELF JOIN was:

```sql
SELECT
    e1.name AS ename,
    e2.name AS managername
FROM employees AS e1
LEFT JOIN employees AS e2
    ON e1.managerid = e2.employeeid;
```

## How it works

The same `employees` table is given two aliases:

```sql
employees AS e1
```

and:

```sql
employees AS e2
```

`e1` represents the employee.

`e2` represents the manager.

The relationship is established using:

```sql
ON e1.managerid = e2.employeeid
```

In other words:

```text
Employee's ManagerID
        =
Manager's EmployeeID
```

The selected columns are:

```sql
e1.name AS ename
```

The employee's name.

And:

```sql
e2.name AS managername
```

The manager's name.

The `LEFT JOIN` keeps employees from the left side (`e1`) even when they do not have a matching manager.

---

# 18. Joining Multiple Tables

The second SQL topic practiced was joining multiple tables.

The tables used were:

```text
Employees1
Customers
Orders
```

The `Orders` table connects employees and customers.

---

# 19. Employees1 Table

```sql
CREATE TABLE Employees1 (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50)
);
```

Columns:

| Column | Description |
|---|---|
| `EmployeeID` | Employee identifier |
| `FirstName` | Employee first name |
| `LastName` | Employee last name |

`EmployeeID` is the primary key.

---

# 20. Customers Table

```sql
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CompanyName VARCHAR(100)
);
```

Columns:

| Column | Description |
|---|---|
| `CustomerID` | Customer identifier |
| `CompanyName` | Customer/company name |

`CustomerID` is the primary key.

---

# 21. Orders Table

```sql
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    EmployeeID INT,
    CustomerID INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees1(EmployeeID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
```

The `Orders` table contains:

| Column | Description |
|---|---|
| `OrderID` | Order identifier |
| `EmployeeID` | Employee associated with the order |
| `CustomerID` | Customer associated with the order |

`OrderID` is the primary key.

The table also contains two foreign keys:

```sql
FOREIGN KEY (EmployeeID) REFERENCES Employees1(EmployeeID)
```

This connects `Orders.EmployeeID` with `Employees1.EmployeeID`.

And:

```sql
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
```

This connects `Orders.CustomerID` with `Customers.CustomerID`.

---

# 22. Employees Data

```sql
INSERT INTO Employees1 (EmployeeID, FirstName, LastName) VALUES
(1, 'Ravi', 'Kumar'),
(2, 'Anjali', 'Mehra'),
(3, 'Suresh', 'Patel');
```

Data:

| EmployeeID | FirstName | LastName |
|---:|---|---|
| 1 | Ravi | Kumar |
| 2 | Anjali | Mehra |
| 3 | Suresh | Patel |

---

# 23. Customers Data

```sql
INSERT INTO Customers (CustomerID, CompanyName) VALUES
(101, 'Tata Consultancy Services'),
(102, 'Infosys Technologies'),
(103, 'Wipro Limited');
```

Data:

| CustomerID | CompanyName |
|---:|---|
| 101 | Tata Consultancy Services |
| 102 | Infosys Technologies |
| 103 | Wipro Limited |

---

# 24. Orders Data

```sql
INSERT INTO Orders (OrderID, EmployeeID, CustomerID) VALUES
(1001, 1, 101),
(1002, 2, 102),
(1003, 3, 103),
(1004, 1, 103),
(1005, 2, 101);
```

Data:

| OrderID | EmployeeID | CustomerID |
|---:|---:|---:|
| 1001 | 1 | 101 |
| 1002 | 2 | 102 |
| 1003 | 3 | 103 |
| 1004 | 1 | 103 |
| 1005 | 2 | 101 |

---

# 25. Joining Orders, Employees1 and Customers

The practiced query was:

```sql
SELECT
    orders.orderid,
    employees1.firstname AS empfirstname,
    employees1.lastname AS emplastname,
    customers.companyname AS company
FROM
    orders
JOIN
    employees1
    ON orders.employeeid = employees1.employeeid
JOIN
    customers
    ON orders.customerid = customers.customerid;
```

## What this query does

It starts with:

```sql
FROM orders
```

Then joins `Orders` with `Employees1`:

```sql
JOIN employees1
ON orders.employeeid = employees1.employeeid
```

This connects every order with the employee associated with that order.

Then it joins `Customers`:

```sql
JOIN customers
ON orders.customerid = customers.customerid
```

This connects every order with its customer.

---

# 26. Columns Selected from the Multiple-Table JOIN

The query selects:

```sql
orders.orderid
```

The order ID.

```sql
employees1.firstname AS empfirstname
```

The employee's first name, displayed as `empfirstname`.

```sql
employees1.lastname AS emplastname
```

The employee's last name, displayed as `emplastname`.

```sql
customers.companyname AS company
```

The customer's company name, displayed as `company`.

---

# 27. Conceptual Relationship

The table relationship practiced can be represented as:

```text
Employees1
    |
    | EmployeeID
    |
    v
 Orders
    |
    | CustomerID
    |
    v
Customers
```

`Orders` acts as the table that connects the employee and customer information.

---

# 28. Important SQL Concepts Practiced

## `CREATE DATABASE`

Creates a new database:

```sql
CREATE DATABASE day8_sql_1;
```

## `USE`

Selects a database:

```sql
USE day8_sql_1;
```

## `CREATE TABLE`

Creates a table:

```sql
CREATE TABLE Employees (
    EmployeeID INT,
    Name VARCHAR(50),
    ManagerID INT
);
```

## `INSERT INTO`

Adds records:

```sql
INSERT INTO Employees (EmployeeID, Name, ManagerID)
VALUES
(1, 'Alice', NULL);
```

## `SELECT`

Retrieves data:

```sql
SELECT * FROM employees;
```

## `JOIN`

Combines related rows from different tables.

## `LEFT JOIN`

Keeps all rows from the left table and matches rows from the right table when possible.

## `PRIMARY KEY`

Uniquely identifies a row in a table.

Example:

```sql
EmployeeID INT PRIMARY KEY
```

## `FOREIGN KEY`

Creates a relationship between tables.

Example:

```sql
FOREIGN KEY (EmployeeID)
REFERENCES Employees1(EmployeeID)
```

## `AS`

Creates an alias for a column or table.

Example:

```sql
employees1.firstname AS empfirstname
```

## `commit()`

Saves transaction changes made through the Python database connection.

---

# 29. Key Takeaways from Day 8

### Python + MySQL

```text
mysql.connector
      ↓
connect()
      ↓
connection object
      ↓
cursor()
      ↓
execute(SQL)
      ↓
commit()
```

### SELF JOIN

```text
Same table
    ↓
Use aliases
    ↓
Join the table with itself
    ↓
Compare related rows
```

Example:

```sql
employees AS e1
LEFT JOIN employees AS e2
ON e1.managerid = e2.employeeid
```

### Multiple-table JOIN

```text
Orders
   ↓
JOIN Employees1
   ↓
JOIN Customers
   ↓
Combined result
```

---

# 30. Practice Files

This Day 8 practice contains:

- `pdbc_jupyter.ipynb` — Jupyter practice for installing/checking the MySQL connector and testing the Python environment.
- `pdbc.py` — Python-to-MySQL connection and database/table/insert practice.
- `Day_8_self_join_pdbc.sql` — SQL practice covering SELF JOIN and multiple-table JOINs.

---

# 31. Day 8 Quick Revision

```text
mysql.connector
    → Connect Python with MySQL

conn
    → MySQL connection object

conn.cursor()
    → Creates cursor for executing SQL

cur.execute()
    → Executes SQL from Python

conn.commit()
    → Saves transaction changes

SELF JOIN
    → Joins a table with itself

Aliases
    → Distinguish multiple uses of the same table

LEFT JOIN
    → Keeps all rows from the left table

PRIMARY KEY
    → Uniquely identifies a row

FOREIGN KEY
    → Connects related tables

Orders + Employees1 + Customers
    → Example of joining multiple related tables
```

---

# 🎯 Day 8 Summary

Day 8 focused on connecting **Python with MySQL** and strengthening SQL JOIN concepts.

The Python section practiced creating a MySQL connection, creating a database, selecting the database, creating a table, inserting records, committing changes, and handling connection errors.

The SQL section focused on **SELF JOIN**, particularly the employee-manager relationship, and then moved to **multiple-table JOINs** using `Orders`, `Employees1`, and `Customers`.

These concepts form an important foundation for using SQL from Python in data analytics projects.