SELECT * FROM finance_data.original_data;
-- 1. List all respondents who prefer to invest in Mutual Funds.
select Gender,Age,Investment_Factors,Preferred_Avenue,Monitor_Frequency from original_data
where Preferred_Avenue = 'Mutual Fund'

SELECT 
    Gender, 
    Age, 
    Investment_Factors, 
    Preferred_Avenue, 
    Monitor_Frequency, 
    COUNT(*) OVER () AS Total_Respondents
FROM original_data
WHERE Preferred_Avenue = 'Mutual Fund';


-- 2. Display the Age and Preferred_Avenue of each respondent.
  SELECT Gender, Age, Preferred_Avenue, COUNT(*) AS RespondentCount
FROM original_data
GROUP BY Gender, Age, Preferred_Avenue
ORDER BY Age;

-- 3.Get all respondents who have ranked Equity Market or Mutual Funds as their top investment avenue.
SELECT Gender, Age, Preferred_Avenue, Rank_EquityMarket, Rank_MutualFunds
FROM original_data
WHERE (Preferred_Avenue = 'Equity' AND Rank_EquityMarket = 1)
   OR (Preferred_Avenue = 'Mutual Fund' AND Rank_MutualFunds = 1);
   
   
   -- 4. Find the respondents who prefer Fixed Deposits and monitor their investments monthly
   SELECT Gender, Age, Preferred_Avenue,Reasons_FixedDeposits,Monitor_Frequency
   FROM original_data
   WHERE Monitor_Frequency = 'Monthly' AND Preferred_Avenue = 'Fixed Deposits'
   
-- 5. Retrieve all entries where respondents expect returns of 20%-30% and have a savings objective of Retirement Plan.
  SELECT Gender, Age, Preferred_Avenue,Expected_Return,Savings_Objectives
Monitor_Frequency
WHERE Expected_Return = '20%-30%' AND Savings_Objectives = 'Retirement Plan'

-- 6. Calculate the number of respondents for each Monitor Frequency (Daily, Weekly, Monthly).

SELECT Monitor_Frequency, COUNT(*) AS TotalRespondents
FROM original_data
GROUP BY Monitor_Frequency
ORDER BY TotalRespondents;

-- 7. Find the average expected return based on the preferred investment avenue.
     SELECT ROUND(AVG(Expected_Return), 2) AS AvgReturn, Preferred_Avenue
FROM original_data
GROUP BY Preferred_Avenue
ORDER BY AvgReturn DESC;

-- 8. Count how many respondents have chosen Equity Market as one of their top 3 ranks.
SELECT COUNT(*) AS totalrespondents,Preferred_Avenue
FROM original_data
WHERE Preferred_Avenue = 'Equity' AND Rank_EquityMarket <= 3;

-- 9. List all respondents sorted by age in descending order.
select  Gender, Age
FROM original_data
order by age desc
-- 10. Display the top 5 respondents who ranked Mutual Funds first.
SELECT *
FROM original_data
WHERE Preferred_Avenue = 'Mutual Fund' AND Rank_MutualFunds = 1
ORDER BY Age DESC  
LIMIT 5;

-- 11. Create a column that categorizes respondents into age groups: 'Young' (under ), 'Mid' (30), and 'Mature' (above ).
SELECT 
    Gender,
    Age,
    CASE 
        WHEN Age BETWEEN 18 AND 24 THEN 'Adult'
        WHEN Age BETWEEN 25 AND 29 THEN 'Young'
        WHEN Age BETWEEN 30 AND 34 THEN 'Mid'
        WHEN Age BETWEEN 35 AND 39 THEN 'Mature'
        ELSE 'Other'
    END AS Age_Group
FROM original_data;  


-- 12. Find the average expected return of respondents aged above 30.

SELECT 
    AVG(Expected_Return) AS avg_return
FROM original_data
WHERE Age > 30;

-- 13. List the respondents who chose ‘Wealth Creation’ as their investment purpose and also monitor their investments weekly.

SELECT * FROM finance_data.original_data;
SELECT 
    Gender,
    Age,
    Investment_Purpose,
    Monitor_Frequency
FROM original_data
WHERE 
    Investment_Purpose = 'Wealth Creation'
    AND Monitor_Frequency = 'Weekly';
original_dataoriginal_data