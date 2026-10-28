# 📊 Day 5 – Power BI Data Modelling: Star Schema & Snowflake Schema

## 📌 Overview

Day 5 focused on understanding and implementing **data modelling in Microsoft Power BI** using the Sample Superstore dataset.

The practical exercises covered fact tables, dimension tables, relationships, normalization, denormalization, and the differences between Star Schema and Snowflake Schema.

The objective was to understand how structured data models support efficient reporting, accurate analysis, and better dashboard development.

## 🛠️ Tools & Technologies

- **Microsoft Power BI Desktop** – Data modelling and report development
- **Sample Superstore Dataset** – Business sales data
- **Power BI Model View** – Creating and managing table relationships
- **Git & GitHub** – Version control and daily learning documentation

## 📚 Topics Covered

### 1. Introduction to Data Modelling

Data modelling involves organizing data into tables and defining relationships between them to support analysis and reporting.

**Benefits:**
- Simplifies report and dashboard development.
- Establishes meaningful relationships between tables.
- Reduces unnecessary data duplication.
- Improves data organization and reporting performance.
- Makes DAX calculations easier to manage.

### 2. Fact Tables

A fact table stores measurable business events or transactions and typically contains foreign keys linking to dimension tables.

**Example: `FACT_SALES`**

- Order ID
- Date Key
- Customer ID
- Product ID
- Location Key
- Sales
- Quantity
- Discount
- Profit

**Key learning:** Sales, Quantity, Discount, and Profit represent business measures, while the keys connect transactions to descriptive dimensions.

### 3. Dimension Tables

Dimension tables contain descriptive attributes used to filter, group, and analyze facts.

| Dimension | Example Attributes |
|---|---|
| `DIM_CUSTOMER` | Customer ID, Customer Name, Segment |
| `DIM_PRODUCT` | Product ID, Product Name, Sub-Category, Category |
| `DIM_DATE` | Date Key, Date, Month, Quarter, Year |
| `DIM_LOCATION` | Location Key, Country, State, City, Region |

### 4. Star Schema

A Star Schema consists of a central fact table directly connected to multiple dimension tables. Dimensions are generally denormalized.

**Conceptual structure:**

```text
                 DIM_DATE
                    |
                    |
DIM_CUSTOMER --- FACT_SALES --- DIM_PRODUCT
                    |
                    |
               DIM_LOCATION
```

**Advantages:**
- Simple and easy to understand.
- Requires fewer relationships between tables.
- Supports intuitive filtering and slicing.
- Makes report development and DAX calculations easier.
- Generally well suited to Power BI reporting.

**Practical work:** Created a Star Schema data model using the Sample Superstore dataset.

### 5. Snowflake Schema

A Snowflake Schema extends the Star Schema by normalizing dimensions into multiple related tables.

For example, product information can be divided into separate tables:

```text
FACT_SALES
    |
DIM_PRODUCT
    |
DIM_SUBCATEGORY
    |
DIM_CATEGORY
```

**Example structure:**
- `DIM_PRODUCT`: Product ID, Product Name, Sub-Category ID
- `DIM_SUBCATEGORY`: Sub-Category ID, Sub-Category, Category ID
- `DIM_CATEGORY`: Category ID, Category

**Advantages:**
- Reduces repeated descriptive information.
- Organizes hierarchical attributes into separate tables.
- Improves consistency when descriptive data is maintained centrally.

**Trade-offs:**
- Introduces more tables and relationships.
- Can make the model more complex.
- May require additional joins during analysis.

**Practical work:** Created a Snowflake Schema data model using the Sample Superstore dataset.

### 6. Star Schema vs Snowflake Schema

| Feature | Star Schema | Snowflake Schema |
|---|---|---|
| Structure | Simple | More complex |
| Dimensions | Generally denormalized | Normalized |
| Number of tables | Fewer | More |
| Relationships | Fewer | More |
| Data redundancy | Can be higher | Generally lower |
| Query complexity | Generally lower | Can be higher |
| Maintenance | Simpler for reporting | More involved |
| Power BI usability | Generally preferred | Useful in selected scenarios |

### 7. Normalization and Denormalization

**Normalization** organizes data into multiple related tables to reduce redundancy and improve consistency.

Example: Keeping Category and Sub-Category information in separate tables instead of repeating it for every product.

**Denormalization** keeps related descriptive information together to simplify querying and reporting.

Example: Storing Product Name, Sub-Category, and Category in one `DIM_PRODUCT` table.

Star Schemas generally use denormalized dimensions, while Snowflake Schemas normalize them into related tables.

### 8. Primary Keys, Foreign Keys & Relationships

- **Primary Key:** Uniquely identifies each record in a table.
- **Foreign Key:** Connects a record to another table.

Example:

```text
DIM_PRODUCT[Product ID]  (1)
             |
             |
             (*)
FACT_SALES[Product ID]
```

A single product can appear in multiple sales transactions, resulting in a one-to-many relationship.

For a typical Star Schema, dimension-to-fact relationships use **one-to-many (1:*) cardinality**, with single-direction filtering generally preferred unless another configuration is required.

### 9. Business Reporting Use Cases

The Superstore data model can support analysis such as:

- Sales by Category
- Profit by Region
- Sales by Customer Segment
- Monthly Sales Trends
- Quantity by Product
- Profit by State
- Sales by Shipping Mode

Example measures:

```dax
Total Sales = SUM(FACT_SALES[Sales])

Total Profit = SUM(FACT_SALES[Profit])

Total Quantity = SUM(FACT_SALES[Quantity])
```

These measures can be combined with descriptive fields from dimension tables to analyze business performance.

## 📂 Practice Files

| File | Description |
|---|---|
| `Day_5_Data_modelling.pbix` | General data modelling practice |
| `Day_5_Star_Schema.pbix` | Star Schema implementation |
| `Day_5_Snowflake_Schema.pbix` | Snowflake Schema implementation |
| `Superstore_Star_and_Snowflake_Schema_Notes.txt` | Detailed learning notes and examples |

## 🎯 Key Takeaways

- Understood the purpose of data modelling in Power BI.
- Differentiated between fact tables and dimension tables.
- Learned how Star and Snowflake Schemas organize business data.
- Understood normalization and denormalization.
- Practiced working with primary keys, foreign keys, and table relationships.
- Explored one-to-many relationships between dimensions and fact tables.
- Learned how data models support business reporting and DAX calculations.
- Understood why Star Schema is generally preferred for Power BI semantic models.

## 🚀 Learning Progress

Day 5 strengthened my understanding of data modelling and dimensional design, building a foundation for more advanced Power BI analytics and data warehousing concepts.

I am continuing to document my daily practical exercises and push my work to GitHub to maintain a consistent learning record.

---

**Learn. Practice. Build. Commit. Repeat.** 🚀
