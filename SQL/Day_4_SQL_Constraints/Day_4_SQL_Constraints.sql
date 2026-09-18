create database day4_sql;

use day4_sql;

CREATE TABLE employee (
id INT,
name VARCHAR(25),
salary INT
);

INSERT INTO employee VALUES
(101,'amit',25000),
(102,'ramani',30000),
(103,'hitesh',5000000),
(105,'jatin',33000),
(106,'nikhat',500000),
(107,'nikhil',77000);


-- Where Clause for select
-- =================
-- --use for select Specific row based on some condition
-- --it allows you to select rows that meet specific criteria
-- --where clause is not specific to SELECT.
-- we can use it with UPADTE,DELETE and many more



SELECT * FROM employee; -- all records shown

SELECT * FROM employee WHERE salary >= 500000; -- to show records above specific salary

SELECT * FROM employee WHERE name = 'amit'; -- records for specific name 

SELECT * FROM employee WHERE name <> 'amit'; -- records that dont contain a specific name 

SELECT * FROM employee WHERE salary between 20000 and 50000; -- between for a range search 

select * from employee where name in ('amit','ramani','nikhil'); -- searches records for name in the given tuple 



-- Operators Allowed in the WHERE Clause
-- With the WHERE clause, the following operators can be used:
-- Operator Description
-- =          Equal
-- <>         Not equal
-- >          Greater than
-- <          Less than
-- >=         Greater than or equal
-- <=         Less than or equal
-- BETWEEN    Between an inclusive range
-- LIKE       Search for a pattern
-- IN         If you know the exact value you want to     return for at least one of the columns

-- Note: In some versions of SQL the <> operator may be written as !=

-- like operator used for pattern matching 

select * from employee where name like '%t'; -- ends in t 

select * from employee where name like '%i_'; -- second last is i

select * from employee where name like 'n%'; -- starts with n


-- order by to sort the data by salary

select * from employee order by salary asc; -- ascending order

select * from employee order by salary desc; -- descending order 


-- orderby one name column

select * from employee order by name asc;

select * from employee order by name desc;


-- SQL CONSTRAINTS

-- Constraints are rules used to limit the type of data that can be stored in a table.
-- They help maintain data integrity and accuracy.

-- Constraints can be defined:

-- While creating a table (CREATE TABLE)

-- After creating a table (ALTER TABLE)

-- Common SQL Constraints:
-- NOT NULL
-- UNIQUE
-- PRIMARY KEY
-- FOREIGN KEY
-- CHECK
-- DEFAULT


-- keys:
-- ---------
-- in SQL , keys are used to identify records within a table and establish relationships betn tables. They play a crucial role in maintaining data integrity and optimising database performance



-- SQL UNIQUE key Constraint
-- -------------------------------

-- The UNIQUE constraint ensures that all values in a column (or combination of columns) are unique.

-- Important points:

-- A table can have multiple UNIQUE constraints.
-- UNIQUE and PRIMARY KEY both ensure uniqueness.
-- PRIMARY KEY automatically implies UNIQUE.
-- In MySQL, UNIQUE columns can contain Multiple NULL values.


create table persons(
	p_id int not null unique,
    name varchar(50) unique,
    lastname varchar(50),
    city varchar(50)
);

insert into persons values (1,'amit','yadav','pune');

insert into persons values (2,'amit','yadav','pune'); -- unique error

insert into persons values (2,'amita','yadav','pune');

select * from persons;


-- to add unique constraint later using alter table

CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    PhoneNumber VARCHAR(15),
    PRIMARY KEY (EmployeeID)
);

ALTER TABLE Employees ADD UNIQUE (PhoneNumber);

desc Employees;

-- to drop  the unique constraint for a column 

alter table employees drop index phonenumber;  

desc employees;



-- Primary Key:

-- --A Primary Key is a unique identifier for a record in a database table.
-- --It ensures that each record within the table can be uniquely distinguished from others.
-- --No two rows can have the same Primary Key value.
-- --A Primary Key value cannot be NULL.
-- --It is essential for the relational model of databases.
-- --Each table can have only one Primary Key.
-- --The Primary Key can consist of a single column or a combination of multiple columns.

-- SQL PRIMARY KEY Constraint on CREATE 

create table persons1(
	p_id int primary key,
    last_name varchar(255) not null,
    first_name varchar(255),
    address varchar(255),
    city varchar(255)
);

insert into persons1 value(1,'patil','sunil','nashik','nashik');

-- insert into persons1 value(1,'patil','sunita','nashik','nashik'); error unique

-- insert into persons1 value(null,'patil','sunil','nashik','nashik'); error null



-- to create a table without primary key constraint and to add it later using alter 

create table workers(
	pid int,
    name varchar(50),
    city varchar(50)
);

desc workers;


-- ading pk constraint later 

alter table workers add primary key (pid);

desc workers;

-- to drop the pk cosntraint using alter and drop

alter table  workers drop primary key;

desc workers;


-- A Composite Key (also known as a Compound Key) is a type of Primary Key that consists of two or more columns. 
-- This type of key is useful when no single column is unique by itself within the table, 
-- but the combination of multiple columns ensures uniqueness.

