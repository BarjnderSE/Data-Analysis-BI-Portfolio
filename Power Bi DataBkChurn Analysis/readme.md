# Bank Churn Analysis: Power BI Reporting Process

## Overview
This document outlines the steps followed in creating the **Bank Churn Analysis** Power BI report. The goal was to build an accurate, visually appealing, and secure report with insightful metrics for stakeholders. Below are the steps I took to complete the project.

## Steps Followed in the Power BI Reporting Process

### 1. **Business Requirement Document (BRD)**
   - **Objective**: Defined the business objectives and reporting needs, ensuring clear understanding of goals and KPIs.
   - ![image](https://github.com/user-attachments/assets/9e85ed3a-d486-4f60-820f-c316cbda3b1f)
   - ![image](https://github.com/user-attachments/assets/c75b59b0-37f7-443c-8d68-8a7359a50428)



### 2. **Data Gathering**
   - **Objective**: Collected data from relevant sources such as Excel and CSV files for the Bank Churn dataset.

### 3. **Data Cleaning / Data Transformation**
   - **Objective**: Cleaned and transformed the raw data for accuracy and usability.
   - 
### 4. **Data Modelling**
   - **Objective**: Created relationships between tables to establish a structured data model.
   - **Outcome**: Ensured efficient data processing and accurate reporting.
   - ![image](https://github.com/user-attachments/assets/479327a9-5f10-42b6-944a-6aa741526294)

### 5. **UI (Power View Reports)**
   - **Objective**: Designed the user interface and created initial reports with visualizations such as charts, tables, and KPIs.
   - **Outcome**: Developed functional and clear reports for stakeholders.

### 6. **DAX Functions**
   - **Objective**: Implemented DAX for advanced calculations and analysis.
   - **What I Did**:
     - Created a **Date Master** table with separate columns for Year, Date, and MonthName to structure the data.
     - Applied DAX formulas to clean and calculate key metrics, including:
       - **Year** = `YEAR(DateMaster[Date])`
       - **Month** = `MONTH(DateMaster[Date])`
       - **MonthName** = `FORMAT(DateMaster[Date], "MMM")`
     - Created a **Calculation Table** for all important DAX formulas for KPIs:
       - **Active Customers** = `CALCULATE( COUNT(Bank_Churn[CustomerId]), ActiveCustomer[ActiveCategory] = "Active Member")`
       - **Churn%** = `DIVIDE([ExitCustomerss], [TotalCustomers])`
       - **Credit Card Holders** = `CALCULATE(COUNT(Bank_Churn[CustomerId]), CreditCard[Category] = "Credit Card Holder")`
       - **ExitCustomerss** = `CALCULATE([TotalCustomers], ExitCustomers[ExitCategory] = "Exit")`
       - **Inactive Customers** = `CALCULATE(COUNT(Bank_Churn[CustomerId]), ActiveCustomer[ActiveCategory] = "Inactive Member")`
       - **NonCreditCardHolders** = `[TotalCustomers] - [Credit Card Holders]`
       - **PreviousMonthExitCustomers** = `CALCULATE([ExitCustomerss], PREVIOUSMONTH(DateMaster[Date]))`
       - **RetainCustomers** = `[TotalCustomers] - [ExitCustomerss]`
       - **TotalCustomers** = `CALCULATE(COUNT(Bank_Churn[CustomerId]))`

   - **Outcome**: Cleaned and transformed KPIs.
   - ![image](https://github.com/user-attachments/assets/255acef3-336d-4051-8b5d-a7e6d6463d67)
   - ![image](https://github.com/user-attachments/assets/36462c01-659d-42d9-844e-ed9e0f6737ee)
   - ![image](https://github.com/user-attachments/assets/12a32041-8c66-4572-9855-4100ffe774a9)
   - ![image](https://github.com/user-attachments/assets/5aace577-7f76-4c43-aeb4-91c71a12a8c2)

   

### 7. **Enhance UI**
   - **Objective**: Improved the report’s aesthetics and usability with better layouts, tooltips, and interactivity.
   - **Outcome**: Created an intuitive and visually appealing Power BI report.
   - ![image](https://github.com/user-attachments/assets/c0d065f9-1360-4403-9dbd-a215c745980c)
   - add right arow to go to next view by ctrl and click
     Added filters for better visualizatuion by year,month,category and more
![image](https://github.com/user-attachments/assets/46a8ff30-c353-477a-8bdb-5e7447a782b0)


### 8. **Row-Level Security (RLS)**
   - **Objective**: Configured RLS to ensure users only see data they are authorized to access.
   - **Outcome**: Secured report views based on user roles and data access permissions.
   ![image](https://github.com/user-attachments/assets/d665166f-1ed2-4e96-8a68-d5fdfdfee64e)
![image](https://github.com/user-attachments/assets/af8f26e1-4f26-443a-a292-b992a8db243d)
![image](https://github.com/user-attachments/assets/00c96ef1-ce3d-47b8-85fb-2e268b6f8553)


### 9. **Create Workspace and Provide Access**
   - **Objective**: Set up a Power BI workspace and assigned user access.
   - **Outcome**: Created a secure shared environment for stakeholders to access the report.

### 10. **Publish the Report to the Workspace**
   - **Objective**: Published the completed report to the Power BI workspace.
   - **Outcome**: The report is now available for users to view and interact with.

### 11. **Schedule a Refresh**
   - **Objective**: Configured data refresh schedules to keep the report updated.
   - **Outcome**: Automated data refreshes based on the defined schedule.

### 12. **Add Roles to Security**
   - **Objective**: Assigned roles and permissions to control access within the report.
   - **Outcome**: Users were granted specific roles to access relevant data.

### 13. **Subscribe, Manage Alerts**
   - **Objective**: Set up subscriptions and alerts to keep stakeholders informed of important updates.
   - **Outcome**: Automated notifications for users when key metrics change.

---![image](https://github.com/user-attachments/assets/8e4a04cd-6bad-4126-b9ab-40a459eec5f7)

To analyze the provided report for Churn Analysis, let's break down the key components and what they indicate:
Key Metrics

    Total Customers: 10K
        The total number of customers in the dataset.

    Retained Customers: 7963
        Indicates the number of customers who have remained with the service.

    Non-Credit Holders: 2945
        Customers who do not hold credit accounts.

    Inactive Customers: 2037
        Represents customers who are no longer active.

    Active Customers: 5111
        Total number of customers currently engaged with the service.

    Exit Customers: 4849
        Customers who have exited or stopped using the service.

    Credit Card Holders: 7055
        Customers who hold credit cards, indicating a potential segment of interest for retention strategies.

Visualizations

    Inactive and Active Customers by Year:
        A bar chart likely showing the trend of inactive versus active customers over the years. Analyzing this can help identify patterns in customer engagement.

    Exit Customers by Gender:
        A visual representation (possibly a pie chart or bar graph) breaking down exit customers by gender. This can help understand demographic factors influencing churn.

    Exit Customers by Credit Type:
        Shows how exit customers are categorized based on their credit types. This can highlight particular groups that may require targeted retention efforts.

    Count of Exit Customers by Category:
        A detailed view of exit customers segmented into different categories, which can help identify specific areas for improvement.

Analysis Insights

    Churn Rate:
        Calculate the churn rate using the formula:
        Churn Rate=Exit CustomersTotal Customers×100
        Churn Rate=Total CustomersExit Customers​×100
        This rate provides insight into customer retention effectiveness.

    Retention Opportunities:
        With a significant number of retained customers (7963), strategies should focus on understanding why 2037 customers became inactive, especially if they were previously active.

    Demographic Insights:
        The breakdown by gender and credit type can reveal trends and help in tailoring marketing and retention strategies more effectively.

    Time Trends:
        Analyzing the year-over-year trends can help identify whether customer retention strategies are improving or declining.

Recommendations

    Explore Reasons for Inactivity:
        Conduct surveys or interviews with inactive customers to understand their reasons for leaving.

    Targeted Marketing:
        Use insights from gender and credit type analyses to develop targeted marketing campaigns aimed at retaining specific segments.

    Improve Customer Engagement:
        Implement loyalty programs or incentives for active customers to convert them into retained customers.

    Regular Monitoring:
        Set up regular reviews of churn metrics to adapt strategies promptly as trends change.



## Conclusion
Following these steps, I successfully created a Power BI report for **Bank Churn Analysis** that meets business objectives, provides actionable insights, and ensures data security. This process enabled the development of a visually appealing, interactive, and reliable reporting solution.
