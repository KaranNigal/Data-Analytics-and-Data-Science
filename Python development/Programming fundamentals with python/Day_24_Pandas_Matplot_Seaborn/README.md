# 📊 Daily Learning – Data Visualization & Pandas

> Daily learning and GitHub push practice for building strong Data Analytics skills with Python.

---

## 📅 Today's Learning

Today I practiced **Pandas Pivot / Pivot Table**, **Matplotlib**, and **Seaborn** using practical datasets.

The main focus was understanding how to reshape data for analysis and how to visualize numerical and categorical data using different types of charts.

---

# 🐼 Pandas – Pivot & Pivot Table

## 🔢 Converting Categorical Values to Numerical Values

Practiced replacing categorical values with numerical values:

```python
replace_map = {
    'exceptional': 4,
    'average': 3,
    'good': 2,
    'poor': 1
}

df6['score'] = df6['score'].replace(replace_map)
```

This is useful when categorical information needs to be represented numerically for analysis.

---

## 🔄 `pivot()`

`pivot()` is used to reshape a DataFrame by changing the arrangement of rows and columns.

```python
pivoted_df = df.pivot(
    index='date',
    columns='city'
)
```

Specific values can also be selected:

```python
temp_pivot = df.pivot(
    index='date',
    columns='city',
    values='temperature'
)
```

### Key Parameters

| Parameter | Meaning                      |
| --------- | ---------------------------- |
| `index`   | Becomes the rows             |
| `columns` | Unique values become columns |
| `values`  | Selects the data to display  |

---

## 📋 `pivot_table()`

`pivot_table()` is similar to `pivot()`, but it can also perform **aggregation**.

```python
pivot_table = df.pivot_table(
    index='city',
    columns='date',
    aggfunc='sum'
)
```

Different aggregation functions can be used:

```python
aggfunc='sum'
aggfunc='mean'
```

Example:

```python
temp_analysis = df.pivot_table(
    index='city',
    columns='date',
    values='temperature',
    aggfunc='mean'
)
```

---

## ♻️ Handling Duplicate Records

I practiced using `pivot_table()` when duplicate records exist.

For example:

```text
New York on 5/1/2017:
65 + 61 = 126
```

Using:

```python
aggfunc='sum'
```

allows duplicate values to be aggregated.

### Key Learning

`pivot()` requires unique combinations of the index and columns, while `pivot_table()` can handle duplicate combinations through aggregation.

---

# 📈 Matplotlib

Matplotlib was introduced as a Python visualization library.

```python
import matplotlib.pyplot as plt
```

The notebook also covered:

* Client Visualization — Excel, Power BI, Tableau
* Self Visualization — Matplotlib, Seaborn

---

# 📉 Line Chart

A basic line chart can be created using:

```python
plt.plot(x, y)
```

Added labels, title, and grid:

```python
plt.xlabel('x axis')
plt.ylabel('y axis')
plt.title('stress v/s depression')
plt.grid()
plt.show()
```

---

## 🎨 Line Customization

Practiced customizing:

* Figure size
* Line color
* Line width
* Line style
* Marker type
* Marker size
* Marker face color
* Marker edge color

Example:

```python
plt.figure(figsize=(10,10))

plt.plot(
    x,
    y,
    color='pink',
    linewidth=8,
    linestyle=':',
    marker='^',
    markersize=20,
    markerfacecolor='red',
    markeredgecolor='black'
)

plt.xlabel('x axis')
plt.ylabel('y axis')
plt.title('stress v/s depression')

plt.show()
```

---

# 🔵 Scatter Plot

Scatter plots are useful for showing the relationship between two numerical variables.

```python
plt.scatter(x, y)
```

Example using the Superstore dataset:

```python
plt.scatter(
    df['Quantity'].head(20),
    df['Sales'].head(20)
)
```

---

## 🚨 Outlier Detection

A scatter plot can also help identify outliers.

Example:

```python
x = [10, 12, 13, 15, 17]
y = [100, 108, 105, 101, 800]

plt.scatter(x, y)
```

