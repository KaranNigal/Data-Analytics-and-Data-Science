-- day 6 

-- Aggregate functions in my sql
-- ===================================
-- Aggregation in sql refers to the process of combining multiple rows of data into a single row obtain a summary of total


-- Aggregate functions:
-- Aggregate function perform a calculation on a set of values and return a single value

-- Count(): count the number of rows in a columns
-- sum(): calculate the total of numeric column
-- AVG(): Determines the average  of numeric column
-- min(): find the smallest value in a column
-- max(): find the largest value in a column

create database day6_sql;

use day6_sql;

CREATE TABLE Product (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100),
    UnitPrice DECIMAL(10, 2)
);

-- Insert sample data
INSERT INTO Product (ProductName, UnitPrice)
VALUES 
    ('Product A', 50.00),
    ('Product B', 30.00),
    ('Product C', 70.00),
    ('Product D', 20.00),
    ('Product E', 90.00);
    
    SELECT COUNT(UnitPrice) AS TotalProducts FROM Product;
    
--  Step 2: SQL Queries for Aggregate Functions
-- Count(): Count the number of rows in a column

SELECT COUNT(UnitPrice) AS TotalProducts FROM Product;

-- Sum(): Calculate the total of a numeric column

SELECT SUM(UnitPrice) AS TotalUnitPrice FROM Product;

-- AVG(): Determine the average of a numeric column

SELECT AVG(UnitPrice) AS AverageUnitPrice FROM Product;

-- MIN(): Find the smallest value in a column

SELECT MIN(UnitPrice) AS LowestUnitPrice FROM Product;

-- MAX(): Find the largest value in a column

SELECT MAX(UnitPrice) AS HighestUnitPrice FROM Product;

-- GROUP by in SQL:
-- --This allows you to group rows that have the same values in specified columns and then perform calculations on each group.

-- --It makes group of records based on column name you specified. It happens internally

-- --Generally it is used with aggregate function to perform calculations on each group of data

-- GROUP BY Rule:
-- Any column used in the SELECT clause that is not inside an aggregate function must be included in the GROUP BY clause.

-- syntax:

-- SELECT colum_name FROM TABLE_NAME GROUP BY COLUMN;

CREATE TABLE cricketers (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    team VARCHAR(50),
    role VARCHAR(50), -- Role could be 'Batsman', 'Bowler', or 'All-rounder'
    runs_scored INT,
    wickets_taken INT
);


INSERT INTO cricketers (id, name, team, role, runs_scored, wickets_taken)
VALUES
    (1, 'Virat Kohli', 'India', 'Batsman', 12000, 0),
    (2, 'Rohit Sharma', 'India', 'Batsman', 9000, 0),
    (3, 'Jasprit Bumrah', 'India', 'Bowler', 200, 250),
    (4, 'Kane Williamson', 'New Zealand', 'Batsman', 8000, 0),
    (5, 'Trent Boult', 'New Zealand', 'Bowler', 150, 270),
    (6, 'Ben Stokes', 'England', 'All-rounder', 5000, 150),
    (7, 'Joe Root', 'England', 'Batsman', 8000, 10),
    (8, 'Jofra Archer', 'England', 'Bowler', 300, 180);
    
    
Select * from cricketers;

-- Example 1: Total Runs by Team
-- This query will group cricketers by their team and sum the total runs scored by each team:

SELECT team, SUM(runs_scored) AS total_runs
FROM cricketers
GROUP BY team;

-- Write an SQL query to calculate the average runs scored by cricketers based on their role (e.g., Batsman, Bowler, All-rounder).

SELECT role, AVG(runs_scored) AS avg_runs
FROM cricketers
GROUP BY role;

-- How can you calculate the total wickets taken by cricketers, grouped by their respective teams?

SELECT team, SUM(wickets_taken) AS total_wickets
FROM cricketers
GROUP BY team;

-- SQL ALIAS
-- =============
-- In MySQL,an alias is a temporary name assigned to a table or a column in a query

-- aliases are temporary and only exist for the duration of the query

-- SELECT column_name as alias_name

