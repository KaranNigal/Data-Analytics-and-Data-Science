-- day 5 sql learning 

-- alter, delete, truncate, update

create database day5_sql;

use day5_sql;

-- The ALTER TABLE  is used to modify an existing table. 
-- It is a versatile command that allows a variety of modifications, 
-- including adding or dropping columns, changing data types, and creating or deleting indexes.

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100)
);

-- using alter to add a column in the table 

alter table products add column price int;

-- delete the price column 

alter table products drop column price;

-- to modify the data type and size of a column 

alter table products modify column productname char(50);

describe products;

-- Alter Table - Drop Primary Key
-- =================================

ALTER TABLE Products DROP PRIMARY KEY;

-- : If this primary key is referenced by a foreign key, drop the foreign key first.


-- Alter Table - add Primary Key
-- ==================================

ALTER TABLE Products add PRIMARY KEY (ProductID);

-- Alter Table - add unique constraint
-- ===================================

ALTER TABLE Products ADD UNIQUE (ProductName);

-- renaming column
-- ===============
ALTER TABLE Products CHANGE COLUMN ProductName NameOfProduct VARCHAR(150);

alter table products rename column nameofproduct to  productdesc;

-- rename the table name 

alter table products rename to products12;

alter table products12 rename to products;


-- Deleting Records (Rows) from Table

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    age INT
);

INSERT INTO students (student_id, first_name, last_name, age) VALUES 
(1, 'John', 'Doe', 20),
(2, 'Jane', 'Smith', 21),
(3, 'Robert', 'Brown', 22),
(4, 'Emily', 'Johnson', 19),
(5, 'Chris', 'Lee', 23);

select * from students;

-- delete the id 3

DELETE FROM students WHERE student_id = 3;

select * from students;

-- in case of safe update error

set SQL_SAFE_UPDATES = 0;

delete from students where first_name= 'John';

-- Delete The table Entirely(both table and structure)
-- ---------------------------

DROP TABLE students;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    age INT
);
INSERT INTO students (student_id, first_name, last_name, age) VALUES 
(1, 'John', 'Doe', 20),
(2, 'Jane', 'Smith', 21),
(3, 'Robert', 'Brown', 22),
(4, 'Emily', 'Johnson', 19),
(5, 'Chris', 'Lee', 23);

-- Truncate Table
-- Truncate Table: if you want to remove all records and reset auto increment value
-- -----------------

TRUNCATE TABLE students;

select * from students;


-- update statement
-- ===================

-- creating car table
-- -----------------------

-- Step 1: Create the table

CREATE TABLE Cars (
    CarID INT PRIMARY KEY,
    CarName VARCHAR(50),
    Price DECIMAL(10, 2),
    ManufacturerID INT
);

-- Step 2: Insert the data

INSERT INTO Cars (CarID, CarName, Price, ManufacturerID) VALUES
(1, 'C-Class', 40000, 105),
(2, 'Model S', 40000, 106),
(3, 'Elantra', 14000, 104),
(4, 'Truck', 100000, 106),
(5, 'Corolla', 25000, 101),
(6, 'Civic', 21000, 102),
(7, 'Vivo', 11000, 102),
(8, '4 Series', 30000, 103),
(9, '6 Series', 40000, 103),
(10, 'Odyssey', 30000, 102);

select * from cars;

-- creating manufacturer table
-- -----------------------------

CREATE TABLE Manufacturer (
    ManufacturerID INT PRIMARY KEY,
    ManufacturerName VARCHAR(50)
);

-- Step 2: Insert data into the Manufacturer table

INSERT INTO Manufacturer (ManufacturerID, ManufacturerName) VALUES
(101, 'Toyota'),
(102, 'Honda'),
(103, 'BMW'),
(104, 'Hyundai'),
(105, 'Mercedes'),
(106, 'Tesla');

select * from Manufacturer;

-- change price of a car elantra 

update cars set price = 16000 where carname ='elantra';

select * from cars;

-- to channge name of manufacturer

update manufacturer 
set manufacturername='hyudai'
where manufacturername= 'hyundai';

update manufacturer 
set manufacturername='kia'
where manufacturername= 'hyudai';

select * from manufacturer;


-- updating multiple Fields within single update

-- How do i update the model s by Tesla to have a new name model s
-- special edition and a new price of 35000 without using subquery

UPDATE Cars
SET CarName="Model S Special Edition",Price=35000
Where CarName = "Model S" and ManufacturerID=106;

select * from cars;

-- We need to increase the prices of tesla cars by 5000 due
-- to market changes how can we do that

UPDATE Cars
SET Price = Price + 5000
WHERE ManufacturerID = 106;

select * from cars;

-- The Civic Models by Honda are now called CIVIK 2024 and have a price increases of 2000 how can i update this directly

UPDATE Cars
SET CarName = 'CIVIK 2024', 
    Price = Price + 2000
WHERE CarName = 'Civic' AND ManufacturerID = 102;

select * from cars;

-- #Distinct keyword:
-- it eliminates duplicate records and only returns distinct(unique) values

--  Create the table

CREATE TABLE persons (
    p_id INT PRIMARY KEY,
    sirname VARCHAR(50),
    firstname VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO persons (p_id, sirname, firstname, city) VALUES
(1, 'yadav', 'nilesh', 'pune'),
(2, 'sonar', 'suraj', 'wai'),
(3, 'patil', 'priya', 'satara'),
(4, 'shinde', 'runal', 'mumbai'),
(5, 'roy', 'shreya', 'lakhnau'),
(105, 'yadav', 'nilesh', 'pune');

SELECT * FROM persons;

SELECT DISTINCT firstname from persons;


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
    
select * from product;

-- Sum(): Calculate the total of a numeric column

select sum(unitprice) as totalprice from product;


-- Count(): Count the number of rows in a column

SELECT COUNT(UnitPrice) AS TotalProducts FROM Product;


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

select * from cricketers;


-- Total Runs by Team
-- This query will group cricketers by their team and sum the total runs scored by each team:

select team, sum(runs_scored) as totalruns from cricketers group by team;


-- Write an SQL query to calculate the average runs scored by cricketers based on their role (e.g., Batsman, Bowler, All-rounder).

select role, avg(runs_scored) as avgruns from cricketers group by role;


-- How can you calculate the total wickets taken by cricketers, grouped by their respective teams?

SELECT team, SUM(wickets_taken) AS total_wickets FROM cricketers GROUP BY team;