The value `800` is much larger than the other values and becomes visually noticeable.

### Key Learning

Scatter plots can help identify:

* Relationships between variables
* Patterns
* Unusual observations
* Potential outliers

---

# 📊 Bar Chart

Basic bar chart:

```python
plt.bar(
    [1, 3, 6, 7, 4],
    [6, 9, 8, 6, 3],
    color='green',
    width=0.1
)
```

Applied to the Superstore dataset:

```python
plt.bar(df['Segment'], df['Sales'])
```

Also practiced:

```python
plt.bar(df['Region'], df['Sales'])
```

### Important Learning

The bar chart visualizes the values supplied to `plt.bar()`.

If actual category or segment totals are required, the data should first be aggregated using methods such as:

```python
df.groupby('Segment')['Sales'].sum()
```

or:

```python
df.pivot_table(
    index='Segment',
    values='Sales',
    aggfunc='sum'
)
```

---

# 📊 Histogram

Practiced histograms using:

```python
plt.hist(df['Region'])
```

Also:

```python
plt.hist(df['City'])
```

Histograms were used in the practice examples to inspect the distribution of records across regions and cities.

---

# 🥧 Pie Chart

Created a region-wise sales pie chart after aggregating sales:

```python
obj = df.groupby('Region')['Sales'].sum()

plt.pie(
    obj,
    labels=obj.index,
    autopct='%1.2f%%'
)

plt.title('region wise sales')
plt.show()
```

### Important Concept

First, the data is aggregated:

```python
df.groupby('Region')['Sales'].sum()
```

Then the aggregated values are visualized using the pie chart.

This demonstrates how **data preparation and visualization work together**.

---

# 🎨 Seaborn

Seaborn was introduced as another Python visualization library.

```python
import seaborn as sns
```

---

# 📈 Distribution Plot

Practiced Seaborn's `displot()`:

```python
sns.displot(
    df['Segment'],
    kde=True,
    height=3,
    aspect=4,
    color='pink'
)
```

Also practiced:

```python
sns.displot(
    df['Region'],
    kde=True
)
```

---

## 🧮 KDE – Kernel Density Estimate

**KDE** stands for:

> Kernel Density Estimate

KDE provides a smooth estimate of the distribution of data.

It can be enabled using:

```python
kde=True
```

---

# 🔍 Seaborn Pairplot

Loaded Seaborn's built-in `mpg` dataset:

```python
df1 = sns.load_dataset('mpg')
```

Created a pairplot:

```python
sns.pairplot(
    df1,
    aspect=1,
    height=3
)
```

---

## 📌 What Pairplot Does

A pairplot creates a grid showing relationships between multiple features.

It helps explore:

* Relationships between numerical variables
* Distributions of individual variables
* Possible patterns
* Correlations
* Potential outliers

The `mpg` dataset contains features such as:

* `mpg`
* `cylinders`
* `displacement`
* `horsepower`
* `weight`
* `acceleration`
* `model_year`
* `origin`
* `name`

---

# 🗂️ Datasets Practiced

## 🌦️ Weather Dataset

Used to practice:

* `pivot()`
* `pivot_table()`
* Aggregation
* Duplicate records
* Temperature
* Humidity
* City-wise analysis
* Date-wise analysis

---

## 🛒 Superstore Dataset

Used for:

* Sales analysis
* Region-wise analysis
* Category-wise analysis
* Segment-wise visualization
* Quantity vs Sales
* Profit analysis
* Bar charts
* Histograms
* Pie charts
* Pivot tables

### Dataset Information

* **Rows:** 9,994
* **Columns:** 21

Important fields include:

* Order ID
* Order Date
* Ship Date
* Ship Mode
* Customer ID
* Customer Name
* Segment
* Country/Region
* City
* Postal Code
* Region
* Product ID
* Category
* Sub-Category
* Product Name
* Sales
* Quantity
* Discount
* Profit

---

## 🚗 Seaborn MPG Dataset

Used for:

* Pairplot
* Feature relationships
* Distribution exploration

### Dataset Information

