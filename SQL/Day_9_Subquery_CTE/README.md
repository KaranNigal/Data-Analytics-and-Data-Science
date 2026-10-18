# 📚 Day 8 — SQL Learning & Practice

Welcome to **Day 8** of my daily SQL learning journey.

Today I focused on **Subqueries, Multi-row Subqueries, Common Table Expressions (CTEs), Window Functions, and combining these concepts for advanced data filtering and analysis.**

---

## 🎯 Topics Covered

* Subqueries
* Single-row subqueries
* Multi-row subqueries
* `IN` operator
* `ANY` operator
* `ALL` operator
* Aggregate functions inside subqueries
* Self-referencing queries
* Common Table Expressions (CTEs)
* `WITH` clause
* CTE with subqueries
* CTE with Window Functions
* `RANK()` Window Function
* `PARTITION BY`
* `ORDER BY` inside Window Functions
* Foreign Keys and table relationships

---

## 🗄️ Database Setup

Created a practice database:

```sql
CREATE DATABASE day8_sql;
USE day8_sql;
```

### Tables Created

#### 1. `DEPT`

Stores department information.

| Column   | Description                 |
| -------- | --------------------------- |
| `DEPTNO` | Department ID / Primary Key |
| `DNAME`  | Department Name             |
| `LOC`    | Department Location         |

#### 2. `EMP`

Stores employee information.

| Column     | Description                 |
| ---------- | --------------------------- |
| `EMPNO`    | Employee ID / Primary Key   |
| `ENAME`    | Employee Name               |
| `JOB`      | Job Role                    |
| `MGR`      | Manager Employee ID         |
| `HIREDATE` | Hiring Date                 |
| `SAL`      | Salary                      |
| `COMM`     | Commission                  |
| `DEPTNO`   | Department ID / Foreign Key |

#### 3. `SALGRADE`

Stores salary grade ranges.

| Column  | Description    |
| ------- | -------------- |
| `GRADE` | Salary Grade   |
| `LOSAL` | Minimum Salary |
| `HISAL` | Maximum Salary |

#### 4. `Employee`

A separate practice table used for CTE and Window Function examples.

| Column          | Description     |
| --------------- | --------------- |
| `employee_id`   | Employee ID     |
| `first_name`    | Employee Name   |
| `department_id` | Department ID   |
| `salary`        | Employee Salary |

#### 5. `Employee_Project`

Used to practice CTEs with project assignments.

---

# 🔎 1. Subqueries

A **subquery** is a `SELECT` statement written inside another SQL query.

The inner query executes first and provides a result that is used by the outer query.

### Example

Find employees reporting to **BLAKE**:

```sql
SELECT ename
FROM emp
WHERE mgr = (
    SELECT empno
    FROM emp
    WHERE ename = 'BLAKE'
);
```

The inner query finds BLAKE's employee number, which is then used by the outer query to find his employees.

---

# 👤 2. Finding Employees by Department Location

Find employees working in **Chicago**:

```sql
SELECT *
FROM emp
WHERE deptno = (
    SELECT deptno
    FROM dept
    WHERE loc = 'Chicago'
);
```

This demonstrates using a subquery to retrieve a department ID from another table.

---

# 📊 3. Comparing Salary with Average Salary

Find employees whose salary is below the overall average salary:

```sql
SELECT *
FROM emp
WHERE sal < (
    SELECT AVG(sal)
    FROM emp
);
```

This combines:

* Aggregate function: `AVG()`
* Subquery
* Comparison operator

---

# 💰 4. Comparing Salary with Department Salary

Find employees whose salary is greater than the lowest salary in department 20:

```sql
SELECT *
FROM emp
WHERE sal > (
    SELECT MIN(sal)
    FROM emp
    GROUP BY deptno
    HAVING deptno = 20
);
```

---

# 🔢 5. Multi-row Subqueries

A **multi-row subquery** returns more than one value.

Common operators used with multi-row subqueries:

```text
IN
ANY
ALL
```

---

## `IN` Operator

Find employees working in **Accounting or Sales**:

```sql
SELECT empno, ename, sal, deptno
FROM emp
WHERE deptno IN (
    SELECT deptno
    FROM dept
    WHERE dname IN ('accounting', 'sales')
);
```

The subquery returns multiple department IDs, so `IN` is used.

---

# 🏆 6. Maximum Salary in Each Department

```sql
SELECT *
FROM emp
WHERE sal IN (
    SELECT MAX(sal)
    FROM emp
    GROUP BY deptno
);
```

The inner query calculates the maximum salary for each department.

---

# 👨‍💼 7. Employees Who Have Subordinates

Find employees who have at least one person reporting to them:

```sql
SELECT ename
FROM emp
WHERE empno IN (
    SELECT mgr
    FROM emp
);
```

This is an example of a **self-referencing subquery**, where the same table is used in both the outer and inner query.

Alternative approach using a self join:

```sql
SELECT DISTINCT a.ename
FROM emp a, emp b
WHERE a.empno = b.mgr;
```

