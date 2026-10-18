# 📊 Day 1: Introduction to Excel & Data Analytics

> **Daily Learning Practice | Data Analytics Journey**

## 🎯 Learning Objectives

- Understand the fundamentals of Microsoft Excel.
- Learn about workbooks, worksheets, rows, columns, and cells.
- Practice basic Excel operations and formulas.
- Explore essential Excel functions.
- Understand the fundamentals of Data Analytics and its workflow.
- Practice sorting, filtering, formatting, and working with tabular data.

---

## 📚 Topics Covered

### 1. Introduction to Microsoft Excel

- What is Microsoft Excel?
- Understanding workbooks and worksheets.
- Rows, columns, cells, and cell references.
- Excel file extensions (`.xlsx`).
- Basic Excel interface and navigation.

### 2. Basic Excel Operations

- Cut, Copy, and Paste.
- Undo and Redo.
- Insert and Delete rows, columns, and cells.
- Cell formatting:
  - Font size and text color.
  - Background color.
  - Borders and cell styles.
- Cell alignment:
  - Left, Center, and Right.
  - Wrap Text.
  - Merge & Center.
- Sorting and Filtering.
- Fill Series.

### 3. Excel Formulas

Excel formulas perform calculations using values and cell references.

**Examples:**

```excel
=C19+D19
=C19*D20
=A2+B2
=A3*B3
=B2-C2
```

**Important operators:**

| Operator | Operation | Example |
|---|---|---|
| `+` | Addition | `=A1+B1` |
| `-` | Subtraction | `=A1-B1` |
| `*` | Multiplication | `=A1*B1` |
| `/` | Division | `=A1/B1` |

### 4. Essential Excel Functions

#### Aggregate Functions

| Function | Purpose | Example |
|---|---|---|
| `SUM()` | Calculates the total | `=SUM(A1:A10)` |
| `AVERAGE()` | Calculates the average of numeric values | `=AVERAGE(A1:A10)` |
| `MIN()` | Returns the minimum value | `=MIN(A1:A10)` |
| `MAX()` | Returns the maximum value | `=MAX(A1:A10)` |
| `COUNT()` | Counts cells containing numbers | `=COUNT(A1:A10)` |
| `COUNTA()` | Counts non-empty cells | `=COUNTA(A1:A10)` |

#### AVERAGE vs AVERAGEA

- `AVERAGE()` ignores text and calculates the average of numeric values.
- `AVERAGEA()` includes logical values and text in its calculation, treating text as zero in applicable cases.

### 5. Text Functions

| Function | Purpose | Example |
|---|---|---|
| `UPPER()` | Converts text to uppercase | `=UPPER(A3)` |
| `LOWER()` | Converts text to lowercase | `=LOWER(A3)` |
| `PROPER()` | Capitalizes the first letter of each word | `=PROPER(A3)` |
| `CONCAT()` | Combines text from multiple values | `=CONCAT(A3,B3)` |
| `TRIM()` | Removes extra spaces from text | `=TRIM(A29)` |
| `LEN()` | Returns the length of text | `=LEN(A1)` |

**Practical examples:**

```excel
=CONCAT(A3," ",B3)
=CONCAT(A3," and ",B4)
=CONCAT("The total stats of ",A4," are ",C4,".")
=TRIM(A29)
=LEN(A1)
```

### 6. Conditional Formatting

Conditional Formatting highlights cells according to specified rules.

Features explored:

- Highlight Cell Rules.
- Top/Bottom Rules.
- Data Bars.
- Color Scales.
- Icon Sets.

**Use case:** Highlighting high sales, low marks, duplicate values, or important business metrics.

### 7. Working with Tables and Data

- Creating Excel tables.
- Sorting and filtering table records.
- Using the Table Design tab.
- Applying table styles.
- Renaming and resizing tables.
- Removing duplicate records.
- Converting tables into ranges.
- Understanding slicers for interactive filtering.

### 8. Cell References

#### Relative References

Relative references change when a formula is copied to another cell.

**Example:**

```excel
=B9-C9
```

When copied down, the references adjust according to the new row.

#### Absolute References

Absolute references remain fixed when a formula is copied.

**Example:**

```excel
=B21/$B$20
```

The `$` symbol locks the column and row of the referenced cell.

**Common reference types:**

| Reference Type | Example | Behaviour |
|---|---|---|
| Relative | `A1` | Row and column can change |
| Absolute | `$A$1` | Row and column remain fixed |
| Mixed | `$A1` | Column remains fixed |
| Mixed | `A$1` | Row remains fixed |

### 9. Date and Time Functions

Functions explored in the practice workbook:

| Function | Purpose | Example |
|---|---|---|
| `TODAY()` | Returns the current date | `=TODAY()` |
| `NOW()` | Returns the current date and time | `=NOW()` |
| `DAY()` | Extracts the day from a date | `=DAY(B6)` |
| `MONTH()` | Extracts the month | `=MONTH(B6)` |
| `YEAR()` | Extracts the year | `=YEAR(B6)` |
| `DATE()` | Creates a date from year, month, and day | `=DATE(2026,10,18)` |
| `EDATE()` | Adds or subtracts months | `=EDATE(B21,4)` |

**Date calculations:**

```excel
=B15+6
=B15-3
=EDATE(B21,4)
=EDATE(B21,-3)
=EDATE(B28,120)
```