-- the as keyword is optional when creating alias

-- e.g select column_name alias_name

--  Customer Contact Information 
-- Manager's Question: "Can you show me a list of customer names and their contact titles, but rename the columns as 'Customer' and 'Title'?"

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    ContactName VARCHAR(100),
    ContactTitle VARCHAR(100)
);


INSERT INTO Customers (ContactName, ContactTitle)
VALUES
    ('Ravi Kumar', 'Sales Executive'),
    ('Anita Sharma', 'Marketing Manager'),
    ('Rajesh Singh', 'IT Consultant'),
    ('Neha Verma', 'Customer Service Manager'),
    ('Amit Patel', 'Operations Head');
    
SELECT ContactName AS Customer, ContactTitle AS Title 
FROM Customers;

-- Arithmetic Operators in SQL: Questions and Answers
-- Q1: Increase each employee's salary by 5000 and display the updated salary.

CREATE TABLE employee (
    id INT,
    name VARCHAR(50),
    salary DECIMAL(10,2)
);

INSERT INTO employee (id, name, salary)
VALUES
    (101, 'amit', 25000),
    (102, 'ramani', 30000),
    (103, 'hitesh', 5000000),
    (105, 'jatin', 33000),
    (106, 'nikhat', 500000),
    (107, 'nikhil', 77000),
    (101, 'ajay', 52000);
    
SELECT *, (salary + 5000) AS new_sal FROM employee;

-- Q2: Decrease each employee's salary by 5000 and display the updated salary.

SELECT *,(salary - 5000) AS new_sal1 FROM employee;

-- Q3: Double each employee's salary and display the updated salary.

SELECT *, (salary * 2) AS new_sal FROM employee;

-- Q4: Divide each employee's salary by 2 and display the updated value.

SELECT *, (salary / 2) AS new_sal FROM employee;    
    
-- if we want to do all operations at a time then,

SELECT *,
(salary + 50) as new_sal, 
(salary - 1000) as less_sal, 
(salary * 2) as incrise_sal, 
(salary / 4) as Dec_sal 
FROM employee;

-- To calculate Amit's salary excluding 2 days of absence, we need to adjust the salary based on the number of working days in a month.

SELECT name, salary,
(salary / 30) AS daily_wage,
(salary - ((salary / 30) * 2)) AS adjusted_salary
FROM employee
WHERE name = 'amit';

-- having clause:
-- The Having clause in MySQL is used in combination with the group by statement to filter groups based on specified condition

-- unlike the where clause, which filter rows before they are grouped, the having clause filters after grouping has occurred

-- its particularly useful when you want to apply conditions on aggregate function like sum,AVG,COUNT etc.

CREATE TABLE OrderDetails (
    OrderID INT,
    UnitPrice DECIMAL(10, 2),
    Quantity INT
);

INSERT INTO OrderDetails (OrderID, UnitPrice, Quantity)
VALUES
    (1, 50.00, 100),
    (1, 20.00, 200),
    (2, 15.00, 300),
    (2, 25.00, 100),
    (3, 100.00, 50),
    (3, 10.00, 500),
    (4, 30.00, 50),
    (4, 40.00, 20);
    
--     Question: manager Question: can you identify orders with total sales that exceed a certain amount=7000?

SELECT OrderID, SUM(UnitPrice * Quantity) AS TotalPurchases

FROM OrderDetails

GROUP BY OrderID

HAVING TotalPurchases > 5000;


CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    CategoryID INT
);


INSERT INTO Products (ProductID, ProductName, CategoryID)
VALUES
    (1, 'Pen', 1),
    (2, 'Pencil', 1),
    (3, 'Notebook', 1),
    (4, 'Eraser', 1),
    (5, 'Sharpener', 1),
    (6, 'Highlighter', 1),
    (7, 'Ruler', 2),
    (8, 'Geometry Box', 2),
    (9, 'File', 2),
    (10, 'Stapler', 3),
    (11, 'Glue Stick', 3);

SELECT CategoryID, COUNT(ProductID) AS NumberOfProducts

FROM Products