---

# ⚖️ 8. `ALL` Operator

Find employees whose salary is less than **every average salary calculated for each job type**:

```sql
SELECT empno, ename, job, sal
FROM emp
WHERE sal < ALL (
    SELECT AVG(sal)
    FROM emp
    GROUP BY job
);
```

### `ALL`

The condition must be true for **every value** returned by the subquery.

---

# 🔀 9. `ANY` Operator

Find employees whose salary is less than **at least one** of the average salaries for different job types:

```sql
SELECT empno, ename, job, sal
FROM emp
WHERE sal < ANY (
    SELECT AVG(sal)
    FROM emp
    GROUP BY job
);
```

### Difference

| Operator | Meaning                                       |
| -------- | --------------------------------------------- |
| `ANY`    | Condition must be true for at least one value |
| `ALL`    | Condition must be true for every value        |

---

# 🧩 10. Common Table Expressions (CTEs)

A **Common Table Expression (CTE)** creates a temporary named result set that can be referenced by the main query.

Basic syntax:

```sql
WITH CTE_Name AS (
    SELECT column1, column2
    FROM Table_Name
    WHERE condition
)
SELECT *
FROM CTE_Name;
```

CTEs make complex SQL queries easier to read and organize.

---

# 📈 11. CTE with Average Salary

Find employees earning more than the overall average salary:

```sql
WITH cte1 AS (
    SELECT *
    FROM employee
    WHERE salary > (
        SELECT AVG(salary)
        FROM employee
    )
)
SELECT *
FROM cte1;
```

This combines:

```text
CTE
 ↓
Subquery
 ↓
AVG()
 ↓
Filtering
```

---

# 🥇 12. CTE + Window Function + Ranking

Find the highest-paid employee(s) in each department:

```sql
WITH Salary_Rank AS (
    SELECT *,
           RANK() OVER (
               PARTITION BY department_id
               ORDER BY salary DESC
           ) AS Rank1
    FROM Employee
)
SELECT *
FROM Salary_Rank
WHERE Rank1 = 1;
```

### Concepts used

* `WITH`
* CTE
* `RANK()`
* `OVER()`
* `PARTITION BY`
* `ORDER BY`
* Filtering ranked results

### How it works

```text
Employee Data
      ↓
Partition by Department
      ↓
Sort Salary DESC
      ↓
Assign RANK()
      ↓
Keep Rank = 1
      ↓
Highest-paid employee(s)
```

Using `RANK()` also means that if multiple employees have the same highest salary, they can all receive rank `1`.

---

# 🚀 13. CTE + Subquery for Active Projects

Created an `Employee_Project` table to track project assignments.

An active project is defined as a project assigned after:

```text
January 1, 2023
```

Query:

```sql
WITH Active_Projects AS (
    SELECT employee_id
    FROM Employee_Project
    WHERE assigned_date > '2023-01-01'
)
SELECT first_name
FROM Employee
WHERE employee_id IN (
    SELECT employee_id
    FROM Active_Projects
);
```

This combines:

```text
CTE
 +
Subquery
 +
IN
 +
Date filtering
```

---

# 🧠 Key Learnings

### Subquery

A query inside another query.

```sql
SELECT *
FROM Employee
WHERE salary > (
    SELECT AVG(salary)
    FROM Employee
);
```

### CTE

A named temporary result set created using `WITH`.

```sql
WITH temp AS (
    SELECT *
    FROM Employee
)
SELECT *
FROM temp;
```

### `IN`

Checks whether a value exists in a list of values.

### `ANY`

Condition needs to be true for at least one value.

### `ALL`

Condition needs to be true for every value.

### `RANK()`

Assigns a ranking to rows based on a specified ordering.

### `PARTITION BY`

Divides the data into groups before applying a window function.

---

## 📌 Day 8 Summary

Today I practiced moving beyond basic SQL queries and learned how to use **subqueries and CTEs for more complex data analysis**.

The main focus was understanding how SQL can:

* Compare values against aggregated results
* Work with multiple rows returned by subqueries
* Find department-wise maximum salaries
* Identify managers and employees
* Filter data using `ANY` and `ALL`
* Build reusable query blocks using CTEs
* Combine CTEs with Window Functions
* Rank employees within departments
* Combine CTEs, subqueries, and date filtering

---

## 🛠️ SQL Concepts Practiced

```text
CREATE DATABASE
CREATE TABLE
PRIMARY KEY
FOREIGN KEY
INSERT
SELECT
WHERE
GROUP BY
HAVING
AVG()
MIN()
MAX()
IN
ANY
ALL
Subqueries
CTEs
WITH
RANK()
OVER()
PARTITION BY
ORDER BY
Self-referencing queries
```

---

## 📅 Learning Progress

**Day 8 / Daily SQL Learning Journey**

> Consistency over intensity — learning SQL one day and one concept at a time. 🚀

#SQL #MySQL #DataAnalytics #DataEngineering #LearningSQL #100DaysOfCode #SQLPractice #GitHub
