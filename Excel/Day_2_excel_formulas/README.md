# 📊 Day 2: Excel Functions, Lookup Functions & Data Handling

> **Daily Learning Practice | Data Analytics Journey**

## 🎯 Learning Objectives

- Understand relative and absolute cell references.
- Learn lookup functions to retrieve information from datasets.
- Practice VLOOKUP with exact and approximate matching.
- Understand how to use MATCH with VLOOKUP.
- Explore text, date, and time functions.
- Work with Excel tables, slicers, sorting, and filtering.
- Apply conditional formatting to highlight important data.

---

## 📚 Topics Covered

### 1. Cell References in Excel

Cell references specify the cells used in formulas.

| Reference Type | Example | Behaviour |
|---|---|---|
| Relative Reference | `A1` | Changes when the formula is copied |
| Absolute Reference | `$A$1` | Row and column remain fixed |
| Mixed Reference | `$A1` | Column remains fixed |
| Mixed Reference | `A$1` | Row remains fixed |

**Shortcut:** Press `F4` while editing a cell reference in a formula to cycle through reference types.

**Example:**

```excel
=B21/$B$20
```

Here, `$B$20` remains fixed when the formula is copied to other cells.

---

### 2. Excel Lookup Functions

Lookup functions help retrieve information from a dataset using a specified lookup value.

#### 2.1 LOOKUP Function

The `LOOKUP()` function searches for a value in a range and returns the corresponding value from another range.

**Syntax:**

```excel
=LOOKUP(lookup_value, lookup_vector, result_vector)
```

**Examples:**

```excel
=LOOKUP(A4,E3:F8,F3:F8)
```

```excel
=LOOKUP($A$48,$A$37:$A$44,B37:B44)
```

**Key concepts:**
- Lookup value: The value you want to find.
- Lookup vector: The range where Excel searches.
- Result vector: The range containing the corresponding result.

**Note:** `LOOKUP()` generally assumes that the lookup vector is sorted in ascending order and performs an approximate match.

#### 2.2 VLOOKUP Function

`VLOOKUP()` searches for a value in the first column of a table and returns a value from a specified column in the same row.

**Syntax:**

```excel
=VLOOKUP(lookup_value, table_array, col_index_num, [range_lookup])
```

**Parameters:**

| Parameter | Description |
|---|---|
| `lookup_value` | Value to search for |
| `table_array` | Range containing the lookup data |
| `col_index_num` | Column number from which to return the result |
| `range_lookup` | `FALSE` for exact match or `TRUE` for approximate match |

**Examples from practice:**

```excel
=VLOOKUP(D1,B4:D12,3,)
```

```excel
=VLOOKUP(A15,A4:D12,4,)
```

**Important rules:**

- VLOOKUP searches for the lookup value in the first column of the selected table array.
- It returns a value from a column to the right of the lookup column.
- For reliable exact-match lookups, use `FALSE` as the fourth argument.
- The lookup column should contain unique values when each lookup value is expected to identify a single record.

#### 2.3 VLOOKUP with Named Ranges

Named ranges allow you to refer to a range using a meaningful name instead of cell coordinates.

**Example:**

```excel
=VLOOKUP(A26,VTable,4,)
```

Here, `VTable` is the named range containing the lookup data.

**Benefits:**
- Makes formulas easier to read.
- Reduces reliance on long cell references.
- Helps organize complex worksheets.

#### 2.4 VLOOKUP with Approximate Match

Approximate matching is useful when finding values within ranges, such as tax brackets, grades, or commission rates.

**Example:**

```excel
=VLOOKUP(A17,B5:D10,3,)
```

**Important points:**

- Leaving the fourth argument blank enables approximate matching.
- The first column of the lookup table must be sorted in ascending order.
- A lookup value smaller than the smallest value in the lookup column returns `#N/A`.

**Best practice:** Explicitly use `TRUE` for approximate matching and `FALSE` for exact matching to make formulas easier to understand.

#### 2.5 VLOOKUP with MATCH

Combining `VLOOKUP()` and `MATCH()` allows you to identify the return column dynamically by matching a column heading.

**Example:**

```excel
=VLOOKUP($A$16,$A$6:$D$13,MATCH(B15,$A$5:$D$5,0),0)
```

Another practice formula:

```excel
=VLOOKUP($A$18,$A$6:$D$13,MATCH(B15,$A$5:$D$5,0),0)
```