GROUP BY CategoryID

HAVING NumberOfProducts > 5;

-- Step 2: Apply HAVING Clause
-- The HAVING clause filters out rows where NumberOfProducts <= 5;



-- RANk,DENSE RANK , ROW number

-- ROW NUM: Sequential numbering of each row.
-- RANK: Assigns ranks to rows with identical values and leaves gaps in the ranking for ties.
-- DENSE RANK: Assigns ranks to rows with identical values but does not leave gaps for ties.

-- +-------+---------+------+------------+------------------------------------------------------------------+
-- | Marks | ROW NUM | Rank | Dense Rank | Explanation
--                         |
-- +-------+---------+------+------------+------------------------------------------------------------------+
-- |    10 |       1 |    1 |          1 | First occurrence of 10, so ROW NUM = 1, Rank = 1, Dense Rank = 1 |
-- |    10 |       2 |    1 |          1 | Same marks as the previous row, so same rank and dense rank      |
-- |    20 |       3 |    3 |          2 | New marks, so ROW NUM = 3, Rank = 3 (skipping 2), Dense Rank = 2 |
-- |    30 |       4 |    4 |          3 | New marks, so ROW NUM = 4, Rank = 4, Dense Rank = 3              |
-- |    30 |       5 |    4 |          3 | Same marks as the previous row, same rank and dense rank         |
-- |    40 |       6 |    6 |          4 | New marks, so ROW NUM = 6, Rank = 6, Dense Rank = 4              |
-- |    40 |       7 |    6 |          4 | Same marks as the previous row, same rank and dense rank         |
-- |    50 |       8 |    8 |          5 | New marks, so ROW NUM = 8, Rank = 8, Dense Rank = 5              |
-- |    50 |       9 |    8 |          5 | Same marks as the previous row, same rank and dense rank         |
-- |    50 |      10 |    8 |          5 | Same marks as the previous row, same rank and dense rank         |
-- |    60 |      11 |   11 |          6 | New marks, so ROW NUM = 11, Rank = 11, Dense Rank = 6            |
-- |    70 |      12 |   12 |          7 | New marks, so ROW NUM = 12, Rank = 12, Dense Rank = 7            |
-- +-------+---------+------+------------+------------------------------------------------------------------+



-- A window function in MySQL is a function that performs a calculation
-- across a set of table rows that are related to current row

-- table for rank, denserank, rank_number
-- ================================================

CREATE TABLE student(
id INT PRIMARY KEY AUTO_INCREMENT,marks int);

INSERT INTO student (marks) VALUES (10),(10),
(20),(30),(30),(40),(40),(50),(50),(50),(60),(70);

 select * from student;
 
 
 -- Query for row number
-- =======================


SELECT id,marks,ROW_NUMBER()
OVER (ORDER BY MARKS) as ROWNUM FROM student;

-- Explaination:
-- ROW_NUMBER(): This function assigns a unique number to each row, 
-- starting from 1 and incrementing by 1 for every subsequent row.

-- OVER (ORDER BY Marks): The rows are ordered by the Marks column in ascending order. 
-- The row number is then assigned based on this ordering.

-- Query for rank:
-- ====================


SELECT id,marks,RANK() OVER (ORDER BY marks) as rank1
FROM student;

-- RANK(): This function assigns a rank to each row based on the Marks. 
-- If two or more students have the same marks, they get the same rank.

-- OVER (ORDER BY Marks): The rows are ordered by the Marks column in ascending order. 
-- The rank is then assigned based on this ordering.

-- Result: If students have the same Marks, they will share the same rank, 
-- but the next rank will skip numbers. 
-- For example, if two students are tied at rank 1, the next rank will be 3, not 2.


-- Query for dense_rank
-- ====================

SELECT id,marks,DENSE_RANK() OVER (ORDER BY MARKS) AS DENSERANK1
FROM student;

-- DENSE_RANK(): Similar to RANK(), this function assigns a rank to each row based on the Marks. 
-- However, unlike RANK(), it does not leave gaps in the ranking after ties.

