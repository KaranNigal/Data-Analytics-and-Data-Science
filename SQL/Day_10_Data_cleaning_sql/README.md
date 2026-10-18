# Day 10 - SQL Data Cleaning

This repository contains my **Day 10 SQL practice**, focused on **data cleaning and preprocessing using MySQL**.

The practice uses an `Employee_Data` table containing intentionally messy data such as:

- `NULL` values
- Duplicate records
- Inconsistent text formatting
- Extra spaces
- Empty strings
- Invalid values
- Inconsistent city names
- Date values requiring transformation

The main objective is to understand how SQL can be used to clean, transform, standardize, and prepare raw data for analysis.

---

## 📌 Topics Covered

1. Handling Missing Values (`NULL`)
2. Removing Duplicate Records
3. Standardizing Text Values
4. Removing Extra Spaces
5. Replacing Incorrect Values
6. Handling Empty Strings
7. Handling Invalid Values
8. Date Transformation
9. Creating Derived Columns
10. Final Data Cleaning Query

---

## 🗄️ Database and Table

The database used for this practice is:

```sql
CREATE DATABASE day10_sql;

USE day10_sql;
```

The main table is:

```text
Employee_Data
```

### Table Structure

| Column | Data Type | Description |
|---|---|---|
| `emp_id` | INT | Employee ID |
| `emp_name` | VARCHAR(50) | Employee name |
| `city` | VARCHAR(50) | Employee city |
| `age` | INT | Employee age |
| `salary` | DECIMAL(10,2) | Employee salary |
| `department` | VARCHAR(50) | Employee department |
| `email` | VARCHAR(100) | Employee email |
| `join_date` | DATE | Employee joining date |

---

# 1. Handling Missing Values

The dataset contains missing values represented using `NULL`.

## Find NULL Values

```sql
SELECT *
FROM Employee_Data
WHERE emp_name IS NULL
   OR city IS NULL
   OR age IS NULL
   OR salary IS NULL
   OR department IS NULL;
```

This query returns records where at least one of the specified columns contains a `NULL` value.

## Fix NULL Values

```sql
SET SQL_SAFE_UPDATES = 0;

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
```

These queries replace missing values with default values.

---

# 2. Removing Duplicate Records

Duplicate records can cause incorrect results during analysis.

## Find Duplicate Records

```sql
SELECT emp_name, COUNT(*) AS Total_Count
FROM Employee_Data
GROUP BY emp_name
HAVING COUNT(*) > 1;
```

This identifies employee names that appear more than once in the table.

## Remove Duplicate Records

```sql
DELETE e1
FROM Employee_Data e1
JOIN Employee_Data e2
ON e1.emp_id > e2.emp_id
AND e1.emp_name = e2.emp_name;
```

This removes duplicate employee records and keeps the record with the smaller `emp_id`.

---

# 3. Handling Invalid Email Values

The dataset contains empty email values and the string `'NULL'`.

```sql
UPDATE Employee_Data
SET email = 'unknown'
WHERE email = '' OR email = 'NULL';
```

This replaces empty email values and the text `'NULL'` with `unknown`.

---

# 4. Standardizing Text Values

Text data can have inconsistent capitalization.

For example:

```text
PUNE
pune
Pune
```

These values represent the same city but are stored in different formats.

## Convert to Uppercase

```sql
SELECT UPPER(city)
FROM Employee_Data;
```

`UPPER()` converts all characters in the column to uppercase.

## Standardize City Names

```sql
UPDATE Employee_Data
SET city = 'Pune'
WHERE city IN ('PUNE','pune');
```

This converts different representations of Pune into a single standardized format.

## Convert to Lowercase

```sql
SELECT LOWER(city)
FROM Employee_Data;
```

`LOWER()` converts all characters in the column to lowercase.

---

# 5. Removing Extra Spaces

Some employee names contain unnecessary leading and trailing spaces.

For example:

```text
' Amit Sharma '
```

## Check Extra Spaces

```sql
SELECT
    emp_name,
    TRIM(emp_name) AS Clean_Name
FROM Employee_Data;
```

## Remove Extra Spaces Permanently

```sql
UPDATE Employee_Data
SET emp_name = TRIM(emp_name);
```

`TRIM()` removes leading and trailing spaces from text values.

---

# 6. Replacing Incorrect Values

Inconsistent city values can be identified and standardized.

## Find Incorrect Values

```sql
SELECT *
FROM Employee_Data
WHERE city IN ('PUNE','pune');
```

This query finds inconsistent city values.

## Replace Incorrect Values

```sql
UPDATE Employee_Data
SET city = 'Pune'
WHERE city IN ('PUNE','pune');
```

This standardizes the city names.

---

# 7. Handling Empty Strings

An empty string (`''`) is different from SQL `NULL`.

## Find Empty Email Values

```sql
SELECT *
FROM Employee_Data
WHERE email = '';
```

This returns records where the email field is empty.

## Replace Empty String with NULL

```sql
UPDATE Employee_Data
SET email = NULL
WHERE email = '';
```

This converts empty strings into proper SQL `NULL` values.

---

# 8. Handling Invalid Values

The dataset contains invalid values such as:

```text
age = 0
salary = 0
```

