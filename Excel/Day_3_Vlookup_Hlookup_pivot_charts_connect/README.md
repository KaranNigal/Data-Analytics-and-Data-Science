# 📊 Day 3: Advanced Excel, PivotTables, Charts & Power Query

> **Daily Learning Practice | Data Analytics Journey**

## 🎯 Learning Objectives

- Strengthen lookup skills using VLOOKUP and HLOOKUP.
- Understand how PivotTables summarize large datasets.
- Create charts to visualize business data.
- Learn the basics of Power Query Editor.
- Perform data cleaning and transformation.
- Explore Excel data source connectivity.
- Practice data analysis using real-world datasets.

---

## 📚 Topics Covered

### 1. VLOOKUP and HLOOKUP

Lookup functions retrieve information from datasets based on a specified value.

#### VLOOKUP

`VLOOKUP()` searches vertically in the first column of a table and returns a corresponding value from another column.

**Syntax:**

```excel
=VLOOKUP(lookup_value, table_array, col_index_num, [range_lookup])
```

**Example:**

```excel
=VLOOKUP(A2,$E$2:$H$100,3,FALSE)
```

**Key points:**
- Searches in the first column of the selected table.
- Returns a value from a column to the right.
- Use `FALSE` for an exact match.
- Use `TRUE` for an approximate match when the lookup data meets the required sorting conditions.

#### HLOOKUP

`HLOOKUP()` searches horizontally across the first row of a table and returns a value from a specified row.

**Syntax:**

```excel
=HLOOKUP(lookup_value, table_array, row_index_num, [range_lookup])
```

**Example:**

```excel
=HLOOKUP(B1,$B$1:$G$5,3,FALSE)
```

**Difference between VLOOKUP and HLOOKUP:**

| Feature | VLOOKUP | HLOOKUP |
|---|---|---|
| Search direction | Vertical | Horizontal |
| Search location | First column | First row |
| Return position | Specified column | Specified row |
| Typical use | Employee records | Data arranged horizontally |

**Practical applications:**
- Retrieving employee details.
- Finding product information.
- Searching for values in structured tables.
- Fetching corresponding records using an ID.

---

### 2. PivotTables in Excel

A PivotTable is an Excel feature used to summarize, aggregate, and analyze structured datasets.

**Key features:**
- Summarizes large datasets.
- Groups records by categories.
- Calculates totals, counts, and averages.
- Supports filtering and sorting.
- Allows fields to be rearranged easily.
- Provides summarized data for further calculations and visualization.

#### Main PivotTable Areas

| Area | Purpose | Example |
|---|---|---|
| Rows | Groups data vertically | Product Category |
| Columns | Groups data horizontally | Region |
| Values | Calculates summary metrics | Sum of Sales |
| Filters | Filters the entire report | Year |

#### Example: Sales Analysis

Suppose a dataset contains:

| Region | Category | Sales |
|---|---|---:|
| West | Furniture | 5000 |
| East | Technology | 8000 |
| West | Technology | 6000 |
| East | Furniture | 4000 |

A PivotTable can summarize total sales by region or category without manually calculating each total.

**Example analytical questions:**
- Which region generates the highest sales?
- Which category contributes the most revenue?
- What is the total sales value?
- How do different categories perform across regions?

**Workflow:**

1. Select the dataset.
2. Go to **Insert → PivotTable**.
3. Select the required data range and destination.
4. Drag fields into Rows, Columns, Values, and Filters.
5. Change the value aggregation when necessary.
6. Apply sorting and filtering.
7. Use the summary for reporting and visualization.

---

### 3. Charts in Excel

Charts convert numerical data into visual representations, making patterns and comparisons easier to understand.

**Chart types explored:**

| Chart Type | Typical Use |
|---|---|
| Bar Chart | Comparing categories |
| Column Chart | Comparing values across categories |
| Pie Chart | Showing proportions of a whole |
| Line Chart | Analyzing trends over time |
| Combo Chart | Comparing different metrics using combined chart types |

#### Chart Formatting

Excel charts can be customized using:

- Chart titles.
- Axis titles.
- Data labels.
- Legends.
- Text size.
- Chart styles.
- Axis formatting.

#### Example: Business Reporting

A sales report can use:
- A column chart to compare regional sales.
- A line chart to show monthly sales trends.
- A bar chart to rank product categories.
- A pie chart to illustrate category contributions.

**Key takeaway:** Choose a chart based on the question you want the data to answer.

---

### 4. Power Query Editor

Power Query Editor is a data preparation tool used to connect to data sources, clean data, and transform it before analysis.

It helps automate repeatable data preparation steps and reduces the need for repetitive manual editing.

#### Basic Data Cleaning and Transformation

Topics covered:

- Removing null rows and columns.
- Removing blank rows.
- Removing duplicate records.
- Changing data types.
- Correcting formats.
- Editing rows and columns.
- Replacing values.

#### Typical Workflow

1. Import or connect to a dataset.
2. Open Power Query Editor.
3. Inspect the data.
4. Remove unnecessary rows and columns.
5. Handle missing or invalid values.
6. Remove duplicates where appropriate.
7. Correct data types and formats.
8. Rename columns and replace values when needed.
9. Apply transformations.
10. Load the cleaned data into Excel.