* **Rows:** 398
* **Columns:** 9

Important columns include:

* `mpg`
* `cylinders`
* `displacement`
* `horsepower`
* `weight`
* `acceleration`
* `model_year`
* `origin`
* `name`

---

# 🧠 Key Concepts Learned

## 🐼 Pandas

* `pivot()`
* `pivot_table()`
* `index`
* `columns`
* `values`
* `aggfunc`
* `sum`
* `mean`
* `groupby()`
* Data aggregation
* Handling duplicate records
* Categorical-to-numerical mapping

## 📊 Matplotlib

* `plt.plot()`
* `plt.scatter()`
* `plt.bar()`
* `plt.hist()`
* `plt.pie()`
* `plt.figure()`
* `figsize`
* `xlabel()`
* `ylabel()`
* `title()`
* `grid()`
* `savefig()`
* Line customization
* Markers
* Basic chart styling

## 🎨 Seaborn

* `sns.displot()`
* KDE
* `sns.pairplot()`
* Built-in datasets
* Distribution visualization
* Pairwise feature relationships

---

# 💡 Important Takeaways

1. **`pivot()` reshapes data but does not perform aggregation.**
2. **`pivot_table()` can reshape data and perform aggregation.**
3. **`groupby()` combined with aggregation is useful when calculating totals or averages.**
4. **Data often needs to be prepared and aggregated before visualization.**
5. **Matplotlib provides detailed control over individual chart elements.**
6. **Scatter plots are useful for studying relationships and identifying potential outliers.**
7. **Bar charts are useful for comparing values across categories.**
8. **Histograms help understand how observations are distributed.**
9. **Pie charts are useful for showing parts of a whole after appropriate aggregation.**
10. **KDE provides a smooth representation of data distribution.**
11. **Pairplots provide a quick way to explore relationships between multiple features.**
12. **Pandas and visualization libraries work together to perform Exploratory Data Analysis (EDA).**

---

# 🚀 Practice Progress

### Pandas

* [x] Categorical-to-numerical mapping
* [x] `pivot()`
* [x] `pivot_table()`
* [x] `index`
* [x] `columns`
* [x] `values`
* [x] `aggfunc`
* [x] Aggregation with `sum`
* [x] Aggregation with `mean`
* [x] `groupby()`
* [x] Duplicate-record handling

### Matplotlib

* [x] Line chart
* [x] Line styling
* [x] Scatter plot
* [x] Outlier visualization
* [x] Bar chart
* [x] Histogram
* [x] Pie chart
* [x] Figure sizing
* [x] Labels
* [x] Titles
* [x] Grid
* [x] `savefig()`

### Seaborn

* [x] Distribution plot
* [x] KDE
* [x] Pairplot
* [x] Built-in datasets

### Datasets

* [x] Weather Dataset
* [x] Superstore Dataset
* [x] MPG Dataset

---

# 📌 Today's Goal

Build a strong foundation in **Data Visualization with Python** and understand how Pandas data manipulation connects with Matplotlib and Seaborn for **Exploratory Data Analysis (EDA)**.

### Next Step

Continue practicing different chart types and learn how to choose the right visualization based on the question being asked.

---

# 🔥 Daily Push Practice

This README is part of my **daily learning and GitHub push practice**.

Every day:

1. Learn a new concept.
2. Practice it using Python.
3. Work with a real or practical dataset.
4. Document what I learned.
5. Push the notebook and README to GitHub.
6. Continue building consistency and improving my Data Analytics skills.

> **Learn → Practice → Document → Push → Repeat 🚀**

---

# 📅 Learning Progress

| Day   | Topic                              | Status |
| ----- | ---------------------------------- | ------ |
| Day 1 | Pandas & Data Analysis             | ✅      |
| Day 2 | Data Visualization                 | ✅      |
| Today | Pandas Pivot, Matplotlib & Seaborn | ✅      |

---

# 💪 Consistency > Motivation

> **Small progress every day leads to big results over time.**

**Keep learning. Keep practicing. Keep pushing. 🚀**
