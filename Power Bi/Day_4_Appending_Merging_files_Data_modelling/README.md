# 📊 Power BI Daily Practice – Day 4

## 📌 Overview

This repository documents my daily learning and hands-on practice with **Microsoft Power BI**, focusing on Power Query, data cleaning, data transformation, appending files, merging tables, and creating data models.

The goal is to strengthen my data analytics foundations through practical exercises and consistently push my learning progress to GitHub.

## 🛠️ Tools & Technologies

- **Microsoft Power BI Desktop** – Data analysis and visualization
- **Power Query Editor** – Data cleaning and transformation
- **Power BI Model View** – Creating and managing relationships
- **Excel & CSV** – Data sources
- **Git & GitHub** – Version control and daily practice tracking

## 📚 Topics Covered

### 1. Power Query Editor

Power Query is a data preparation and transformation tool available in Power BI and Excel. It helps clean, reshape, combine, and prepare data before analysis.

Key operations:
- Data cleaning
- Data transformation
- Handling missing values
- Removing duplicates
- Changing column data types
- Replacing values
- Appending and merging queries
- Creating data models and relationships

### 2. Data Cleaning

Practiced cleaning raw datasets using Power Query Editor.

**Operations performed:**
- Removing blank rows
- Removing blank columns
- Handling missing and `NA` values
- Identifying duplicate rows and columns
- Checking and correcting data types
- Replacing incorrect or unwanted values

**Practice datasets:**
- `sales2017_raw.csv`
- `employee.xls`

### 3. Append Queries

Appending combines rows from multiple tables by placing one dataset below another.

**Practical exercises:**
- Appending multiple CSV files from a folder
- Appending multiple Excel sheets from one workbook
- Appending Excel sheets with different columns
- Appending multiple Excel files from a folder
- Combining data from different sources, such as Excel and CSV

**Power Query expression practiced:**

```powerquery
Excel.Workbook([Content])
```

This expression helps access workbook contents when processing Excel files, such as when combining files from a folder.

**Key learning:** Append operations align data using column names. When tables contain different columns, the resulting table includes the combined set of columns, with missing values where a source does not contain a particular column.

### 4. Merge Queries

Merging combines columns from two tables by matching records using one or more common columns.

**Practical exercises:**
- Merging Excel tables into Power BI
- Merging two different Excel tables
- Merging tables from different data sources
- Merging using multiple matching columns

**Real-world example:**

An e-commerce company maintains separate tables for customers and orders.

- Customer table: Customer ID, Customer Name, City
- Orders table: Order ID, Customer ID, Order Amount

By merging the tables using `Customer ID`, we can combine customer information with order details for further analysis.

**Key learning:** Appending combines rows, whereas merging combines columns based on matching keys.

### 5. Data Modelling & Relationships

Practiced establishing relationships between multiple tables and exploring the resulting data model in Power BI Model View.

**Types of relationships covered:**
- One-to-many (1:*)
- Many-to-one (*:1)
- Many-to-many (*:*)

**Practice assignments:**
1. Create a data model for Product and Sales tables.
2. Create a data model for Student and Courses files.
3. Create a data model for the AmazingMartEU2 dataset.
4. Complete the assigned data-cleaning exercises using the Power Query 1 folder.

**Real-world example:**

In a sales analytics system, a Product table contains unique product records, while a Sales table contains multiple transactions for each product.

A one-to-many relationship connects the Product table to the Sales table through `Product ID`, allowing product attributes to filter and analyze sales transactions.

## 📂 Practice Files

The repository includes the following Power BI practice files:

| File | Practice Topic |
|---|---|
| `Day_4_Appending_files.pbix` | Appending files using Power Query |
| `Day_4_merging_tables.pbix` | Merging tables using Power Query |
| `Day_4_Data_modelling.pbix` | Creating data models and relationships |
| `day7 appending.txt` | Notes on appending queries |
| `day8 model and merge.txt` | Notes on merging queries and data modelling |
| `Day6 15 march.txt` | Notes on Power Query and data cleaning |

*Note: The PBIX filenames are retained as provided. The topics above describe their intended practice areas based on the filenames and accompanying notes.*

## 🎯 Key Takeaways

- Understood the role of Power Query in data preparation.
- Practiced cleaning raw datasets before analysis.
- Learned how to append data from multiple files and sources.
- Understood how merging combines related tables using matching columns.
- Learned the differences between append and merge operations.
- Explored one-to-many, many-to-one, and many-to-many relationships.
- Practiced organizing datasets into data models for analysis.
- Improved practical familiarity with Power BI Desktop.

## 🚀 Learning Progress

This practice is part of my ongoing journey toward becoming a **Data Analyst / Data Engineer**.

I am building my skills through daily hands-on exercises in data preparation, SQL, Python, Power BI, and data engineering concepts.

I will continue documenting my progress and pushing my practice files and learning notes to GitHub.

---

**Learning by doing. Practicing daily. Building consistently.** 📈