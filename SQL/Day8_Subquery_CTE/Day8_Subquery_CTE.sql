-- day 8 of daily sql learning 

create  database day8_sql;

use day8_sql;

-- subquery:
-- ----------------

-- Subquery - nested select statement can write to fetch multiple records
-- from multiple tables.
-- or
-- A subquery is a SELECT statement written inside another SQL query.
-- It is used to fetch data that will be used by the outer query.

-- types subquery :
-- 1.single row - here uses 1 table ,
-- inner query  returns single row to outer query.
-- operators - relational operators uses in this types

CREATE TABLE DEPT
       (DEPTNO int PRIMARY KEY,
	DNAME VARCHAR(14),
	LOC VARCHAR(13) ) ;


CREATE TABLE EMP
       (EMPNO int,
	ENAME VARCHAR(10),
	JOB VARCHAR(9),
	MGR int(4),
	HIREDATE DATE,
	SAL decimal(7,2),
	COMM int,
	DEPTNO int,
        primary key(EMPNO),
        FOREIGN KEY (DEPTNO) REFERENCES DEPT(DEPTNO)
       );

INSERT INTO DEPT VALUES(10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES(20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES(30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES(40,'OPERATIONS','BOSTON');
commit;


INSERT INTO EMP VALUES(7369,'SMITH','CLERK',7902,'1980-12-17',800,NULL,20);
INSERT INTO EMP VALUES(7499,'ALLEN','SALESMAN',7698,'1981-2-20',1600,300,30);
INSERT INTO EMP VALUES(7521,'WARD','SALESMAN',7698,'1981-2-22',1250,500,30);
INSERT INTO EMP VALUES(7566,'JONES','MANAGER',7839,'1981-2-4',2975,NULL,20);
INSERT INTO EMP 
VALUES(7654,'MARTIN','SALESMAN',7698,'1981-9-21',1250,1400,30);
INSERT INTO EMP VALUES(7698,'BLAKE','MANAGER',7839,'1981-5-1',2850,NULL,30);
INSERT INTO EMP VALUES(7782,'CLARK','MANAGER',7839,'1981-9-6',2450,NULL,10);
INSERT INTO EMP VALUES(7788,'SCOTT','ANALYST',7566,'1987-7-13',3000,NULL,20);
INSERT INTO EMP 
VALUES(7839,'KING','PRESIDENT',NULL,'1981-11-17',5000,NULL,10);
INSERT INTO EMP VALUES(7844,'TURNER','SALESMAN',7698,'1981-9-8',1500,500,30);
INSERT INTO EMP VALUES(7876,'ADAMS','CLERK',7788,'1987-7-13',1100,NULL,20);
INSERT INTO EMP VALUES(7900,'JAMES','CLERK',7698,'1981-12-3',950,NULL,30);
INSERT INTO EMP VALUES(7902,'FORD','ANALYST',7566,'1981-3-12',3000,NULL,20);
INSERT INTO EMP VALUES(7934,'MILLER','CLERK',7782,'1982-1-23',1300,NULL,10);
commit;

CREATE TABLE salgrade (
  grade int,
  losal int,
  hisal int
);

INSERT INTO salgrade VALUES (1, 700, 1200);
INSERT INTO salgrade VALUES (2, 1201, 1400);
INSERT INTO salgrade VALUES (3, 1401, 2000);
INSERT INTO salgrade VALUES (4, 2001, 3000);
INSERT INTO salgrade VALUES (5, 3001, 9999);
COMMIT;

-- 1.display all emp name who reporting into BLAKE.

select ename from emp
where mgr=(select empno from emp where ename='BLAKE');

-- 2.Display emp details who are working in Chicago.

select * from emp
where deptno=(select deptno from dept where loc='Chicago');

-- 3.Display all emp whose salary is less than avg salary.

select * from emp
where sal<(select avg(sal) from emp);

-- 4.List the employee details whose salary is greater than the
--  lowest salary of an employee belonging to deptno 20.

select * from emp 
where sal> (select min(sal) from emp group by deptno having deptno=20);


-- 2.multirow - 1 or more tables.
-- ================================
-- inner query  returns multiple row to outer query.
-- operators use - in ,any ,all

-- 1.display emp details who are working in accounting and sales
--  departments.

select empno,ename,sal,deptno from emp
where deptno in(select deptno from dept 
                where dname in('accounting','sales'));
                
-- 2.display the emp details who are getting max salary in 
-- each department.

select * from emp where sal in (select max(sal) from emp group by deptno);

-- 3.list all employee names who have atleast one person reporting 
-- to them.

select ename from emp
where empno in(select mgr from emp);

-- or

select distinct(a.ename) from emp a ,emp b
 where a.empno=b.mgr;
 
-- 4.find out the names of emp who have receive salary less 
-- than every average salary for each type of job.

select empno,ename,job,sal from emp
where sal <all(select avg(sal) from emp group by job);

-- Operator	Meaning
-- ANY	   Condition true for at least one value
-- ALL	   Condition true for all values

-- 5.find out the names of emp who have receive salary less 
-- than either of average salary for each type of job.

select empno,ename,job,sal from emp
where sal <any(select avg(sal)from emp group by job);

-- Common Table Expressions (CTE)

-- Common Table Expressions (CTE) Common Table Expressions (CTEs) are temporary result sets that simplify complex queries by making them more readable and reusable. A CTE is defined using the WITH clause, followed by the CTE name and query definition. 

CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    department_id INT,
    salary INT
);

INSERT INTO Employee VALUES
(1, 'Emma', 2, 80000),
(2, 'Alice', 1, 65000),
(3, 'John', 1, 50000),
(4, 'Mike', 2, 45000),
(5, 'Sara', 2, 70000);

select * from employee;


-- syntax:
-- WITH CTE_Name AS 
-- (     SELECT column1, column2      
-- FROM Table_Name     
-- WHERE condition ) 
-- SELECT * FROM CTE_Name; 

-- Q:
-- Write a SQL query to find the employees who earn more than the average salary of all employees.
-- Use a Common Table Expression (CTE) to filter the employee records where the salary is greater than the overall average salary, and then display their first name, department ID, and salary.

with  cte1 as (select * from employee where salary> (select avg(salary) from employee))
select * from cte1;


-- Combining CTEs with Window Functions and Subqueries CTEs can be combined with window functions 
-- and subqueries to perform aggregations, rankings, and advanced filtering. 

-- Example: Assign Rank to Employees Based on Salary Within Departments
-- --------------------------------------------------------------------------
-- Write a SQL query to find the highest-paid employee(s) in each department.
-- Use a Common Table Expression (CTE) and the RANK() window function to assign salary ranks within each department, and return only those employees who are ranked 1 (i.e., highest salary in their department).

WITH Salary_Rank AS (     
SELECT *,            
RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS Rank1     
FROM Employee ) 
SELECT * FROM Salary_Rank WHERE Rank1 =1; 

-- Subquery Within CTE to Find Employees Working in Active Projects
-- ----------------------------------------------------------------------

CREATE TABLE Employee_Project (
    project_id INT,
    employee_id INT,
    assigned_date DATE
);

INSERT INTO Employee_Project VALUES
(101, 1, '2023-05-01'),
(102, 3, '2022-12-20'),
(103, 2, '2023-02-10');

-- Write a SQL query to display the names of employees who are working on active projects, where a project is considered active if it was assigned after January 1, 2023.
-- Use a Common Table Expression (CTE) to first select the relevant employee IDs from the Employee_Project table, and then fetch their first names from the Employee table.

WITH Active_Projects AS (     
SELECT employee_id     
FROM Employee_Project     
WHERE assigned_date > '2023-01-01' ) 
SELECT first_name FROM Employee WHERE employee_id IN (SELECT employee_id FROM Active_Projects); 
