SELECT * FROM finance_data.finance_data;

-- 1. List all respondents who invest in Government Bonds.
SELECT * FROM finance_data WHERE Avenue = 'Government Bonds'

-- 2. Show the Age and Stock_Market investment status (Yes/No) for each respondent.
 SELECT 
    Age,
    CASE 
        WHEN Investment_Avenues = 'Yes' THEN 'Yes'
        ELSE 'No'
    END AS Stock_Market_Status
FROM finance_data;  
-- 3.Find respondents whose savings objective includes ‘Retirement Plan’ and who invest in PPF.

SELECT 
    Age,
    Investment_Avenues
FROM finance_data
WHERE 
    "What are your savings objectives?" = 'Retirement Plan'
    AND Avenue LIKE '%PPF%';
    -- 4. Get all respondents who prefer Mutual Funds and expect returns between 20%-30%.
   SELECT 
    *
FROM finance_data
WHERE 
    Avenue = 'Mutual Fund'
      AND Expect BETWEEN '20%' AND '30%';
      
      -- 5 List respondents who have Stock Market investments and monitor their portfolios daily.
 SELECT 
    *
FROM finance_data
WHERE 
    Stock_Marktet = 'YES'
    AND Invest_Monitor= 'Daily';
-- 6. Count the number of respondents who invest in Gold.
  SELECT 
    COUNT(*) AS TotalRespondents
FROM finance_data
WHERE 
  Avenue = 'Gold';

-- 7. List respondents in order of Mutual Fund preference ranking from 1 to 7.

SELECT 
    *
FROM finance_data
WHERE 
   Avenue LIKE '%Mutual Fund%'
ORDER BY 
    Mutual_Funds ASC; 

-- 8. Sort all entries by expected returns from low to high.
SELECT 
    GENDER, 
    AGE, 
    EXPECT,
    CASE 
        WHEN CAST(REPLACE(EXPECT, '%', '') AS DECIMAL) < 20 THEN 'Low'   
        WHEN CAST(REPLACE(EXPECT, '%', '') AS DECIMAL) < 30  THEN 'High' 
        ELSE ' Very High'
    END AS Return_Category
FROM finance_data
ORDER BY 
    CAST(REPLACE(EXPECT, '%', '') AS DECIMAL) ASC;
    
    -- 9. Classify respondents into investment durations: 'Short-Term' (less than 3 years), 'Mid-Term' (3-5 years), and 'Long-Term' (more than 5 years).
SELECT 
    GENDER, 
    AGE, 
    EXPECT,
    CASE 
        WHEN Duration < 3 THEN 'Short-Term'    -- Assuming Investment_Duration is in years
        WHEN Duration BETWEEN 3 AND 5 THEN 'Mid-Term'
        ELSE 'Long-Term'
    END AS Investment_Duration_Category
FROM finance_data;
-- 10 List respondents who expect returns above 20%, invest in Equity Markets, and monitor investments at least weekly.
SELECT 
    *
FROM finance_data
WHERE 
    EXPECT > '20%'                     -- Expecting returns above 20%
    AND Avenue = 'Equity'  -- Investing in Equity Markets
    AND Invest_Monitor IN ('Weekly', 'Daily');  -- Monitoring investments at least weekly

-- 11. Group respondents by investment purpose and display only those purposes with more than 5 respondents.
SELECT 
    "What are your savings objectives?" AS Investment_Purpose,
    COUNT(*) AS Total_Respondents
FROM finance_data
GROUP BY "What are your savings objectives?"
HAVING COUNT(*) > 5;
-- 12. Calculate the average expected return for each investment avenue but only for avenues selected by at least 3 respondents.

SELECT 
    Avenue,
    AVG(Expect) AS Average_Expected_Return
FROM finance_data
WHERE 
    Expect LIKE '%'
GROUP BY Avenue
HAVING COUNT(*) >= 3;  -- Only include avenues with at least 3 respondents

