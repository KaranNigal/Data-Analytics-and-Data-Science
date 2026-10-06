create database day8_sql_1;

use day8_sql_1;

-- SQL self join
-- =======================
-- SELF JOIN

-- Definition:
-- A SELF JOIN is a join where a table is joined with itself.

-- Use Cases:
-- Employee and Manager relationship
-- Hierarchical data
-- Comparing rows within the same table

-- Important Rule:
-- Aliases are mandatory in SELF JOIN to distinguish between the same table used multiple times.

CREATE TABLE Employees (
    EmployeeID INT,
    Name VARCHAR(50),
    ManagerID INT
);

INSERT INTO Employees (EmployeeID, Name, ManagerID) VALUES
(1, 'Alice', NULL),
(2, 'Bob', 1),
(3, 'Charlie', 1),
(4, 'Diana', 2),
(5, 'Evan', 2);

select * from employees;

select e1.name as ename , e2.name as managername from employees as e1 left join employees as e2 on e1.managerid= e2.employeeid;



-- joining multiple tables
-- -----------------------

CREATE TABLE Employees1 (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50)
);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CompanyName VARCHAR(100)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    EmployeeID INT,
    CustomerID INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees1(EmployeeID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Employees
INSERT INTO Employees1 (EmployeeID, FirstName, LastName) VALUES
(1, 'Ravi', 'Kumar'),
(2, 'Anjali', 'Mehra'),
(3, 'Suresh', 'Patel');

-- Customers
INSERT INTO Customers (CustomerID, CompanyName) VALUES
(101, 'Tata Consultancy Services'),
(102, 'Infosys Technologies'),
(103, 'Wipro Limited');

-- Orders
INSERT INTO Orders (OrderID, EmployeeID, CustomerID) VALUES
(1001, 1, 101),
(1002, 2, 102),
(1003, 3, 103),
(1004, 1, 103),
(1005, 2, 101);

select 
orders.orderid,
employees1.firstname as empfirstname,
employees1.lastname as emplastname,
customers.companyname as company
from 
orders
join 
employees1 on orders.employeeid= employees1.employeeid
join 
customers on orders.customerid= customers.customerid;