-- OVER (ORDER BY Marks): The rows are ordered by the Marks column, 
-- and dense ranks are assigned based on this order.
-- Result: If students have the same Marks, they get the same rank, but the next rank will be consecutive. 

-- For example, if two students are tied at rank 1, the next rank will be 2 (not 3, as it would be with RANK()).



/*
===============================================================================
                    

TOPICS COVERED:
1. Window Functions with PARTITION BY
2. ROW_NUMBER()
3. RANK()
4. DENSE_RANK()
5. LAG()
6. LEAD()
7. FIRST_VALUE()
8. PARTITION BY vs GROUP BY
9. LIMIT and OFFSET
10. Finding Nth most expensive products
11. Fetching a middle range of records
12. MySQL Indexes
13. Primary Key Index
14. Unique Index
15. Column / Standard Index
16. SHOW INDEX
17. EXPLAIN
18. DROP INDEX

===============================================================================
*/


/*
===============================================================================
1. WINDOW FUNCTIONS WITH PARTITION BY
===============================================================================

A window function performs a calculation across a set of related rows
without combining those rows into a single row.

PARTITION BY divides the result into groups.

Example:
If we use PARTITION BY class, each class is treated as a separate group.

Unlike GROUP BY, window functions do NOT remove individual rows.

General syntax:

FUNCTION() OVER (
    PARTITION BY column
    ORDER BY column
);

===============================================================================
*/


/*
-------------------------------------------------------------------------------
CREATE STUDENTS TABLE
-------------------------------------------------------------------------------
*/

DROP TABLE IF EXISTS students;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    class VARCHAR(10),
    age INT,
    score INT
);


/*
-------------------------------------------------------------------------------
INSERT SAMPLE STUDENT DATA
-------------------------------------------------------------------------------
*/

INSERT INTO students (student_id, name, class, age, score) VALUES
(1, 'Aarav', 'A', 17, 90),
(2, 'Ishaan', 'A', 16, 85),
(3, 'Ananya', 'B', 17, 85),
(4, 'Arjun', 'B', 16, 80),
(5, 'Diya', 'A', 17, 75),
(6, 'Rohan', 'B', 16, 70),
(7, 'Kavya', 'A', 15, 95),
(8, 'Gopal', 'B', 15, 60),
(9, 'Meera', 'A', 17, 82),
(10, 'Rajesh', 'B', 16, 78),
(11, 'Priya', 'A', 15, 88),
(12, 'Tara', 'A', 17, 75),
(13, 'Lakshmi', 'B', 17, 85);


/*
-------------------------------------------------------------------------------
VIEW STUDENTS
-------------------------------------------------------------------------------
*/

SELECT * 
FROM students;


/*
===============================================================================
2. ROW_NUMBER()
===============================================================================

ROW_NUMBER() gives every row a unique sequential number.

PARTITION BY class:
    Restart numbering for every class.

ORDER BY score DESC:
    Highest score gets number 1.

Important:
Even if two students have the same score, ROW_NUMBER() gives them
different numbers.

===============================================================================
*/

SELECT
    student_id,
    name,
    class,
    age,
    score,
    ROW_NUMBER() OVER (
        PARTITION BY class
        ORDER BY score DESC
    )  FROM students;


/*
===============================================================================
3. RANK()
===============================================================================

RANK() assigns the same rank to tied values.

If two students are ranked 2nd, the next student gets rank 4.

Example:

Score     Rank
95        1
90        2
90        2
85        4

Therefore, RANK() leaves gaps after ties.

===============================================================================
*/

SELECT
    student_id,
    name,
    class,
    age,
    score,
    RANK() OVER (
        PARTITION BY class
        ORDER BY score DESC
    ) AS rank_number
FROM students;


/*
===============================================================================
4. DENSE_RANK()
===============================================================================

DENSE_RANK() also gives the same rank to tied values.

But unlike RANK(), it does NOT skip the next rank.

Example:

Score     Dense Rank
95        1
90        2
90        2
85        3

===============================================================================
*/