**How it works:**

1. `VLOOKUP()` searches for the lookup value in the first column of the table.
2. `MATCH(B15,$A$5:$D$5,0)` finds the position of the column heading specified in `B15`.
3. `VLOOKUP()` uses the position returned by `MATCH()` as the column index.
4. The final `0` specifies an exact match.

**Benefits:**
- Allows dynamic column selection.
- Reduces the need to manually change column index numbers.
- Makes lookup formulas more flexible when the output column changes.

---

### 3. Text Functions

Text functions help clean, format, and combine text values.

| Function | Purpose | Example |
|---|---|---|
| `UPPER()` | Converts text to uppercase | `=UPPER(A3)` |
| `LOWER()` | Converts text to lowercase | `=LOWER(A3)` |
| `PROPER()` | Capitalizes the first letter of each word | `=PROPER(A3)` |
| `CONCAT()` | Combines text values | `=CONCAT(A3,B3)` |
| `TRIM()` | Removes extra spaces | `=TRIM(A29)` |
| `LEN()` | Counts characters in text | `=LEN(A1)` |
| `LEFT()` | Extracts characters from the left | `=LEFT(B29,3)` |

**Practical examples:**

```excel
=UPPER(A3:A22)
```

```excel
=LOWER(A3:A22)
```

```excel
=CONCAT(A3,B3)
```

```excel
=CONCAT(A3," ",B3)
```

```excel
=CONCAT(A3," and ",B4)
```

```excel
=CONCAT("The total Stats of ",A4," are ",C4,".")
```

```excel
=TRIM(A29)
```

```excel
=LEFT(B29,3)
```

**Real-world applications:**
- Standardizing names and text.
- Combining first and last names.
- Removing unnecessary spaces.
- Extracting prefixes or identifiers.
- Preparing text data for analysis.

**Note:** In modern Excel versions that support dynamic arrays, formulas using ranges such as `=UPPER(A3:A22)` can return results for multiple rows.

---

### 4. Date Functions

Date functions help extract date components and perform date calculations.

| Function | Purpose | Example |
|---|---|---|
| `TODAY()` | Returns the current date | `=TODAY()` |
| `NOW()` | Returns the current date and time | `=NOW()` |
| `DAY()` | Extracts the day | `=DAY(C7)` |
| `MONTH()` | Extracts the month | `=MONTH(C7)` |
| `YEAR()` | Extracts the year | `=YEAR(C7)` |
| `DATE()` | Creates a date from year, month, and day | `=DATE(2026,10,18)` |
| `EDATE()` | Adds or subtracts months | `=EDATE(B21,4)` |
| `DATEVALUE()` | Converts a recognized date string into a date serial number | `=DATEVALUE(A44)` |

#### Date Arithmetic

Excel allows you to add or subtract days directly.

```excel
=B15+C16
```

```excel
=B15-3
```

#### Adding or Subtracting Months

```excel
=EDATE(B21,4)
```

Adds four months.

```excel
=EDATE(B21,-3)
```

Subtracts three months.

```excel
=EDATE(B28,120)
```

Adds 120 months, equivalent to 10 months? No — 120 months equals 10 years.

```excel
=EDATE(B28,12*10)
```

Adds 10 years.

```excel
=EDATE(B28,-120)
```

Subtracts 10 years.

**Applications:**
- Calculating employee tenure.
- Tracking delivery dates.
- Calculating subscription expiry.
- Analyzing monthly and yearly sales.
- Managing project timelines.

---

### 5. Time Functions

Time functions help extract or construct time values.

| Function | Purpose | Example |
|---|---|---|
| `HOUR()` | Extracts the hour | `=HOUR(C36)` |
| `MINUTE()` | Extracts the minute | `=MINUTE(C36)` |
| `SECOND()` | Extracts the second | `=SECOND(C36)` |
| `TIME()` | Creates a time from hour, minute, and second values | `=TIME(C37,C38,C39)` |
| `TIMEVALUE()` | Converts a recognized time string into a time serial number | `=TIMEVALUE(A49)` |

**Examples:**

```excel
=HOUR(C36)
```

```excel
=MINUTE(C36)
```

```excel
=SECOND(C36)
```

```excel
=TIME(C37,C38,C39)
```

```excel
=TIMEVALUE(A49)
```

**Useful shortcut:**