#### Example: Cleaning Sales Data

A dataset might contain:
- Blank customer names.
- Duplicate transaction records.
- Incorrect date formats.
- Numeric values stored as text.
- Unnecessary columns.

Power Query can apply repeatable transformations to prepare the dataset for reporting.

**Important note from class:** Power Query Editor does not provide the same familiar Undo/Redo workflow as the main Excel worksheet. Review transformations carefully and use the available cancellation or step-management options when necessary.

---

### 5. Data Source Connectivity

Data source connectivity involves connecting Excel to data stored in external files or systems.

Examples of potential sources include:

- Excel workbooks.
- CSV files.
- Text files.
- Databases.
- Other supported external data sources.

Power Query can import data from supported sources and transform it before loading it into Excel.

#### Basic Workflow

1. Open the **Data** tab.
2. Choose the appropriate data import or connection option.
3. Select the source.
4. Preview the data.
5. Transform the data if required.
6. Load it into Excel.

**Why it matters:** Analysts frequently work with data that originates outside Excel. Understanding connectivity helps create more repeatable reporting workflows.

---

## 🛠️ Practical Work & Datasets

The following uploaded files were used for Day 3 learning and practice.

| File | Purpose |
|---|---|
| `Day_3_Vlookup_&_Hlookup.xlsx` | VLOOKUP and HLOOKUP exercises |
| `Day_3_Adavnce_Examples_Chart_&_Pivot table.xlsx` | Advanced examples, charts, and PivotTables |
| `Day_3_Data_source_connectivity.xlsx` | Data source connectivity practice |
| `vlookup.txt` | Lookup function notes |
| `Pivot_tables_charts.txt` | PivotTables and chart notes |
| `Superstore.csv` | Dataset for data analysis and reporting practice |
| `bankedit1.txt` | Banking dataset practice |
| `employee.xlsx` | Employee data practice |

### Dataset Practice Ideas

#### Superstore Dataset
- Analyze sales by category and region.
- Compare product performance.
- Create PivotTables for business summaries.
- Visualize sales using charts.
- Clean and transform the dataset using Power Query.

#### Banking Dataset
- Explore customer age and job categories.
- Analyze account balances.
- Compare customer loan and housing statuses.
- Summarize the campaign outcome field.

#### Employee Dataset
- Organize employee records.
- Retrieve employee information using lookup functions.
- Summarize records using PivotTables.
- Visualize relevant employee metrics.

*These are suggested analysis exercises based on the datasets provided, not a claim that every exercise has already been completed.*

---

## 🔄 Data Analysis Workflow Practiced

The concepts learned today fit into a typical data analysis workflow:

1. **Connect** — Import data from a supported source.
2. **Clean** — Remove unnecessary or invalid records and correct formats.
3. **Transform** — Prepare columns and values for analysis.
4. **Summarize** — Use PivotTables to aggregate data.
5. **Visualize** — Create charts to communicate patterns.
6. **Interpret** — Identify findings that can support business decisions.

---

## ✅ Day 3 Progress Checklist

- [x] VLOOKUP fundamentals.
- [x] HLOOKUP fundamentals.
- [x] Understanding vertical and horizontal lookups.
- [x] PivotTable fundamentals.
- [x] Rows, Columns, Values, and Filters in PivotTables.
- [x] Summarizing datasets.
- [x] Bar and column charts.
- [x] Pie and line charts.
- [x] Combo charts.
- [x] Chart formatting.
- [x] Introduction to Power Query Editor.
- [x] Basic data cleaning.
- [x] Removing blank and duplicate records.
- [x] Changing data types and formats.
- [x] Editing rows and columns.
- [x] Replacing values.
- [x] Introduction to data source connectivity.
- [x] Identifying practical applications using business datasets.

---

## 💡 Key Takeaways

1. VLOOKUP and HLOOKUP retrieve information from vertically and horizontally organized tables.
2. PivotTables summarize large datasets into useful business information.
3. Charts make trends, comparisons, and distributions easier to communicate.
4. Power Query helps clean and transform data through repeatable steps.
5. Data source connectivity allows Excel to work with information stored outside a worksheet.
6. Data cleaning is an important preparation step before analysis.
7. PivotTables and charts can turn cleaned data into useful reports.
8. Real-world datasets provide opportunities to practice analytical thinking.

---

## 🚀 Next Steps

- Practice VLOOKUP and HLOOKUP with different datasets.
- Explore XLOOKUP and INDEX-MATCH.
- Create PivotTables with multiple row and column fields.
- Build charts from PivotTable summaries.
- Practice Power Query transformations on CSV files.
- Explore refreshing imported data after the source changes.
- Build a small Excel dashboard using a real-world dataset.

---

## 📅 Learning Log

| Field | Details |
|---|---|
| Day | 03 |
| Subject | Advanced Excel & Data Analysis |
| Learning Mode | Theory + Hands-on Practice |
| Status | Learning topics covered; practice completion to be verified |
| Tools | Microsoft Excel, Power Query |
| Goal | Develop practical data preparation, summarization, and visualization skills |

**Consistency over perfection. One day, one lesson, one GitHub push at a time.** 💻📈