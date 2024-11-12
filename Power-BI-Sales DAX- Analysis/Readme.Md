# Power BI Sales Insights Dashboard

## Project Overview

This project is a Power BI dashboard that provides a comprehensive overview of sales insights by visualizing data from various sources. The objective is to analyze and report on key metrics such as Total Revenue, Gross Profit, and Units Sold, and to allow users to filter data by country, year, and month for deeper analysis. The project demonstrates skills in data cleaning, modeling, DAX calculations, and visualization, tailored to help in decision-making.

## Data Sources

The data used in this project comes from multiple files, each contributing essential information for the dashboard:

- **Sales Data (2014-2017)**: Yearly data in CSV files.
- **Categories**: Excel file detailing product categories.
- **Geography**: Excel file with geographic details.
- **Product**: Data fetched from MySQL database, providing product specifics.
- **Sales Representatives**: Excel file with sales rep information.
- **Subcategories**: Excel file with sub-category data.

## Project Steps

### 1. Data Loading and Preparation

- **Consolidated Sales Data**: Created a mechanism in Power BI to load all yearly sales files into a single Sales Fact Table.
- **Error Handling**: Ensured that adding or removing files from the folder does not break the data load.
- **Automatic Refresh**: Set up the model so new yearly files load automatically upon refresh.

### 2. Data Cleaning and Transformation

- **Location Splitting**: Separated "Country" from "City" in the Sales data to enable geographic insights.
- **Date Formatting**: Ensured a consistent date format for time-series analysis.
- **Key Creation**: Generated a unique key (`GeoKey`) for joining **Sales** and **Geography** tables.
- **ID Standardization**: Removed "ID -" prefixes from certain columns in **SalesRep** and **SubCategory** tables.

### 3. Data Modeling

- Established relationships among tables, creating a cohesive data model.
- Linked all tables with a **Calendar Table** for time-based insights.

### 4. DAX Calculations

Implemented the following DAX measures for analytical insights:

```DAX
1. DateMaster = CALENDAR(FIRSTDATE('Sales 2014 to 2017'[Date]), LASTDATE('Sales 2014 to 2017'[Date]))
2. DAY = DAY(DateMaster[Date])
3. Month = MONTH(DateMaster[Date])
4. QTR = QUARTER(DateMaster[Date])
5. Week Day = WEEKDAY(DateMaster[Date])
6. Week Day Name = FORMAT(DateMaster[Date], "DDD")
7. Week Num = WEEKNUM(DateMaster[Date])

-- Additional Measures
8. Total Revenue = SUMX('Sales', 'Sales'[Retail Price] * 'Sales'[Units])
9. Total Cost = SUMX('Sales', 'Sales'[Standard Cost] * 'Sales'[Units])
10. Gross Profit = [Total Revenue] - [Total Cost]
11. Gross Profit MoM Change % = ( [Gross Profit] - PREVIOUSMONTH([Gross Profit]) ) / PREVIOUSMONTH([Gross Profit])
12. Average Sales per Day = AVERAGEX(VALUES(DateMaster[Date]), [Total Revenue])
13. QoQ Growth = ( [Total Revenue] - SAMEQTR(PREVIOUSQUARTER([Total Revenue])) ) / SAMEQTR(PREVIOUSQUARTER([Total Revenue]))


### 5. Dashboard Visualizations

The dashboard offers an interactive interface to view sales data with various visuals:

- **KPI Cards**: Highlights for Total Revenue, Gross Profit, and Units Sold.
- **Pie Charts**: Visualize Gross Profit by Product and Revenue by Subcategory.
- **Bar Charts**: Show revenue breakdown by SalesRep and Product.
- **Line and Column Charts**: Display revenue trends over time.

### 6. Key Insights

- **Revenue Trends**: The dashboard provides a view of revenue changes over time, segmented by year and product.
- **Sales by Region**: Geographic insights enable comparison of sales performance across different countries.
- **Product Analysis**: Gross profit and revenue breakdowns by product and subcategory help identify top performers.
- **Sales Performance**: Monthly and quarterly growth metrics offer insights into sales trends and help with forecasting.



