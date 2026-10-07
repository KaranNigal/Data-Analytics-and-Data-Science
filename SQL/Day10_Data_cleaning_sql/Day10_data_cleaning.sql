create database day10_sql;

use day10_sql;

CREATE TABLE Employee_Data (
    emp_id INT,
    emp_name VARCHAR(50),
    city VARCHAR(50),
    age INT,
    salary DECIMAL(10,2),
    department VARCHAR(50),
    email VARCHAR(100),
    join_date DATE
);

INSERT INTO Employee_Data VALUES
(101,' Amit Sharma ','PUNE',25,45000,'IT','amit@gmail.com','2024-01-15'),
(102,'Priya Patil','Mumbai',NULL,52000,'HR','priya@gmail.com','2024-02-10'),
(103,'Rahul Patil','pune',28,NULL,'IT','rahul@gmail.com','2024-03-12'),
(104,'Sneha Joshi','Delhi',30,58000,NULL,'','2024-04-18'),
(105,NULL,NULL,26,49000,'Finance','sneha@gmail.com','2024-05-20'),
(106,'Rohit Kumar','Mumbai',0,60000,'IT','NULL','2024-06-15'),
(107,'Anjali Singh','Pune',29,0,'HR','anjali@gmail.com','2024-07-01'),
(108,' Amit Sharma ','PUNE',25,45000,'IT','amit@gmail.com','2024-01-15');

select * from employee_data;


-- 1. Handling Missing Values (NULL)

-- Find NULL Values

SELECT *
FROM Employee_Data
WHERE emp_name IS NULL
   OR city IS NULL
   OR age IS NULL
   OR salary IS NULL
   OR department IS NULL;
   
-- Explanation:
-- This query returns all rows where at least one of the specified columns contains a NULL value.

set sql_safe_updates =0;
-- Fix NULL Values

UPDATE Employee_Data
SET emp_name = 'Unknown'
WHERE emp_name IS NULL;

UPDATE Employee_Data
SET city = 'Unknown'
WHERE city IS NULL;

UPDATE Employee_Data
SET age = 0
WHERE age IS NULL;

UPDATE Employee_Data
SET salary = 0
WHERE salary IS NULL;

UPDATE Employee_Data
SET department = 'General'
WHERE department IS NULL;

-- Explanation:
-- These queries replace missing values with default values.

select * from employee_data;


-- 2. Removing Duplicate Records

-- Find Duplicate Records

SELECT emp_name, COUNT(*) AS Total_Count
FROM Employee_Data
GROUP BY emp_name
HAVING COUNT(*) > 1;

-- Explanation:
-- This query identifies employee names that appear more than once in the table.


-- Remove Duplicate Records

DELETE e1
FROM Employee_Data e1
JOIN Employee_Data e2
ON e1.emp_id > e2.emp_id
AND e1.emp_name = e2.emp_name;

-- Explanation:
-- This query removes duplicate employee records and keeps only one copy.

update employee_data 
set email='unknown'
where email=''or email='NULL';


select * from employee_data;



-- 3. Standardizing Text Values

-- Convert to Uppercase

SELECT UPPER(city)
FROM Employee_Data;

-- Explanation:
-- UPPER() converts all characters in the City column to uppercase.


-- Standardize City Names

UPDATE Employee_Data
SET city = 'Pune'
WHERE city IN ('PUNE','pune');

-- Explanation:
-- This query converts different formats of the same city into a single standard format.

-- Convert to Lowercase

SELECT LOWER(city)
FROM Employee_Data;

-- Explanation:
-- LOWER() converts all characters in the City column to lowercase.

select * from employee_data;


-- 4. Removing Extra Spaces

SELECT
emp_name,
TRIM(emp_name) AS Clean_Name
FROM Employee_Data;

-- Explanation:
-- TRIM() removes leading and trailing spaces from text values.


-- Remove Extra Spaces Permanently

UPDATE Employee_Data
SET emp_name = TRIM(emp_name);

-- Explanation:
-- This query permanently removes extra spaces from employee names.

select * from employee_data;

drop table EMPLOYEE_data;

CREATE TABLE Employee_Data (
    emp_id INT,
    emp_name VARCHAR(50),
    city VARCHAR(50),
    age INT,
    salary DECIMAL(10,2),
    department VARCHAR(50),
    email VARCHAR(100),
    join_date DATE
);



