create database day3_sql;

use day3_sql;

-- data type to show date,  time, timestamps
--  current_timestamp shows current time while insertion
create table movies(
	movieid int  auto_increment primary key,
    moviename varchar(100),
    showdatetime datetime,
    releaseyear year(4),
    lastupdated timestamp default current_timestamp
);

insert into movies(moviename, showdatetime,releaseyear)
values
('The Great Movie', '2023-08-10 20:00:00', 2023),
('Another Great Movie', '2023-08-11 18:00:00', 2023),
('Old Classic', '2023-08-11 16:00:00', 1990),
('Interesting Documentary', '2023-08-12 15:00:00', 2022),
('Kids Movie', '2023-08-12 14:00:00', 2023);

select * from movies;

desc movies;

-- auto increment 
-- AUTO_INCREMENT is used in MySQL to automatically generate a unique number for a column when a new row is inserted.

-- 1. Primary Key
-- Use AUTO_INCREMENT when you need a unique identifier for each row, which is commonly used as a primary key.
-- Each new record automatically gets a unique ID.

-- 2. Avoid Manual ID Management
-- It removes the need to manually assign IDs and helps prevent duplicate or incorrect values.

-- 3. Reference Integrity
-- AUTO_INCREMENT is often used with foreign keys.
-- Other tables can reference this primary key to create relationships between tables.

-- 4. Sequential Data
-- If you want IDs to increase in order (1, 2, 3, ...), AUTO_INCREMENT is useful.
-- Note: The sequence may not be continuous if rows are deleted or inserts fail.

-- 5. Important Note
-- When inserting data into a table, you can skip the AUTO_INCREMENT column, and MySQL will automatically assign a value to it.
-- Auto Increment
-- demo of auto increment 
CREATE TABLE persons
(p_id INT auto_increment primary key, surname VARCHAR(25), firstname VARCHAR(25), city VARCHAR(25));

insert into persons (surname, firstname, city) values
('kapoor','karan','chandigarh'),
('niraj','shevade','wai'),
('sharma','kapil','amritsar');

select * from persons;

-- to apply auto inncrement to start from custom id, here the next record will start from 101
alter table persons auto_increment=101;  

INSERT INTO persons (surname, firstname, city)
VALUES 
('yadav','nilesh','pune'),
('sonar','suraj','wai'),
('patil','priya','satara'),
('shinde','runal','mumbai'),
('roy','shreya','lucknow');

select * from persons;

-- to declare a table and also mention custom auto increment
CREATE TABLE persons1
(p_id INT primary key auto_increment, surname VARCHAR(25), firstname VARCHAR(25), city VARCHAR(25))auto_increment=101;

INSERT INTO persons1 (surname, firstname, city)
VALUES 
('yadav','nilesh','pune'),
('sonar','suraj','wai'),
('patil','priya','satara'),
('shinde','runal','mumbai'),
('roy','shreya','lucknow');

desc persons1;

select * from persons1;

-- default constraint
-- Default Value (DEFAULT)

-- In MySQL, the DEFAULT keyword is used to set a default value for a column.
-- When inserting a new record into a table, if no value is provided for this column, MySQL automatically uses the default value.

-- Why Use DEFAULT?

-- 1. Ease of Data Entry
-- Often, many rows share the same value for a column.
-- Instead of entering the same value repeatedly, you can define a default value.

-- 2. Ensures Data Consistency
-- For some columns, you may want to ensure that a value is always present.
-- Using DEFAULT helps maintain consistency without relying on application logic or manual data entry.
-- here if you dont specify a value for country when inserting a new employee, MySQL will automatically set it to india
-- inserting data with default:
-- you can explicitly use the default keyword when inserting data if you want to ensure the default value is set.

create table employees(
	id int primary key,
    name varchar(100),
    country varchar(50) default 'india'
);

insert into employees (id, name) values (1,'maverick'),(2,'ironman'),(3,'thor');

select * from employees;

insert into employees (id, name, country) values (4,'dr. doom','us');

alter table employees 
modify country varchar(50) default 'Canada';

desc employees;

-- null and not null constraint
-- Null and not null:
-- ---------------------
-- not null:
-- not null constraint ensures that a column cannot have a null value.

-- null: it represents the absence of any value. its not even the empty string
-- or zero its just nothing.
create table student (
	id int primary key,
    name varchar(50) not null,
    age int
);

-- insert  into student values (101, null, 21); this will return error
insert  into student values (101, 'karan', null); 

desc student;

select * from student;

-- select statement 
-- The SQL SELECT Statement
--  The SELECT statement is used to select data from a database.
--  The result is stored in a result table, called the result-set.
--  SQL SELECT Syntax

CREATE TABLE students1 (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age INT
);

INSERT INTO students1 (id, name, age) VALUES (1, 'Rahul Sharma', 20);
INSERT INTO students1 (id, name, age) VALUES (2, 'Anjali Verma', 22);
INSERT INTO students1 (id, name, age) VALUES (3, 'Vikram Singh', 19);
INSERT INTO students1 (id, name, age) VALUES (4, 'Pooja Nair', 23);
INSERT INTO students1 (id, name, age) VALUES (5, 'Rohit Mehra', 21);

-- select to show all columns 
select * from students1;

-- select  to show a specific column
select name from students1;

-- select to show multiple specifc columns
select name, age from students1;

