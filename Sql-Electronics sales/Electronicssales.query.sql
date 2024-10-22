-- Customer-Related Questions

-- 1. How many customers registered in the year 2022?
SELECT COUNT(*) AS CustomersRegistered 
FROM customers
WHERE YEAR(registration_date) = 2022;

-- 2. List the full names and emails of all female customers.
SELECT CONCAT(first_name, ' ', last_name) AS full_name, email 
FROM customers 
WHERE gender = 'female';

-- 3. What is the total number of customers?
SELECT COUNT(*) 
FROM customers;

-- Product-Related Questions

-- 4. Product List: What are the names and prices of all products in the 'Electronics' category?
SELECT * 
FROM products 
WHERE category = 'Electronics';

-- 5. Stock Check: Which products have a stock quantity of less than 100?
SELECT * 
FROM products 
WHERE stock_quantity < 100;

-- 6. Average Price: What is the average price of all products?
SELECT AVG(price) 
FROM products;

-- Sales Order Questions

-- 7. Total Sales: What is the total sales amount for the year 2023?
SELECT SUM(total_amount) AS total_sales 
FROM sales_orders 
WHERE YEAR(order_date) = 2023;

-- 8. Orders by Payment Method: How many orders were made using each payment method?
SELECT COUNT(*) AS total, payment_method 
FROM sales_orders 
GROUP BY payment_method;

-- 9. High-Value Customers: Which customer made the highest single order amount, and what was that amount?
-- (Query not provided, needs to be added)

-- Order Details Questions

-- Product Sales: How many units of each product were sold in total?
SELECT * 
FROM order_details;

-- Order Details: Which orders contained the 'Laptop' product?
SELECT o.product_id, p.product_name
FROM order_details AS o
JOIN products AS p 
ON o.product_id = p.product_id
WHERE p.product_name = 'Laptop';

-- Aggregation and Analysis Questions

-- 10. Monthly Sales Trends: What were the total sales amounts for each month in 2023?
SELECT SUM(total_amount) AS totalsales_month, MONTH(order_date) AS month
FROM sales_orders
GROUP BY MONTH(order_date);

-- 11. Customer Spending: Who are the top 3 customers by total spending?
SELECT 
    c.customer_id, 
    c.first_name, 
    c.last_name, 
    SUM(s.total_amount) AS total_spending
FROM 
    customers AS c
JOIN 
    sales_orders AS s 
ON 
    c.customer_id = s.customer_id
GROUP BY 
    c.customer_id, c.first_name, c.last_name
ORDER BY 
    total_spending DESC
LIMIT 3;

-- 12. Average Order Size: What is the average number of items per order?
SELECT 
    AVG(item_count) AS average_items_per_order
FROM (
    SELECT 
        order_id, 
        SUM(quantity) AS item_count
    FROM 
        order_details
    GROUP BY 
        order_id
) AS order_item_counts;