SELECT
    student_id,
    name,
    class,
    age,
    score,
    DENSE_RANK() OVER (
        PARTITION BY class
        ORDER BY score DESC
    ) AS dense_rank_number
FROM students;


/*
===============================================================================
RANK() vs DENSE_RANK() vs ROW_NUMBER()

ROW_NUMBER():
    Always gives a unique number.

RANK():
    Ties get the same rank.
    Gaps appear after ties.

DENSE_RANK():
    Ties get the same rank.
    No gaps appear after ties.

===============================================================================
*/


/*
===============================================================================
5. LAG()
===============================================================================

LAG() allows us to access a value from a previous row.

Here:
    We compare each student's score with the previous student's score
    within the same class.

===============================================================================
*/

SELECT
    student_id,
    name,
    class,
    age,
    score,
    LAG(score) OVER (
        PARTITION BY class
        ORDER BY score DESC
    ) AS previous_score
FROM students;


/*
===============================================================================
6. LEAD()
===============================================================================

LEAD() allows us to access a value from the next row.

Here:
    We compare each student's score with the next student's score
    within the same class.

===============================================================================
*/

SELECT
    student_id,
    name,
    class,
    age,
    score,
    LEAD(score) OVER (
        PARTITION BY class
        ORDER BY score DESC
    ) AS next_score
FROM students;


/*
===============================================================================
7. FIRST_VALUE()
===============================================================================

FIRST_VALUE() returns the first value in the window.

Since we order score in DESCENDING order,
the first score is the highest score.

Therefore this query shows the highest score for every student
within their class.

===============================================================================
*/

SELECT
    student_id,
    name,
    class,
    age,
    score,
    FIRST_VALUE(score) OVER (
        PARTITION BY class
        ORDER BY score DESC
    ) AS highest_score
FROM students;


/*
===============================================================================
8. PARTITION BY WITH AGGREGATE FUNCTIONS
===============================================================================

Window functions can also use aggregate functions.

For example:

SUM() OVER()
AVG() OVER()
COUNT() OVER()
MAX() OVER()
MIN() OVER()

The important difference is that the rows are NOT collapsed.

===============================================================================
*/


/*
-------------------------------------------------------------------------------
EXAMPLE:
Suppose we have an employee table:

SELECT name, department, salary,
       SUM(salary) OVER (PARTITION BY department) AS dept_total
FROM employee;

This would show the total department salary on every employee row.

===============================================================================
*/


/*
===============================================================================
9. WHEN SHOULD WE USE PARTITION BY?
===============================================================================

PARTITION BY is useful when:

1. You need ranking:
       ROW_NUMBER()
       RANK()
       DENSE_RANK()

2. You want running totals.

3. You need group totals while preserving individual rows.

4. You need group averages/max/min while preserving individual rows.

5. You are creating analytical reports.

6. You are working with detailed reporting data.

General idea:

Aggregate Function + PARTITION BY
            =
       Window Function

Window functions allow aggregation/analysis without collapsing rows.

===============================================================================
*/


/*
===============================================================================
10. GROUP BY VS PARTITION BY
===============================================================================

GROUP BY
--------

GROUP BY is an SQL clause.

It is commonly used with:

SUM()
AVG()
COUNT()
MAX()
MIN()

GROUP BY combines rows into groups.

Therefore:
    Number of output rows is reduced.
    Individual row-level details are generally lost.

Example:

SELECT
    department,
    AVG(salary)
FROM employee
GROUP BY department;


PARTITION BY
------------

PARTITION BY is used inside a window function's OVER() clause.

It does NOT reduce the number of rows.

All original rows remain available.

Example:

SELECT
    name,
    department,
    salary,
    AVG(salary) OVER (
        PARTITION BY department
    ) AS department_average
FROM employee;


KEY DIFFERENCE:

GROUP BY:
    Groups and collapses rows.

PARTITION BY:
    Groups rows for calculation but keeps every row.

===============================================================================
*/