### 10. Lookup Functions

Introduced the `LOOKUP()` function for retrieving values from a range based on a lookup value.

**Example:**

```excel
=LOOKUP(A4,E3:F8,F3:F8)
```

Lookup practice included:

- Finding corresponding tax values.
- Retrieving phone numbers using IDs.
- Finding matching records in a table.

### 11. Introduction to Data Analytics

**Data Analytics** is the process of understanding data to generate insights and support better business decisions.

Key objectives:

- Identify patterns and trends.
- Measure profit, loss, and business growth.
- Evaluate business performance.
- Understand customer behaviour.
- Support strategic decision-making.

### 12. Domain Knowledge and KPIs

**Domain knowledge** means understanding the industry and business context associated with the data being analyzed.

It includes:

- Business processes.
- Customer behaviour.
- Industry rules.
- Key Performance Indicators (KPIs).
- Common business problems.

**Who defines KPIs?**

KPIs are generally established by business stakeholders, such as:

- Business Analysts.
- Product Managers.
- Clients and stakeholders.
- Management and domain experts.

A Data Analyst uses these KPIs to perform analysis and generate insights.

**Examples of domain-specific metrics:**

| Domain | Example Metrics |
|---|---|
| E-Commerce | Sales, profit, delivery time, reviews |
| Banking | Loan defaults, credit scores, EMI performance |
| Healthcare | Patient waiting time, treatment success |
| Telecom | Call drop rate, churn rate, internet usage |
| Entertainment | Watch time, audience demographics, subscriptions |

### 13. Data Analytics Workflow

The basic Data Analytics workflow consists of the following stages:

1. **Problem Understanding** — Understand the business question.
2. **Data Collection** — Access relevant data from existing systems.
3. **Data Cleaning** — Handle missing values, duplicates, and incorrect formats.
4. **Data Analysis** — Explore data using sorting, filtering, grouping, and summaries.
5. **Data Visualization** — Present information through charts, graphs, and dashboards.
6. **Insights & Decision-Making** — Convert findings into actionable business recommendations.

### 14. Common Data Sources

Data Analysts may access data from:

- Excel reports.
- SQL databases.
- CSV files.
- ERP systems.
- Cloud storage platforms.
- Data warehouses.
- API reports.

Data collection and pipeline maintenance may involve Data Engineers, while Data Analysts commonly focus on accessing, preparing, analyzing, and interpreting available data.

### 15. Real-World Data Analytics Use Cases

#### E-Commerce Analytics

Questions:
- Has the sales target been achieved?
- Are sales better than the previous year?
- Which region generates the highest sales?
- Which categories generate the most profit?
- How do customer ratings and delivery quality compare?

#### Entertainment Analytics

Possible metrics:
- Payment methods.
- Audience age groups.
- Country-wise preferences.
- Content popularity.
- Language preferences.

#### Tourism Analytics

Possible metrics:
- Country-wise and state-wise visitors.
- Seasonal demand.
- Tourist spending behaviour.
- Travel modes.
- Age groups.
- Hotel preferences.
- Ratings and reviews.

---

## 🛠️ Practical Work

The following Excel workbooks were used for hands-on practice:

| File | Purpose |
|---|---|
| `Day_1_Into_to_excel.xlsx` | Introduction to Excel and tabular data |
| `Day_1_Excel_Basics_&_Formula_Practice.xlsx` | Formula practice, text functions, dates, tables, references, and lookups |

Additional notes:

- `Day_1_Basics_of_excel.txt`
- `Day_1_What_is_data_analytics.txt`

---

## ✅ Day 1 Progress Checklist

- [x] Introduction to Excel.
- [x] Workbooks and worksheets.
- [x] Basic Excel operations.
- [x] Cell formatting and alignment.
- [x] Sorting and filtering.
- [x] Basic formulas and arithmetic operators.
- [x] Aggregate functions.
- [x] Text functions.
- [x] Conditional formatting.
- [x] Excel tables.
- [x] Relative and absolute cell references.
- [x] Date and time functions.
- [x] Introduction to lookup functions.
- [x] Fundamentals of Data Analytics.
- [x] Domain knowledge and KPIs.
- [x] Data Analytics workflow.
- [x] Real-world analytics use cases.

---

## 💡 Key Takeaways

1. Excel is a useful tool for organizing, calculating, and analyzing structured data.
2. Formulas and functions reduce manual calculations.
3. Sorting, filtering, and tables make datasets easier to explore.
4. Cell references are important when copying formulas across a worksheet.
5. Text and date functions help transform and process data.
6. Data Analytics involves converting data into meaningful business insights.
7. Domain knowledge helps analysts understand the business context.
8. Data visualization and actionable insights support better decision-making.

---

## 🚀 Next Steps

- Continue learning Excel functions and data manipulation.
- Practice on larger datasets.
- Strengthen formula-writing skills.
- Explore PivotTables and data summarization.
- Continue the Data Analytics learning roadmap with practical exercises.

---

## 📅 Learning Log

| Field | Details |
|---|---|
| Day | 01 |
| Subject | Excel & Introduction to Data Analytics |
| Learning Mode | Theory + Hands-on Practice |
| Status | Completed |
| Goal | Build a strong foundation for Data Analytics |

**Consistency over perfection. One day, one lesson, one GitHub push at a time.** 💻📈