INSERT INTO Employee_Data VALUES
(101,' Amit Sharma ','PUNE',25,45000,'IT','amit@gmail.com','2024-01-15'),
(102,'Priya Patil','Mumbai',NULL,52000,'HR','priya@gmail.com','2024-02-10'),
(103,'Rahul Patil','pune',28,NULL,'IT','rahul@gmail.com','2024-03-12'),
(104,'Sneha Joshi','Delhi',30,58000,NULL,'','2024-04-18'),
(105,NULL,NULL,26,49000,'Finance','sneha@gmail.com','2024-05-20'),
(106,'Rohit Kumar','Mumbai',0,60000,'IT','NULL','2024-06-15'),
(107,'Anjali Singh','Pune',29,0,'HR','anjali@gmail.com','2024-07-01'),
(108,' Amit Sharma ','PUNE',25,45000,'IT','amit@gmail.com','2024-01-15');


-- 5. Replacing Incorrect Values

-- Find Incorrect Values

SELECT *
FROM Employee_Data
WHERE city IN ('PUNE','pune');

-- Explanation:
-- This query finds inconsistent city values.


-- Replace Incorrect Values

UPDATE Employee_Data
SET city = 'Pune'
WHERE city IN ('PUNE','pune');

-- Explanation:
-- This query standardizes city names by replacing inconsistent values

-- 6. Handling Empty Strings

-- Find Empty Email Values

SELECT *
FROM Employee_Data
WHERE email = '';

-- Explanation:
-- This query returns rows where the email field is empty.


-- Replace Empty String with NULL

UPDATE Employee_Data
SET email = NULL
WHERE email = '';

-- Explanation:
-- This query converts empty strings into NULL values.




-- 7. Handling Invalid Values

-- Find Invalid Age

SELECT *
FROM Employee_Data
WHERE age = 0;

-- Explanation:
-- This query identifies records where Age contains an invalid value.


-- Fix Invalid Age

UPDATE Employee_Data
SET age = NULL
WHERE age = 0;

-- Explanation:
-- This query converts invalid age values into NULL.


-- Find Invalid Salary

SELECT *
FROM Employee_Data
WHERE salary = 0;

-- Explanation:
-- This query identifies records where Salary contains an invalid value.


-- Fix Invalid Salary

UPDATE Employee_Data
SET salary = NULL
WHERE salary = 0;

-- Explanation:
-- This query converts invalid salary values into NULL.





-- 8. Date Transformation

-- Extract Year

SELECT
YEAR(join_date) AS Joining_Year
FROM Employee_Data;

-- Explanation:
-- YEAR() extracts the year from a date value.


-- Extract Month

SELECT
MONTH(join_date) AS Joining_Month
FROM Employee_Data;

-- Explanation:
-- MONTH() extracts the month number from a date value.


-- Extract Month Name

SELECT
MONTHNAME(join_date) AS Month_Name
FROM Employee_Data;

-- Explanation:
-- MONTHNAME() returns the month name from a date value.



-- 9. Creating Derived Columns

-- Create Bonus Column

SELECT
emp_name,
salary,
salary + 5000 AS Bonus
FROM Employee_Data;

-- Explanation:
-- This query creates a new column by adding 5000 to the Salary value.


-- Salary Category

SELECT
emp_name,
salary,
CASE
    WHEN salary > 50000 THEN 'High Salary'
    ELSE 'Normal Salary'
END AS Salary_Category
FROM Employee_Data;

-- Explanation:
-- CASE is used to create categories based on conditions, similar to IF-ELSE logic.



-- 10. Final Data Cleaning Query

SELECT
emp_id,
TRIM(COALESCE(emp_name,'Unknown')) AS Employee_Name,
UPPER(COALESCE(city,'Unknown')) AS City,
NULLIF(age,0) AS Age,
NULLIF(salary,0) AS Salary,
COALESCE(department,'General') AS Department,
NULLIF(email,'') AS Email,
YEAR(join_date) AS Joining_Year,
MONTHNAME(join_date) AS Joining_Month
FROM Employee_Data;

-- Explanation:
-- This query combines multiple data cleaning techniques such as handling NULL values, removing extra spaces, standardizing text, handling invalid values, and extracting date information to create a cleaned dataset.

