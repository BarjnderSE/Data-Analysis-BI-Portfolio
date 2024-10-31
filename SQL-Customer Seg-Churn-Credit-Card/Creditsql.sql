SELECT * FROM customercreditcardseg.bankchurners;

-- Customer Segmentation and Retention

   -- 1. Which age groups have the highest risk of attrition? --  customer leaving due to natural loss
SELECT 
    CASE 
        WHEN Customer_Age BETWEEN 18 AND 24 THEN '18-24'
        WHEN Customer_Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN Customer_Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN Customer_Age BETWEEN 45 AND 54 THEN '45-54'
        WHEN Customer_Age BETWEEN 55 AND 64 THEN '55-64'
        WHEN Customer_Age >= 65 THEN '65+'
        ELSE 'Unknown'
    END AS Age_Group,
    COUNT(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN 1 END) AS Attrited_Count,
    COUNT(CASE WHEN Attrition_Flag = 'Existing Customer' THEN 1 END) AS Existing_Count
FROM 
    customercreditcardseg.bankchurners
GROUP BY 
    Age_Group
ORDER BY 
    Attrited_Count desc;


SELECT 
    Age_Group,
    SUM(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN Customer_Count ELSE 0 END) AS Attrited_Count,
    SUM(CASE WHEN Attrition_Flag = 'Existing Customer' THEN Customer_Count ELSE 0 END) AS Existing_Count,
    CAST(SUM(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN Customer_Count ELSE 0 END) AS FLOAT) / 
    NULLIF(SUM(Customer_Count), 0) * 100 AS Attrition_Rate
FROM 
    AgeGroupCounts
GROUP BY 
    Age_Group
ORDER BY 
    Age_Group;
     
     -- 2. What percentage of customers with high revolving balances are at risk of leaving?
    SELECT 
    COUNT(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN 1 END) AS Attrited_Count,
    COUNT(*) AS Total_High_Balance_Count,
    (COUNT(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN 1 END) * 100.0 / COUNT(*)) AS Attrition_Percentage
FROM 
    customercreditcardseg.bankchurners
WHERE 
    Total_Revolving_Bal > 1000;    
    
    -- 3 Are single or married customers more likely to stay with the business?
     select
     Marital_Status,
     Count(*) as Total_customers,
     COUNT(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN 1 END) AS Attrited_Count,
     COUNT(CASE WHEN Attrition_Flag = 'Existing Customer' THEN 1 END) AS Existing_Count,
     (COUNT(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN 1 END) * 100/COUNT(*)) AS Attrition_Percentage
    FROM 
    customercreditcardseg.bankchurners
    GROUP BY Marital_Status;
    
    -- 4.How does attrition differ across income categories? Are higher-income customers more loyal?
    SELECT 
    CASE 
        WHEN Income_Category = 'Less than $40K' THEN '40K-'         -- Adjusting to match your Income_Category values
        WHEN Income_Category = '$40K - $60K' THEN '40K-60K'
        WHEN Income_Category = '$60K - $80K' THEN '60K-80K'
        WHEN Income_Category = '$80K - $120K' THEN '80K-120K'
        WHEN Income_Category = '$120K+' THEN '120K+'
        ELSE 'Unknown'
    END AS Income_Group,
    COUNT(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN 1 END) AS Attrited_Count,
    COUNT(CASE WHEN Attrition_Flag = 'Existing Customer' THEN 1 END) AS Existing_Count,
    (COUNT(CASE WHEN Attrition_Flag = 'Existing Customer' THEN 1 END) * 100.0 / COUNT(*)) AS Retention_Percentage
FROM 
    customercreditcardseg.bankchurnerS
GROUP BY 
    Income_Group
ORDER BY 
    Attrited_Count DESC;
    
    -- 5. Which card category (e.g., Blue) has the most active or inactive customers?
    
    SELECT 
    Card_Category,
    COUNT(CASE WHEN Attrition_Flag = 'Existing Customer' THEN 1 END) AS Active_Customers,
    COUNT(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN 1 END) AS Inactive_Customers
FROM 
    customercreditcardseg.bankchurnerS
GROUP BY 
    Card_Category
ORDER BY 
    Active_Customers DESC;  
    
    -- Product and Service Performance
   -- 6.Which card category generates the highest transaction volumes?
 SELECT * FROM customercreditcardseg.bankchurners;
 
 select  Card_Category, sum(Total_Trans_Ct) as TotalTransactions
   from customercreditcardseg.bankchurners
   group by card_category
   order by TotalTransactions desc;
   
   -- 7.How many months, on average, does it take for customers to establish a significant relationship with the business?
   
   SELECT 
    AVG(Months_on_Book) AS Avg_Months_to_Significant_Relationship
FROM 
    customercreditcardseg.bankchurners
WHERE 
    Total_Relationship_Count >= 4;
    -- Interpretation:

  --   35.85 months means that, on average, it takes almost 3 years for customers to establish a significant relationship with the business (defined as using at least 4 products/services).
  --  This suggests that building customer loyalty and deeper engagement takes time, and customers tend to develop stronger connections only after a long period.at least 4 products/services.
  -- Implications for Business:

--  Customer Engagement Strategies: If it takes nearly 3 years to reach a significant relationship, the business may want to introduce loyalty programs, incentives, or bundled services to accelerate this process.
 --   Early Monitoring: Identifying customers who are on track to build stronger relationships can help improve retention efforts early on.
  --  Churn Risk: If customers typically churn before reaching 36 months, focusing on boosting engagement earlier in their journey might reduce attrition.
  
  -- other thing Visualize the Progression of Relationships
  SELECT 
    Months_on_Book, 
    AVG(Total_Relationship_Count) AS Avg_Relationship_Count
FROM 
    customercreditcardseg.bankchurners