/*
===============================================================================
11. LIMIT AND OFFSET
===============================================================================

LIMIT:
    Controls how many rows are returned.

OFFSET:
    Controls how many rows are skipped before returning results.

Syntax:

SELECT column_name(s)
FROM table_name
LIMIT number OFFSET offset;


Example:

LIMIT 2 OFFSET 4

Meaning:

    Skip the first 4 rows.
    Return the next 2 rows.

This is commonly used for pagination.

===============================================================================
*/


/*
===============================================================================
12. CREATE PRODUCTS TABLE
===============================================================================
*/

DROP TABLE IF EXISTS products;

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    productname VARCHAR(100),
    unitprice DECIMAL(10, 2)
);


/*
-------------------------------------------------------------------------------
INSERT PRODUCT DATA
-------------------------------------------------------------------------------
*/

INSERT INTO products (productname, unitprice) VALUES
('Basmati Rice', 120.50),
('Darjeeling Tea', 250.00),
('Alphonso Mango', 350.00),
('Coconut Oil', 180.00),
('Saffron', 1500.00),
('Masoor Dal', 70.00),
('Chilli Powder', 95.00),
('Turmeric Powder', 85.00),
('Mustard Oil', 160.00),
('Cashew Nuts', 800.00),
('Cardamom', 950.00),
('Wheat Flour', 50.00);


/*
-------------------------------------------------------------------------------
VIEW ALL PRODUCTS
-------------------------------------------------------------------------------
*/

SELECT *
FROM products;


/*
===============================================================================
13. SIXTH, SEVENTH AND EIGHTH MOST EXPENSIVE PRODUCTS
===============================================================================

We first sort products by price in DESCENDING order.

DESC = highest to lowest.

Then:

OFFSET 5
    Skip the first 5 products.

LIMIT 3
    Return the next 3 products.

Therefore:
    6th
    7th
    8th

most expensive products are returned.

IMPORTANT:

ORDER BY is logically applied before LIMIT/OFFSET for this query.

===============================================================================
*/

SELECT
    productname,
    unitprice
FROM products
ORDER BY unitprice DESC
LIMIT 3 OFFSET 5;


/*
===============================================================================
14. THIRD MOST EXPENSIVE PRODUCT
===============================================================================

We need the 3rd position.

OFFSET:
    0 = 1st row
    1 = 2nd row
    2 = 3rd row

Therefore:

LIMIT 1 OFFSET 2

===============================================================================
*/

SELECT *
FROM products
ORDER BY unitprice DESC
LIMIT 1 OFFSET 2;


/*
===============================================================================
15. MIDDLE RANGE OF PRODUCTS
===============================================================================

Question:

Fetch products from position 7 to position 10,
sorted alphabetically by product name.

IMPORTANT:

If we need positions:

7, 8, 9, 10

that is 4 rows.

Therefore, the direct query should use:

LIMIT 4 OFFSET 6

Why OFFSET 6?

Because:
    Position 1 -> OFFSET 0
    Position 2 -> OFFSET 1
    Position 3 -> OFFSET 2
    ...
    Position 7 -> OFFSET 6

===============================================================================
*/

SELECT
    productname,
    unitprice
FROM products
ORDER BY productname ASC
LIMIT 4 OFFSET 6;


/*
===============================================================================
16. LIMIT + OFFSET PAGINATION EXAMPLE
===============================================================================

Suppose a website displays 5 products per page.

PAGE 1:
    LIMIT 5 OFFSET 0

PAGE 2:
    LIMIT 5 OFFSET 5

PAGE 3:
    LIMIT 5 OFFSET 10

PAGE 4:
    LIMIT 5 OFFSET 15

General formula:

OFFSET = (page_number - 1) * records_per_page

===============================================================================
*/


/*
===============================================================================
17. MYSQL INDEXES
===============================================================================

An INDEX is a data structure used by MySQL to improve data retrieval.

Think of an index like the index of a book.

Without an index:
    MySQL may need to scan many/all rows.

With an appropriate index:
    MySQL can locate matching data more efficiently.

Indexes are especially useful for large tables.

Indexes can improve:
    - Searching
    - Filtering
    - Sorting
    - Data retrieval

However, indexes also have a cost:
    - They require additional storage.
    - INSERT/UPDATE/DELETE operations may require index maintenance.

===============================================================================
*/


