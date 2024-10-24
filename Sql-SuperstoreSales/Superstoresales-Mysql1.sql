-- Basic SELECT Query:
-- 1.Write a query to display all records from the supermarket_sales table.
select * from ss;
-- 2. Retrieve all sales transactions from the branch 'A'.
 select * from ss where branch='A';
 -- 3. Display all sales records where the city is 'Yangon' and the customer_type is 'Member'.--
 SELECT * FROM ss WHERE CITY = 'Yangon' AND CustomerType = 'Member';
-- 4 . List all sales transactions sorted by total in descending order.
SELECT * FROM ss order by total desc;
-- 5.Show the first 5 transactions that were paid by 'Cash'.
select * from ss where payment = 'Cash' limit 5;

-- 6. Retrieve all sales that occurred between '2019-01-01' and '2019-03-31'.
select * from ss where date  between '01-01-2019' and  '03-31-2019';
-- 7.Find all records where the payment method is 'Ewallet'.
select * from ss where payment ='Ewallet';
-- 8.Search for all sales transactions where the invoice_id starts with '750'.
SELECT * 
FROM ss
WHERE invoiceid LIKE '750%';
-- 9. Count how many transactions were made by 'Normal' customers.
SELECT COUNT(*) AS transaction_count
FROM ss
WHERE customertype = 'normal';
-- 10. Count the number of sales made in each city.
select branch,city,count(*) as Totalcount from ss
group by 1,2;
-- 11 Calculate the total sales (total) generated by each branch.
select * from ss;

    SELECT branch, CEIL(SUM(total)) AS TotalSales
    FROM ss
    GROUP BY branch;
    
   
-- 12 Find branches where the total sales exceeded 10,000.
	SELECT branch, SUM(total)AS TotalSales
FROM ss
GROUP BY branch
HAVING CEIL(SUM(total)) > 10000;
-- 13 Show the average rating per product line.
SELECT PRODUCTLINE, AVG(RATING) AS ARATING
FROM ss
GROUP BY PRODUCTLINE;
-- 14 Find the maximum and minimum gross_income for each customer_type.
SELECT CUSTOMER_TYPE, MAX(GROSSINCOME) AS MaxIncome, MIN(GROSSINCOME) AS MinIncome
FROM ss
GROUP BY CUSTOMER_TYPE;

-- 15  Write a query to display the total sales (total) and the calculated profit (which is gross_income) for each sale, with proper aliasing.
	SELECT * FROM SS
    SELECT 
    SUM(sale_amount) AS total_sales, 
    (SUM(sale_amount) - SUM(cost_amount)) AS gross_income 
FROM 
    sales
GROUP BY 
    sale_id;
-- 16 Extract the month from the date field and show total sales grouped by month.
SELECT 
    MONTH(date) AS sale_month, 
     SUM(total) AS total_sales 
FROM 
    ss
GROUP BY 
    MONTH(date)
ORDER BY 
    ss;
-- 17 Write a query to display all transactions where the total is greater than the average total sales of all transactions.

SELECT *
FROM ss
WHERE total > (SELECT AVG(total) FROM ss)


