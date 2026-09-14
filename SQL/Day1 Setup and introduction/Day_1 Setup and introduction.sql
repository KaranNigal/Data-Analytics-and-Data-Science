--creating a data base with name 
create database d1b24;

-- to select our data base 
use d1b24;

-- create a table with feilds
create table student(id int, name varchar(50), marks int);
-- above st cant be run again hence no duplicate table name and data base name 

-- insert values into th created table
insert into student values(1, 'puja',67),(2,'rani',88),(3,'priya',46);

-- to see whole table 
select * from student;

create table employee(emp_id int, emp_name varchar(50), emp_salary int);

insert into employee values (101,'Karan',10000),(102,'Niraj',20000),(103,'Manish',30000);

select * from employee;