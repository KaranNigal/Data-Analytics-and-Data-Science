# Day 22 - Pandas Library Practice 🐼

## 📌 Overview

This repository contains my **Day 22 of daily Python practice**, where I learned and practiced the fundamentals of the **Pandas library**.

Pandas is a powerful Python library used for **data analysis and data manipulation**. During this practice, I worked with **Series, DataFrames, CSV files, data exploration, statistical analysis, indexing, and column operations**.

---

## 📚 Topics Covered

### 1. Importing Pandas

```python
import pandas as pd
```

---

### 2. Pandas Series

* Creating a Pandas Series
* Understanding default indexing
* Creating a Series with custom labels/indexes

```python
a = pd.Series([1, 2, 3, 4, 5])

c = pd.Series(
    [1, 2, 3, 4, 5],
    index=['a', 'b', 'c', 'd', 'e']
)
```

---

### 3. Creating DataFrames

#### From a Dictionary

```python
data = {
    'id': [101, 102, 103, 104, 105],
    'name': ['Arun', 'Nilesh', 'Ajit', 'Prashant', 'Priya'],
    'city': ['Mumbai', 'Pune', 'Surat', 'Gujarat', 'Satara']
}

df = pd.DataFrame(data)
```

#### From a List of Records

```python
emp = [
    (101, 'HR', 'Pune'),
    (102, 'IT', 'Pune'),
    (105, 'CS', 'Pune')
]

df = pd.DataFrame(emp, columns=["id", "dept", "city"])
```

---

### 4. Reading CSV Files

Practiced converting CSV data into a Pandas DataFrame using:

```python
pd.read_csv()
```

Also explored the dataset using:

* `head()`
* `shape`
* `size`
* `len()`
* `columns`
* `columns.size`

---

### 5. Data Analysis Operations

Performed basic numerical analysis on the dataset:

```python
df.sum(numeric_only=True)
df.mean(numeric_only=True)
```

Also calculated totals for individual columns such as:

* Sales
* Profit
* Quantity

---

### 6. Understanding Dataset Information

Used:

```python
df.describe()
```

Learned about:

* Count
* Mean
* Standard Deviation
* Minimum
* 25th Percentile
* Median
* 75th Percentile
* Maximum

Also explored categorical/object columns using:

```python
df.describe(include=['object'])
```

---

### 7. Data Type Conversion

Practiced converting numerical columns into string/object type when they should not be used for numerical calculations:

```python
df['Row ID'] = df['Row ID'].astype(str)
df['Postal Code'] = df['Postal Code'].astype(str)
```

---

### 8. Selecting Rows and Columns

Practiced different ways to access data:

#### Selecting specific rows

```python
df[101:106]
```

#### Selecting specific columns

```python
df['Sales']
```

#### Selecting multiple columns

```python
df[['Row ID', 'Order ID', 'Sales', 'Profit']]
```

---

### 9. Indexing with `iloc`

Used **integer-based indexing** to access specific rows and columns:

```python
df.iloc[4, 5]
```

---

### 10. Indexing with `loc`

Used **label-based indexing** to access rows and columns:

```python
df.loc[45, 'Category']
```

Also practiced selecting multiple rows and columns:

```python
df.loc[3:9, ['City', 'Category']]
```

And selecting rows with steps:

```python
df.loc[45:59:3, ['Region', 'Sales']]
```

---

### 11. Accessing Individual Column Values

Practiced accessing values from a specific column:

```python
df['Segment'][5000]
```

---

### 12. Unique Values

Learned how to explore unique values in a dataset.

#### Count Unique Values

```python
df['State'].nunique()
```

#### Display Unique Values

```python
df['Region'].unique()
```

```python
df['Product Name'].unique()
```

---

## 🛠️ Technologies Used

* Python
* Pandas
* CSV Dataset
* Jupyter Notebook

---

## 🎯 Key Learning

Through this practice, I learned the fundamentals of working with structured data using Pandas, including:

* Creating Series and DataFrames
* Reading CSV files
* Exploring datasets
* Performing basic statistical analysis
* Selecting rows and columns
* Using `loc` and `iloc`
* Converting data types
* Finding unique values in columns

---

## 📅 Daily Practice Journey

**Day 22 – Pandas Library Practice 🐼**

Continuing my daily Python learning journey by practicing Python libraries and improving my data analysis skills step by step. 🚀
