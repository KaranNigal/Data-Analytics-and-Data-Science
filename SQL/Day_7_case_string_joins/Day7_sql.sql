create database day7_sql;

-- day7
-- ============
-- case function:
-- --case is conditional logic
-- --it is similar to if-then-else statement
-- --we have two types of case statements
-- 1)simple case
-- 2)searched case

-- 1.the simple case:
-- on expression with multiple potential value

-- We use a Simple CASE when we want to compare one column with fixed values.

-- CASE columnname
-- WHEN VALUE THEN result1
-- when value2 then result2
-- ---
-- ---
-- else resultn
-- END

use day7_sql;

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    Destination VARCHAR(100),
    Price DECIMAL(10,2) 
);

INSERT INTO Orders (OrderID, Destination, Price) VALUES
(1, 'USA', 100.00),
(2, 'Canada', 200.00),
(3, 'Mexico', 150.00),
(4, 'UK', 250.00);

SELECT * FROM Orders;

-- example1:

-- GlobalShip Inc. handles international deliveries and wants to implement a standardized shipping rate system. Their pricing structure is:
-- USA: $20
-- Canada: $30
-- Mexico: $25
-- Rest of World: $40

-- The company database has an 'Orders' table:
-- - OrderID (int)
-- - Destination (varchar)
-- - Price (decimal)

-- Write a SQL query that will show each order with its corresponding shipping rate based on the destination country.

select  *, case destination
when 'usa' then 20
when 'canada' then 30
when 'mexico' then 25
else 40
end as shipping_rate
from orders;



-- 2.searched case:
-- evaluate multiple conditional statements
-- not based on a single expression

-- We use a Searched CASE when we need to check conditions using operators like:
-- >, <
-- BETWEEN
-- logical conditions

-- syntax:
-- CASE
-- WHEN condition1 THEN result1
-- WHEN condition2 THEN result2
-- ---
-- ---
-- else resultn
-- END
-- ---

-- Example:
-- Student Classification Based on Marks

-- Question:

-- You have a database of student marks. You need to classify the students based on their marks as follows:

-- 'Excellent' for marks above 80,
-- 'Good' for marks between 60 and 80,
-- 'Average' for marks between 40 and 60, and
-- 'Needs Improvement' for marks below 40.

CREATE TABLE Students (
    ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Marks INT
);

INSERT INTO Students (ID, Name, Marks) VALUES
(1, 'Alice', 85),
(2, 'Bob', 75),
(3, 'Charlie', 55),
(4, 'Diana', 30);

insert into students value (5,'maverick',60);

select * from students;

select *, case 
when marks> 80 then 'a'
when marks between 60 and 80 then 'b'
when marks between 40 and 60 then 'c'
else 'fail'
end as grade from students;


CREATE TABLE customers (
customer_id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
email VARCHAR(100),
phone_number VARCHAR(20),
username VARCHAR(50),
product_name VARCHAR(100)
);


INSERT INTO customers (customer_id, first_name, last_name, email, phone_number, username, product_name) VALUES

(1, 'John', 'Doe', 'john.doe@example.com', '123-456-7890', ' johndoe ', 'laptop'),

(2, 'Jane', 'Smith', 'jane.smith@example.com', '987-654-3210', ' janesmith ', 'smartphone'),

(3, 'Alice', 'Johnson', 'alice.johnson@longemaildomain.com', '555-123-4567', ' alicejohnson ', 'tablet'),

(4, 'Bob', 'Brown', 'bob.brown@example.com', '444-555-6666', ' bobbrown ', 'monitor');


select * from customers;


-- String functions

-- q.n If you want to convert product names to uppercase for a report , 
-- which function would you use?

select first_name, upper(first_name) as uppercase from customers;

select first_name, lower(first_name) as lowercase from customers;

-- q.n if you want to combine a customer's firstname and last name into one field, which function would you use?--concat

select first_name, last_name, concat(first_name, ' ' , last_name) as full_name from customers;

-- q.n if you want to extract the area code from aphone number, which function would you use?
-- --substring--part of string

select phone_number, substring(phone_number,1,3) as areacode from customers;

-- q.n:
-- if you want to remove extra spaces from the beginning and end of a username input, which function would you use?---TRIM()

select username , trim(username) as trim_name from customers;

-- q.n:
-- if you want to replace part of an email domain with new one, which function would you use?--replace function

select email, replace(email, 'example.com', 'gmail.com') as new_mail from customers;

-- q.n
-- if you want find position of '@' in an email, which function would you use
-- --instr()

select email, instr(email, '@') as position from customers;

-- qn if you want to reverse last name of a customer, which function would
-- you use;--reverse()

select first_name , reverse(first_name) as rev from customers;

-- q.n:
-- if you want to check if a customer's email start with 'alice',
-- which function would you use;  left

select  email, 
case 
when left(email, 5)= 'alice' then 'starts with alice'
else 'does not starts with alice' 
end as email_start_check
from customers;

