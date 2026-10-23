# Power BI Learning — Day 1

## 📌 Overview
Day 1 focused on the fundamentals of **Microsoft Power BI**, its desktop interface, the standard reporting workflow, and connecting data from different sources. The practical files for this session use the **Sample - Superstore** dataset.

## 📚 Topics Covered

### 1. Introduction to Business Intelligence (BI)
- What Business Intelligence means and how it supports business decision-making.
- Using data to understand past performance, monitor current status, and identify future trends.
- Introduction to Power BI as Microsoft's business intelligence and data visualization tool.
- Key Power BI features: data connectivity, interactive visuals, data modeling, Power Query, and sharing.

### 2. Power BI Ecosystem
- **Power BI Desktop:** Build reports, load and transform data, and create data models.
- **Power BI Service:** Publish and share reports online.
- **Power BI Mobile:** View reports on mobile devices.
- **Power BI Report Server:** Host reports on an organization's own infrastructure.
- Introduction to Desktop, Pro, and Premium licensing.

### 3. Power BI Desktop Interface
- **Report View:** Build and format visuals, charts, cards, filters, and slicers.
- **Table/Data View:** Inspect loaded data, values, and data types.
- **Model View:** Manage table relationships, cardinality, and filter direction.
- **DAX / Formula Bar:** Write expressions for measures and calculated columns.
- Familiarization with the Visualizations, Data/Fields, Filters, and Format panes.

### 4. Power BI Architecture and Workflow
The basic flow covered in the learning material:

`Data Source → Power Query → Data Model → DAX → Reports → Power BI Service`

Typical workflow:
1. Connect to a data source.
2. Clean and transform data in Power Query.
3. Create relationships in Model View.
4. Create calculations using DAX.
5. Build visuals and reports.
6. Apply filters, slicers, and formatting.
7. Publish to Power BI Service.

### 5. Import Mode vs DirectQuery
- **Import Mode:** Data is copied into Power BI; reports generally perform faster, and source changes require a refresh.
- **DirectQuery:** Data remains in the source system, and Power BI queries the source when needed; useful for certain large or frequently updated database scenarios.

### 6. Connecting Data Sources
Reviewed the main source categories and connection workflows:
- **Files:** Excel, CSV, text, XML, and JSON.
- **Databases:** SQL Server, MySQL, PostgreSQL, and Oracle.
- **Online and cloud sources:** Web pages, SharePoint, OneDrive, and Azure SQL Database.

Connection steps covered:
- Excel: `Get Data → Excel → Select workbook/sheet → Load or Transform Data`
- CSV/Text: `Get Data → Text/CSV → Select file → Check delimiter → Load or Transform`
- Web: `Get Data → Web → Enter URL → Select available table → Transform if needed`
- MySQL: Select the MySQL connector, enter server/database details, choose a connection mode, and select tables. The learning material notes that the required MySQL connector and ODBC driver may need to be installed.

## 🛠️ Practice Files
- `Day_1_Intro_to_PowerBi.docx` — Day 1 learning notes.
- `Sample - Superstore.xlsx` — Sample dataset used for practice.
- `Day_1_data_loading.pbix` — Power BI Desktop practice file for data loading.

## 💡 Key Takeaways
- Power BI helps turn raw data into interactive reports that support business decisions.
- Power Query is used to clean and transform data before reporting.
- The data model and relationships affect report quality and DAX calculations.
- Import Mode and DirectQuery differ in where data is stored and how queries are handled.
- Choosing **Transform Data** allows data to be checked and cleaned before loading.
- The correct delimiter matters when importing CSV or text files.

## 🎯 Interview Revision
1. What is Business Intelligence?
2. What is Power BI, and what is it used for?
3. What is the difference between Power BI Desktop and Power BI Service?
4. What are the main views in Power BI Desktop?
5. What is the role of Power Query?
6. What is the difference between Import Mode and DirectQuery?
7. What is Model View used for?
8. What are visual-level, page-level, and report-level filters?
9. What are common data sources supported by Power BI?
10. Why should data be cleaned before creating visuals?

## 📅 Learning Log
- **Day:** 1
- **Tool:** Microsoft Power BI Desktop
- **Focus:** BI fundamentals, interface, workflow, data sources, and data loading
- **Status:** Completed Day 1 learning and practice materials

---
*Part of my daily learning and GitHub push practice. Each day's folder/repository update records the topics studied and the practical files created.*
