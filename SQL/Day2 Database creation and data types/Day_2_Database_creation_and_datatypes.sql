-- ACID property explained atomicity, consistency, isolation, durability
-- types of queries explained
-- DDL data definition language CREATE, ALTER, DROP, TRUNCATE
-- DML data manipulation language insert, update, delete
-- DQL data query language SELECT
-- TCL transaction control language COMMIT, ROLLBACK, SAVEPOINT
-- DCL data control language GRANT, REVOKE

-- comments in sql
/* this is 
for multiline comment*/

# this is for single line comment

-- this is also for single line comment

-- data  types in sql are mainly numeric, character, date and time 
-- numeric 1.integer datatype - smallint, medint, int, bigint
-- numeric 2.Fixed point datatype - decimal(7,2)

create database d2_1b24;
drop database d2_1b24;
use d2b24;
create table Indian_Data(
id int unsigned auto_increment primary key,
state_code tinyint unsigned,
population bigint unsigned,
literacy_rate float(5,2),
area_in_km double(10,2),
is_union_teritory bool
);

insert into Indian_Data (state_code, population, literacy_rate, area_in_km, is_union_teritory)
values
(1,23124356,72.36,342239.45,False),
(2,12345678,86.54,564387.40,False),
(3,7895356,90.01,409867.56,False),
(4,7890123,67.89,786959.34,False);

select * from Indian_Data;

update Indian_data 
set is_union_teritory= true
where id in (2,4);

select* from Indian_Data;

-- String data type
-- 1. CHAR fix length , max upto 255, causes blank spaces or clipping of data
-- 2. VARCHAR variable length, stores only required memory, more efficient
-- 3. TEXT to store large string or paragraph, max 65,535 characters

-- Binary datatype - BLOB 

-- ENUM datatype - stores one value only from predefined list 
-- example table for char, varchar, enum

create table products(
productcode char(50),
productname varchar(100),
description varchar(255),
color enum('red','blue','white')
);

insert into products values
('P01','apple','fresh and juicy','red'),
('p02','banana','sweet and delicious','blue'),
('p03','carrot','crunchy and healthy','white');

insert into products value('p04','carrot','crunchy and healthy','pink'); # this will return error bcz of enum doesnot allow values outside the list

select * from products;