create table bookauthors(
	bookid int,
    authorid int,
    role varchar(100),
    primary key(bookid, authorid)  -- here compund key is declared 
);

desc bookauthors;



-- Natural Keys:
-- -------------
-- A Natural Key is a type of key in a database table that is derived from real-world, meaningful attributes. It is a column or a set of columns that uniquely identify rows in the table based on their logical relationship to the data they represent.

-- Here are examples of Natural Keys:

-- Social Security Number (SSN) in a table of citizens – A unique identifier that is meaningful and directly tied to a real-world attribute.
-- Email Address in a table of users – Uniquely identifies each user and is logically related to the user.
-- Vehicle Identification Number (VIN) in a table of vehicles – A unique, real-world identifier assigned to each vehicle.



-- Surrogate Key (or Synthetic Key):
-- =====================================

-- A Surrogate Key is an artificial, system-generated unique identifier for a record in a table.
-- It often takes the form of:
-- --An auto-incremented number.
-- --A globally unique identifier (GUID).
-- Surrogate Keys are used when:
-- --A Natural Key is not available.
-- --A Natural Key is not suitable for some reason.



-- FOREIGN KEY CONSTRAINT:
-- =============================


-- Foreign Key:
-- ============

-- 1.A Foreign Key is a column or a set of columns in a table used to establish and enforce a link between the data in two tables.
-- 2.It creates a relationship between the tables, ensuring that rows in one table correspond to rows in another.
-- 3.The table containing the Foreign Key is called the child table.
-- 4.The table containing the referenced key is called the referenced table or parent table.
-- 5.The Foreign Key in the child table generally references a Primary Key in the parent table.
-- 6.A Foreign Key can also reference a Unique Key in the parent table.

-- A foreign key of Column in a table which is primary key in another table

-- 1) Uesd to link two or more tables
-- 2) There are lots of benefits


CREATE TABLE university(
    id INT PRIMARY KEY,
    university VARCHAR(40));
    
INSERT INTO university VALUES (1,'pune'),
	(2,'mumbai'),
    (3,'delhi'),
    (4,'madras');
    

CREATE TABLE student2(
	seat_number INT PRIMARY KEY,
    name VARCHAR(40) NOT NULL,
    university_id INT NOT NULL,
    subject VARCHAR(30) NOT NULL,
    foreign key (university_id) references university(id)
    );
    
desc student2;


-- to drop the fk constraint

alter table student2 drop constraint student2_ibfk_1;

desc student2;


-- to add foreign key constraint using alter 

alter table student2 add constraint fk1 foreign key(university_id) references university(id);

desc student2;



-- Check Constrained
-- =========================

-- SQL CHECK Constraint
--  The CHECK constraint is used to limit the value range that can be placed in a column.
--  If you define a CHECK constraint on a single column it allows only certain values for this
-- column.
--  If you define a CHECK constraint on a table it can limit the values in certain columns based on
-- values in other columns in the row.

-- SQL CHECK Constraint on CREATE TABLE
-- The following SQL creates a CHECK constraint on the "P_Id" column when the "Persons" table is
-- created. The CHECK constraint specifies that the column "P_Id" must only include integers greater than
-- 0.
    

CREATE TABLE Persons2
(
    P_Id int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255),
    CHECK (P_Id > 0)
);

-- Insert data with all fields provided
INSERT INTO Persons2 (P_Id, LastName, FirstName, Address, City)
VALUES (1, 'Doe', 'John', '123 Main St', 'New York');

-- Insert data without FirstName and Address (optional fields)
INSERT INTO Persons2 (P_Id, LastName, City)
VALUES (2, 'Smith', 'San Francisco');

-- Insert data with only required fields (P_Id and LastName)
INSERT INTO Persons2 (P_Id, LastName)
VALUES (3, 'Brown');

-- Insert data againts check constraint
INSERT INTO Persons2 (P_Id, LastName)
VALUES (-2, 'Brown'); -- eror returned


-- To allow naming of a CHECK constraint, and for defining a CHECK constraint on multiple columns, use
-- the following SQL syntax:
-- MySQL / SQL Server / Oracle / MS Access:

CREATE TABLE Person
(
P_Id int NOT NULL,
LastName varchar(255) NOT NULL,
FirstName varchar(255),
Address varchar(255),
City varchar(255),
CONSTRAINT chk_Person CHECK (P_Id>0 AND City='Sandnes')
)

-- SQL CHECK Constraint on ALTER TABLE
-- ==========================================
-- To create a CHECK constraint on the "P_Id" column when the table is already created, use the following
-- SQL:

Alter table Person ADD CHECK (P_Id>10);

-- To allow naming of a CHECK constraint, and for defining a CHECK constraint on multiple columns, use
-- the following SQL syntax:

ALTER TABLE Person
ADD CONSTRAINT chk_Person CHECK (P_Id>0 AND City='Sandnes');

-- To DROP a CHECK Constraint
-- ------------------------------
-- To drop a CHECK constraint, use the following SQL:
-- SQL Server / Oracle / MS Access:

ALTER TABLE Person
DROP CONSTRAINT chk_Person;