- `Ctrl + Shift + ;` inserts the current time as a fixed value in Excel.

**Applications:**
- Calculating working hours.
- Tracking attendance.
- Analyzing delivery durations.
- Measuring task completion time.

---

### 6. Excel Tables

An Excel table organizes related data into structured rows and columns.

**Shortcut to create a table:**

```text
Ctrl + T
```

**Features explored:**

- Creating tables from selected data.
- Sorting and filtering records.
- Using the Table Design tab.
- Applying table styles.
- Renaming tables.
- Resizing tables.
- Removing duplicate records.
- Converting tables back to ranges.
- Using slicers for interactive filtering.

#### Convert Table to Range

Select the table and use the Table Design tab to convert it back to a normal cell range.

#### Clear Formatting

Use the Clear Formats option to remove cell formatting. This removes formatting but does not necessarily convert the table into a normal range.

#### Slicers

Slicers provide clickable filters for Excel tables.

**Example:** A sales table can be filtered by region, product category, or salesperson using slicers.

Slicers are useful for interactive analysis, although they are not exactly the same as SQL `GROUP BY`.

#### Remove Duplicates

Use the Remove Duplicates option under the Table Design tools to remove duplicate records based on selected columns.

---

### 7. Conditional Formatting

Conditional Formatting highlights cells based on specified rules.

**Features covered:**

- Highlight Cell Rules.
- Top/Bottom Rules.
- Data Bars.
- Color Scales.
- Icon Sets.

**Examples of practical use:**

- Highlighting sales above a target.
- Identifying low-performing products.
- Comparing values using color scales.
- Displaying data bars to compare performance.
- Flagging records that require attention.

---

## 🛠️ Practical Work

The following files were used during Day 2 practice:

| File | Purpose |
|---|---|
| `day_2_drive_notes.txt` | Cell references, LOOKUP, VLOOKUP, named ranges, and MATCH |
| `day2 excel practice.txt` | Excel tables, slicers, and lookup formulas |
| `day2_class_notes.txt` | Conditional formatting, text functions, date functions, and time functions |
| `Excel Basics & Formula Practice - 1.xlsx` | Hands-on Excel formula and data manipulation practice |

---

## ✅ Day 2 Progress Checklist

- [x] Relative cell references.
- [x] Absolute cell references.
- [x] Mixed cell references.
- [x] LOOKUP function.
- [x] VLOOKUP function.
- [x] VLOOKUP exact and approximate matching.
- [x] VLOOKUP with named ranges.
- [x] VLOOKUP combined with MATCH.
- [x] Text functions: UPPER, LOWER, PROPER, CONCAT, TRIM, LEN, LEFT.
- [x] Date functions: TODAY, NOW, DAY, MONTH, YEAR, DATE, EDATE, DATEVALUE.
- [x] Time functions: HOUR, MINUTE, SECOND, TIME, TIMEVALUE.
- [x] Date arithmetic.
- [x] Creating and formatting Excel tables.
- [x] Sorting and filtering.
- [x] Slicers.
- [x] Removing duplicates.
- [x] Converting tables to ranges.
- [x] Conditional formatting.

---

## 💡 Key Takeaways

1. Cell references control how formulas behave when copied across worksheets.
2. LOOKUP and VLOOKUP retrieve corresponding information from datasets.
3. MATCH makes lookup formulas more dynamic by finding the position of a value.
4. Text functions help standardize and clean text data.
5. Date and time functions support time-based analysis.
6. Excel tables make structured datasets easier to manage.
7. Slicers provide interactive filtering for quick data exploration.
8. Conditional formatting makes important patterns easier to identify.

---

## 🚀 Next Steps

- Practice lookup formulas on larger datasets.
- Strengthen understanding of exact versus approximate matching.
- Explore XLOOKUP and INDEX-MATCH.
- Practice IF, SUMIF, SUMIFS, COUNTIF, and COUNTIFS.
- Learn PivotTables and PivotCharts.
- Apply Excel functions to real-world sales and business datasets.

---

## 📅 Learning Log

| Field | Details |
|---|---|
| Day | 02 |
| Subject | Excel Functions & Data Handling |
| Learning Mode | Theory + Hands-on Practice |
| Status | Completed |
| Goal | Strengthen Excel skills for Data Analytics |

**Consistency over perfection. One day, one lesson, one GitHub push at a time.** 💻📈