/*
===============================================================================
18. PRIMARY KEY INDEX
===============================================================================

When a PRIMARY KEY is defined,
MySQL automatically creates an index for the primary key.

Primary key:
    - Uniquely identifies a row.
    - Cannot contain NULL.
    - Values must be unique.

===============================================================================
*/

DROP TABLE IF EXISTS users_primary_key;

CREATE TABLE users_primary_key (
    id INT AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100),
    PRIMARY KEY (id)
);


/*
-------------------------------------------------------------------------------
VIEW INDEXES
-------------------------------------------------------------------------------
*/

SHOW INDEX FROM users_primary_key;


/*
===============================================================================
19. UNIQUE INDEX
===============================================================================

A UNIQUE INDEX prevents duplicate values in the indexed column(s).

Example:

CREATE UNIQUE INDEX idx_email
ON users(email);

After this:
    Two users cannot have the same email.

===============================================================================
*/


/*
-------------------------------------------------------------------------------
CREATE USERS TABLE
-------------------------------------------------------------------------------
*/

DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255)
);


/*
-------------------------------------------------------------------------------
VIEW CURRENT INDEXES
-------------------------------------------------------------------------------
*/

SHOW INDEX FROM users;


/*
-------------------------------------------------------------------------------
INSERT SAMPLE USERS
-------------------------------------------------------------------------------
*/

INSERT INTO users (name, email)
VALUES
('John Doe', 'john.doe@example.com'),
('Jane Smith', 'jane.smith@example.com');


/*
-------------------------------------------------------------------------------
VIEW USERS
-------------------------------------------------------------------------------
*/

SELECT *
FROM users;


/*
===============================================================================
CREATE UNIQUE INDEX ON EMAIL
===============================================================================

This ensures that email values cannot be duplicated.

===============================================================================
*/

CREATE UNIQUE INDEX idx_unique_email
ON users(email);


/*
-------------------------------------------------------------------------------
VIEW INDEXES AFTER CREATING UNIQUE INDEX
-------------------------------------------------------------------------------
*/

SHOW INDEX FROM users;


/*
-------------------------------------------------------------------------------
TEST UNIQUE CONSTRAINT
-------------------------------------------------------------------------------

The following query should FAIL because the email already exists.

Do NOT worry if MySQL displays an error here.
That error demonstrates that the unique index is working.

===============================================================================
*/

-- This should produce a duplicate-key error:
-- INSERT INTO users (name, email)
-- VALUES ('Another Jane', 'jane.smith@example.com');


/*
===============================================================================
20. UNIQUE CONSTRAINT DIRECTLY IN TABLE DEFINITION
===============================================================================

Instead of creating the unique index separately,
we can define UNIQUE while creating the table.

===============================================================================
*/

DROP TABLE IF EXISTS users_unique;

CREATE TABLE users_unique (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255) UNIQUE
);


/*
-------------------------------------------------------------------------------
VIEW INDEXES
-------------------------------------------------------------------------------
*/

SHOW INDEX FROM users_unique;


/*
===============================================================================
21. STANDARD / COLUMN INDEX
===============================================================================

A standard index can be created on a column to improve
search and lookup performance.

Syntax:

CREATE INDEX index_name
ON table_name(column_name);

===============================================================================
*/


/*
-------------------------------------------------------------------------------
CREATE PRODUCTS INDEX DEMO TABLE
-------------------------------------------------------------------------------
*/

DROP TABLE IF EXISTS products_index_demo;

CREATE TABLE products_index_demo (
    product_id INT AUTO_INCREMENT,
    name VARCHAR(255),
    price DECIMAL(10, 2),
    PRIMARY KEY (product_id)
);


/*
-------------------------------------------------------------------------------
INSERT SAMPLE DATA
-------------------------------------------------------------------------------
*/

INSERT INTO products_index_demo (name, price)
VALUES
('Laptop', 1200.00),
('Phone', 600.00);


/*
-------------------------------------------------------------------------------
CREATE STANDARD INDEX ON NAME
-------------------------------------------------------------------------------
*/