GROUP BY 
    Months_on_Book
ORDER BY 
    Months_on_Book;
    
    
    -- 8. Which income group shows the highest credit utilization ratio?
  SELECT 
    CASE 
        WHEN Income_Category = 'Less than $40K' THEN '40K-'         
        WHEN Income_Category = '$40K - $60K' THEN '40K-60K'
        WHEN Income_Category = '$60K - $80K' THEN '60K-80K'
        WHEN Income_Category = '$80K - $120K' THEN '80K-120K'
        WHEN Income_Category = '$120K+' THEN '120K+'
        ELSE 'Unknown'
    END AS Income_Group,
    truncate(AVG(Avg_Utilization_Ratio),2) AS Avg_Credit_Utilization
FROM 
    customercreditcardseg.bankchurners
GROUP BY 
    Income_Group
ORDER BY 
    Avg_Credit_Utilization DESC;
-- 9. What education levels are associated with the most transactions or spending?
 SELECT * FROM customercreditcardseg.bankchurners;
  
  SELECT 
    Education_Level, 
    SUM(Total_Trans_Amt) AS Total_Spending, 
    SUM(Total_Trans_Ct) AS Total_Transactions
FROM 
    customercreditcardseg.bankchurners
GROUP BY 
    Education_Level
ORDER BY 
    Total_Spending DESC;
   -- 10. What card type should we focus on promoting based on utilization and spending trends?
   
 SELECT 
    Card_Category, 
    truncate(AVG(Avg_Utilization_Ratio),2) AS Avg_Utilization_Ratio, 
    SUM(Total_Trans_Amt) AS Total_Spending
FROM 
    customercreditcardseg.bankchurners
GROUP BY 
    Card_Category
ORDER BY 
    Total_Spending DESC, Avg_Utilization_Ratio DESC;
     -- Promote Blue Cards for Revenue Growth:

    --Target promotions towards Blue cardholders, as they generate the highest revenue.
   -- Offer incentives to maintain engagement while encouraging responsible credit usage to reduce the risk of defaults.

-- Upsell Silver and Gold Cardholders:

    -- Since Silver and Gold users have low utilization, introduce reward programs to encourage more spending.
   -- Offer upgrades to Gold or Platinum cards with better perks to increase spending behavior.

-- Monitor Platinum Users:

  --  Platinum users have both low utilization and spending. Consider re-engaging them with exclusive benefits or downgrade options if they remain inactive.
  
   --  Customer Activity and Engagement
   -- 11. What is the average number of customer contacts before a transaction is made?
  
   select * from bankchurners
   
   select avg(Contacts_Count_12_mon)
   FROM 
    customercreditcardseg.bankchurners
WHERE 
    Total_Trans_Amt > 0
    
    -- 12. Which customers (by income or education level) are least likely to engage with us in the last 12 months?
    SELECT 
    Income_Category, 
    Education_Level, 
    AVG(Months_Inactive_12_mon) AS Avg_Inactive_Months
FROM 
    customercreditcardseg.bankchurners
GROUP BY 
    Income_Category, Education_Level
ORDER BY 
    Avg_Inactive_Months DESC;
    
    -- 13. Is there a correlation between contact frequency and retention? How many contacts are optimal to retain customers?
    SELECT 
    Contacts_Count_12_mon,
    COUNT(CASE WHEN Attrition_Flag = 'Existing Customer' THEN 1 END) AS Existing_Count,
    COUNT(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN 1 END) AS Attrited_Count,
    COUNT(*) AS Total_Count,
    (COUNT(CASE WHEN Attrition_Flag = 'Existing Customer' THEN 1 END) * 100.0 / COUNT(*)) AS Retention_Percentage
FROM 
    customercreditcardseg.bankchurners
GROUP BY 
    Contacts_Count_12_mon
ORDER BY 
    Contacts_Count_12_mon;
 


-- Interpretation

  --  High Retention with Fewer Contacts:
        Customers who have had 1 contact show a high retention percentage of 92.80%, indicating that even minimal engagement can be very effective.
        2 contacts also maintain a strong retention rate of 87.51%.

    Declining Retention with Increased Contacts:
        As the number of contacts increases to 3, 4, and beyond, the retention percentage begins to decline significantly.
        By the time customers reach 5 contacts, the retention percentage drops to 66.48%, and at 6 contacts, it plummets to 0%.

    Analysis of Attrition:
        The number of existing customers decreases as the number of contacts increases, while attrition increases. This suggests that too much contact might be perceived negatively by customers, leading to disengagement
-- 14. How does customer engagement (contacts and relationship count) vary across different age groups?
SELECT 
    CASE 
        WHEN Customer_Age < 25 THEN 'Under 25'
        WHEN Customer_Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN Customer_Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN Customer_Age BETWEEN 45 AND 54 THEN '45-54'
        WHEN Customer_Age BETWEEN 55 AND 64 THEN '55-64'
        WHEN Customer_Age >= 65 THEN '65 and older'
        ELSE 'Unknown'
    END AS Age_Group,
    AVG(Contacts_Count_12_mon) AS Avg_Contacts,
    AVG(Total_Relationship_Count) AS Avg_Relationship_Count
FROM 
    customercreditcardseg.bankchurners
GROUP BY 
    CASE 
        WHEN Customer_Age < 25 THEN 'Under 25'
        WHEN Customer_Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN Customer_Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN Customer_Age BETWEEN 45 AND 54 THEN '45-54'
        WHEN Customer_Age BETWEEN 55 AND 64 THEN '55-64'
        WHEN Customer_Age >= 65 THEN '65 and older'
        ELSE 'Unknown'
    END
ORDER BY 
    MIN(Customer_Age);  -- Order by the minimum age in the group


select * from bankchurners
    