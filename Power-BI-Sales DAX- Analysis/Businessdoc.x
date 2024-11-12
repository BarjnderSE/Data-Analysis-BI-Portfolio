Business / Functional Requirement Document

Project Title: Sales Insights Dashboard
Prepared For: Stakeholders & Decision-Makers
Prepared By: Singh
Project Overview

The goal of this project is to create a comprehensive, interactive Sales Insights Dashboard that will enable stakeholders to easily visualize and analyze key sales metrics on a single page. This dashboard will use dynamic visuals to reveal trends, support strategic decisions, and highlight critical insights based on the data provided.
Requirements
1. Data Gathering and Ingestion

The following data sources will be used to build the dashboard:

    Sales Data (Folder by Year): Multiple yearly sales files.
    Categories (Excel): Contains product categories.
    Geography (Excel): Details geographic data.
    Product (CSV / Database): Includes product details and pricing.
    Sales Representatives (Excel): Information on sales representatives.
    Subcategories (Excel): Product subcategories.

Task 1.1: Data Loading Mechanism

Create an automated and resilient data-loading mechanism to populate a single Sales Fact Table:

    Add New Files: Automatically loads new yearly sales files upon refresh without configuration changes.
    Remove Files: If files are missing, data loading remains functional, without causing errors.

2. Data Modeling

The data will undergo a series of transformations to prepare it for visualization.
Task 2.1: Location Splitting

    Split the Country and City fields from the "Location" column in the Sales Fact Table.
    Ensure Geo Mapping Compatibility by setting the correct data types for Country and City fields.

Task 2.2: Unique Key Creation

    Generate a unique GeoKey to unify the Sales and Geography tables for seamless data linkage.

Task 2.3: ID Cleanup

    Create a reusable function to remove the “ID - ” prefix from IDs in SalesRep and SubCategory tables. This function should be invoked in both tables to standardize the ID columns.

Task 2.4: Data Model Structure

    Establish relationships between all tables, ensuring the data model is optimized for analysis.
    Use the Calendar Table to enable time-based calculations.

3. DAX Calculations

Implement the following DAX calculations for detailed insights:
Task 3.1: Total Revenue

    Calculate Total Revenue by multiplying each product’s Retail Price by the Units Sold in the Sales Table.

Task 3.2: Total Cost

    Calculate Total Cost by multiplying each product’s Standard Cost by the Units Sold in the Sales Table.

Task 3.3: Gross Profit

    Compute Gross Profit as Total Revenue - Total Cost.

Task 3.4: Month-on-Month (MoM) Gross Profit Growth %

    Create a MoM Gross Profit Growth % measure to monitor monthly changes and support trend analysis.

Task 3.5: Average Sales per Day

    Calculate the Average Sales per Day by dividing the Total Revenue by the actual sales days.

Task 3.6: Product Analysis Metrics

For strategic analysis, include the following metrics:

    Product Drop or Increase Analysis based on previous periods.
    Quarter-on-Quarter (QoQ) Growth Rate as this is a Quarterly Business Report (QBR).

4. Dashboard Assembly

Using the calculated measures, create an intuitive, one-page Sales Insights Dashboard with the following specifications:

    Comprehensive Visuals: Use charts, graphs, and tables to represent insights effectively.
    Time-Sorted Visuals: Ensure months are sorted from January to December when plotting time-based data.
  
    KPI Indicators: Include KPI indicators for revenue, costs, profit, and growth rates to highlight key metrics at a glance.

This dashboard will empower stakeholders to understand trends, identify growth opportunities, and make data-driven decisions efficiently.