CREATE INDEX idx_product_name
ON products_index_demo(name);


/*
-------------------------------------------------------------------------------
VIEW INDEXES
-------------------------------------------------------------------------------
*/

SHOW INDEX FROM products_index_demo;


/*
===============================================================================
22. EXPLAIN
===============================================================================

EXPLAIN shows information about how MySQL plans to execute a query.

It is commonly used for understanding query performance.

===============================================================================
*/

EXPLAIN
SELECT *
FROM products_index_demo
WHERE name = 'Laptop';


/*
===============================================================================
23. DROP INDEX
===============================================================================

An index can be removed using DROP INDEX.

Syntax:

DROP INDEX index_name
ON table_name;

===============================================================================
*/


/*
-------------------------------------------------------------------------------
CREATE EXAMPLE TABLE
-------------------------------------------------------------------------------
*/

DROP TABLE IF EXISTS example;

CREATE TABLE example (
    id INT,
    name VARCHAR(255)
);


/*
-------------------------------------------------------------------------------
INSERT DATA
-------------------------------------------------------------------------------
*/

INSERT INTO example (id, name)
VALUES
(1, 'John'),
(2, 'Jane');


/*
-------------------------------------------------------------------------------
CREATE INDEX
-------------------------------------------------------------------------------
*/

CREATE INDEX idx_name
ON example(name);


/*
-------------------------------------------------------------------------------
VIEW INDEX
-------------------------------------------------------------------------------
*/

SHOW INDEX FROM example;


/*
-------------------------------------------------------------------------------
DROP INDEX
-------------------------------------------------------------------------------
*/

DROP INDEX idx_name
ON example;


/*
-------------------------------------------------------------------------------
VERIFY THAT THE INDEX HAS BEEN REMOVED
-------------------------------------------------------------------------------
*/

SHOW INDEX FROM example;


/*
===============================================================================
ALTERNATIVE SYNTAX FOR DROPPING AN INDEX
===============================================================================

The same index can also be removed using ALTER TABLE.

Syntax:

ALTER TABLE table_name
DROP INDEX index_name;

===============================================================================
*/


/*
NOTE:
The previous index was already dropped.

The following section recreates it only to demonstrate
the ALTER TABLE DROP INDEX syntax.
*/

CREATE INDEX idx_name
ON example(name);

SHOW INDEX FROM example;


/*
-------------------------------------------------------------------------------
DROP INDEX USING ALTER TABLE
-------------------------------------------------------------------------------
*/

ALTER TABLE example
DROP INDEX idx_name;


/*
-------------------------------------------------------------------------------
VERIFY AGAIN
-------------------------------------------------------------------------------
*/

SHOW INDEX FROM example;


/*
===============================================================================
FINAL QUICK REVISION
===============================================================================

WINDOW FUNCTIONS
----------------

ROW_NUMBER()
    Unique sequential number.

RANK()
    Same rank for ties + gaps.

DENSE_RANK()
    Same rank for ties + no gaps.

LAG()
    Access previous row.

LEAD()
    Access next row.

FIRST_VALUE()
    Get the first value in the window.


PARTITION BY
------------

Used inside:

OVER (PARTITION BY ...)

It divides rows into groups for window-function calculations
without removing individual rows.


GROUP BY
--------

Groups rows and reduces the number of output rows.


LIMIT
-----

Controls how many rows are returned.


OFFSET
------

Skips a specific number of rows before returning results.


INDEX
-----

Improves data retrieval performance.

PRIMARY KEY INDEX
    Automatically created for a primary key.

UNIQUE INDEX
    Prevents duplicate values.

STANDARD/COLUMN INDEX
    Improves searches/lookups on a column.


EXPLAIN
-------

Shows how MySQL plans to execute a query.


DROP INDEX
----------

Removes an index.

Syntax:

DROP INDEX index_name ON table_name;

OR:

ALTER TABLE table_name
DROP INDEX index_name;


===============================================================================
END OF TODAY'S SQL PRACTICE
===============================================================================
*/