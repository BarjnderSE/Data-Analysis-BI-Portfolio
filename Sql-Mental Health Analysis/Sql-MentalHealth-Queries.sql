SELECT * FROM mentalhealth.mental_health_dataset;

-- 1 Average  age of Stress Level by Occupation:
SELECT AVG(age) AS average_age, occupation,stress_level
FROM mentalhealth.mental_health_dataset
GROUP BY occupation,Stress_Level
-- 2. How many people have reported having a mental health condition, broken down by country?
select count(*) as NumberofPeople,country
from mentalhealth.mental_health_dataset
where Mental_Health_Condition ='yes'
group by country

-- 3.  What is the average number of sleep hours per day for each gender?
select truncate(avg(sleep_hours),2) as avgsleephours,gender
from mentalhealth.mental_health_dataset
group by gender

-- 4. What are the total work hours for different age groups (e.g., 30-40, 41-50, etc.)?
  SELECT 
  SUM(Work_Hours) AS totalworkhours,
  CASE
    WHEN age BETWEEN 30 AND 40 THEN '30-40'
    WHEN age BETWEEN 41 AND 50 THEN '41-50'
    WHEN age BETWEEN 51 AND 60 THEN '51-60'
    ELSE '60+'
  END AS age_range
FROM mentalhealth.mental_health_dataset
GROUP BY age_range;
-- 5. Is there any relationship between physical activity hours and the amount of sleep per person? 
SELECT Physical_Activity_Hours, 
       TRUNCATE(AVG(Sleep_Hours), 2) AS Average_Sleep_Hours
FROM mentalhealth.mental_health_dataset
GROUP BY Physical_Activity_Hours;

-- 6. What percentage of people with mental health conditions have a high severity level?
SELECT 
  (COUNT(*) / (SELECT COUNT(*) FROM mentalhealth.mental_health_dataset WHERE Mental_Health_Condition = 'yes')) * 100 AS Percentage_High_Severity
FROM mentalhealth.mental_health_dataset
WHERE Severity = 'High' AND Mental_Health_Condition = 'yes';


SELECT
  (COUNT(CASE WHEN Severity = 'High' THEN 1 END) / COUNT(*)) * 100 AS High_Severity_Percentage
FROM mentalhealth.mental_health_dataset
WHERE Mental_Health_Condition = 'Yes';

-- 7.What is the average stress level of people who have consulted a healthcare professional versus those who have not?
SELECT Consultation_History, AVG(Stress_Level) AS Average_Stress_Level
FROM mentalhealth.mental_health_dataset
GROUP BY Consultation_History;
-- 8. How do work hours vary between people with and without mental health conditions?

select avg(work_hours) as averageworkhours,Mental_Health_Condition
FROM mentalhealth.mental_health_dataset
GROUP BY Mental_Health_Condition;

-- 9. What is the relationship between occupation and physical activity hours? Which occupation has the highest physical activity hours on average?
SELECT Occupation, AVG(Physical_Activity_Hours) AS Average_Physical_Activity_Hours
FROM mentalhealth.mental_health_dataset
GROUP BY Occupation
ORDER BY Average_Physical_Activity_Hours DESC;
-- 10. Which countries have the highest number of people reporting mental health conditions?
SELECT Country, COUNT(*) AS Mental_Health_Condition_Count
FROM mentalhealth.mental_health_dataset
WHERE Mental_Health_Condition = 'Yes'
GROUP BY Country
ORDER BY Mental_Health_Condition_Count DESC;
-- 11. What is the average sleep hours of people with varying work hours?
SELECT Work_Hours, AVG(Sleep_Hours) AS Average_Sleep_Hours
FROM mentalhealth.mental_health_dataset
GROUP BY Work_Hours
ORDER BY Work_Hours;