-- Q>N:
-- if you want to check if a customer's phone number ends with '7890',
-- which function would you use?--right

select phone_number, case
when right(phone_number, 4)= '7890' then 'yes'
else 'no'
end  as phone_check
from customers; 

-- Q.n:
-- if you want to remove any specific character from username, which function would you use?-- replace()

select username,REPLACE(username,'a','z') from customers;

-- if you want to format the number with commas , like 1234567 to 1,234,567, which function would you use? --format()

select format(1234567,0) AS formatted_number;



-- What is a JOIN in SQL?

-- A JOIN is a SQL clause used to combine rows from two or more tables based on a related column between them.

-- Joins are used with the SELECT statement.
-- Tables are usually related using primary key and foreign key.
-- Joins help retrieve data from multiple tables in a single query.

-- Types of joins
-- ----------------
-- INNER JOIN
-- LEFT JOIN (LEFT OUTER JOIN)
-- RIGHT JOIN (RIGHT OUTER JOIN)
-- FULL JOIN (FULL OUTER JOIN – simulated in MySQL)
-- CROSS JOIN
-- NATURAL JOIN
-- SELF JOIN

CREATE TABLE t1(id INT,name1 VARCHAR(10));

insert INTO t1 values(1,'suraj'),
(2,'suresh'),
(3,'neeta'),
(4,'smita');

CREATE TABLE t2 (id int,name2 varchar(25));

insert into t2 values 
(4,"priya"),
(5,"shrishti"),
(6,"sarojani"),
(7,"sudesh"),
(1,"sudhanshu");

-- INNER JOIN 
-- ================

-- INNER JOIN

-- Definition:
-- An INNER JOIN returns only those rows where there is a matching value in both tables.
-- Rows without a match are not included.
-- INNER JOIN represents the intersection of two tables.

-- SQL INNER JOIN Syntax:

--  SELECT column_name(s)
--  FROM table_name1
--  INNER JOIN table_name2
--  ON table_name1.column_name=table_name2.column_name

select t1.id, t1.name1, t2.id, t2.name2 from t1 inner join t2 on t1.id=t2.id;

-- When we use SELECT * with a JOIN, and both tables contain columns with the same name (such as id and name), the result set will include duplicate column names.
-- This can create column ambiguity, especially when:
-- Writing complex queries
-- Filtering data using WHERE
-- Selecting specific columns
-- Working with application code (Python, Java, etc.)
-- Because the database cannot always clearly identify which table a column belongs to, this may lead to confusion or errors.

-- Best Practice: Use Table Aliases
-- To avoid column ambiguity, we should:
-- Use table aliases
-- Explicitly mention table alias with column names

-- SELECT a1.id, a1.name, a2.name
-- FROM t1 AS a1
-- INNER JOIN t2 AS a2
-- ON a1.id = a2.id;


-- SQL LEFT JOIN Keyword
-- =========================
-- Definition:
-- A LEFT JOIN returns all rows from the left table and matching rows from the right table.
-- If there is no match, NULL values are returned for columns from the right table.

-- Syntax:
-- SELECT column_name(s)
-- FROM table1
-- LEFT JOIN table2
-- ON table1.column = table2.column;

select * from t1 left join t2 on t1.id=t2.id;

-- RIGHT JOIN
-- ================
-- Definition:
-- A RIGHT JOIN returns all rows from the right table and matching rows from the left table.
-- If there is no match, NULL values are returned for columns from the left table.

-- Syntax:
-- SELECT column_name(s)
-- FROM table1
-- RIGHT JOIN table2
-- ON table1.column = table2.column;
--   PS: In some databases RIGHT JOIN is called RIGHT OUTER JOIN.

select * from t1 right join t2 on t1.id= t2.id;

-- SQL FULL JOIN 
-- ==============================
--  Definition:
-- A FULL JOIN returns all matching rows and all non-matching rows from both tables.

-- Important Note (MySQL):
-- MySQL does NOT support FULL OUTER JOIN directly.
-- It is implemented using LEFT JOIN and RIGHT JOIN with UNION.

select * from t1 left join t2 on t1.id=t2.id 
union
select * from t1 right join t2 on t1.id= t2.id;

-- CROSS JOIN:
-- ===================

-- Definition:
-- A CROSS JOIN produces a Cartesian product of two tables.
-- If table1 has X rows and table2 has Y rows, the result will contain X * Y rows.

-- Syntax:
-- SELECT *
-- FROM table1
-- CROSS JOIN table2;

-- Use Case:
-- Used when every row of one table needs to be combined with every row of another table

select * from t1 cross join t2;

-- NATURAL JOIN:
-- ===================

-- Definition:
-- A NATURAL JOIN automatically joins tables based on columns with the same name and compatible data types.
-- No ON condition is required.

-- Syntax:
-- SELECT column_name(s)
-- FROM table1
-- NATURAL JOIN table2;

-- Warning:
-- NATURAL JOIN is not recommended in real-world projects because the join condition is implicit and may cause unexpected results.

select * from t1 natural join t2;