These values can represent invalid or missing information.

## Find Invalid Age

```sql
SELECT *
FROM Employee_Data
WHERE age = 0;
```

This identifies records where the age contains an invalid value.

## Fix Invalid Age

```sql
UPDATE Employee_Data
SET age = NULL
WHERE age = 0;
```

This converts the invalid age value into `NULL`.

---

## Find Invalid Salary

```sql
SELECT *
FROM Employee_Data
WHERE salary = 0;
```

This identifies records where salary contains an invalid value.

## Fix Invalid Salary

```sql
UPDATE Employee_Data
SET salary = NULL
WHERE salary = 0;
```

This converts the invalid salary value into `NULL`.

---

# 9. Date Transformation

The `join_date` column contains employee joining dates.

MySQL date functions can be used to extract useful information from these dates.

## Extract Year

```sql
SELECT
    YEAR(join_date) AS Joining_Year
FROM Employee_Data;
```

`YEAR()` extracts the year from a date value.

## Extract Month

```sql
SELECT
    MONTH(join_date) AS Joining_Month
FROM Employee_Data;
```

`MONTH()` extracts the month number from a date value.

## Extract Month Name

```sql
SELECT
    MONTHNAME(join_date) AS Month_Name
FROM Employee_Data;
```

`MONTHNAME()` returns the month name from a date value.

---

# 10. Creating Derived Columns

SQL can be used to create calculated columns without permanently modifying the original table.

## Create Bonus Column

```sql
SELECT
    emp_name,
    salary,
    salary + 5000 AS Bonus
FROM Employee_Data;
```

This creates a calculated `Bonus` column by adding `5000` to the salary.

---

## Salary Category

```sql
SELECT
    emp_name,
    salary,
    CASE
        WHEN salary > 50000 THEN 'High Salary'
        ELSE 'Normal Salary'
    END AS Salary_Category
FROM Employee_Data;
```

`CASE` is used to create categories based on conditions.

It works similarly to `IF-ELSE` logic in programming.

---

# 11. Final Data Cleaning Query

The final query combines multiple data-cleaning techniques into a single query.

```sql
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
```

This final query combines:

- Removing extra spaces
- Handling `NULL` employee names
- Standardizing city names
- Handling invalid age values
- Handling invalid salary values
- Handling missing departments
- Handling empty email values
- Extracting joining year
- Extracting joining month

---

# 🧠 SQL Functions and Concepts Learned

| Function / Concept | Purpose |
|---|---|
| `IS NULL` | Finds missing values |
| `COALESCE()` | Replaces `NULL` with another value |
| `NULLIF()` | Converts a specified value into `NULL` |
| `TRIM()` | Removes leading and trailing spaces |
| `UPPER()` | Converts text to uppercase |
| `LOWER()` | Converts text to lowercase |
| `YEAR()` | Extracts year from a date |
| `MONTH()` | Extracts month number from a date |
| `MONTHNAME()` | Extracts month name from a date |
| `CASE` | Creates conditional categories |
| `GROUP BY` | Groups records |
| `HAVING` | Filters grouped results |
| `JOIN` | Combines related records |
| `UPDATE` | Modifies existing records |
| `DELETE` | Removes records |
| `SELECT` | Retrieves data |

---

# 🔍 Data Cleaning Techniques Practiced

## Missing Values

```text
NULL
```

Handled using:

```sql
IS NULL
COALESCE()
UPDATE
```

## Duplicate Records

Detected using:

```sql
GROUP BY
HAVING COUNT(*) > 1
```

Removed using:

```sql
DELETE
JOIN
```

## Inconsistent Text

Examples:

```text
PUNE
pune
Pune
```

Standardized using:

```sql
UPPER()
LOWER()
UPDATE
```

## Extra Spaces

Example:

```text
' Amit Sharma '
```

Cleaned using:

```sql
TRIM()
```

## Empty Strings

Example:

```text
''
```

Handled using:

```sql
UPDATE
NULL
```

## Invalid Numeric Values

Examples:

```text
age = 0
salary = 0
```

Converted to `NULL` using:

```sql
UPDATE
```

## Date Transformation

Extracted:

```text
Joining Year
Joining Month
Month Name
```

Using:

```sql
YEAR()
MONTH()
MONTHNAME()
```

---

# 🛠️ Technologies Used

- MySQL
- SQL
- MySQL Command Line Client

---

# 📂 File Structure

```text
Day10_SQL/
│
├── Day10_data_cleaning.sql
└── README.md
```

---

# 🎯 Objective

The objective of this practice was to understand the fundamentals of **SQL-based data cleaning** and learn how raw, inconsistent, and incomplete data can be transformed into a cleaner and more structured format.

---

# 📈 Learning Outcome

After completing this practice, I learned how SQL can be used as a **data preprocessing and cleaning tool** before performing:

- Data Analysis
- Reporting
- Data Visualization
- Business Intelligence
- Data Science
- Machine Learning

This practice helped me understand how to identify and handle common data-quality issues using SQL.

---

# 👨‍💻 Daily SQL Practice

**Day 10 - SQL Data Cleaning ✅**

This is part of my daily SQL learning and GitHub practice journey.