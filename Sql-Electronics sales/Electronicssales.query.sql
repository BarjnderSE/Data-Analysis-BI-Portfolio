SELECT * FROM saleselectornics.customers;

-- 1. How many customers registered in the year 2022?
select  count(*) as CustomersRegistered from customers
where year(registration_date) =2022;
-- 2. List the full names and emails of all female customers.
select concat(first_name, last_name),email as full_name from customers
where gender = 'female'

-- 3 What is the total number of customers?
 select count(*) from customers;
 -- Product-Related Questions

   -- 4 Product List: What are the names and prices of all products in the 'Electronics' category?
   select * from products where category ='Electronics'
   -- 5. Stock Check: Which products have a stock quantity of less than 100?
      select * from products where stock_quantity<100
    -- 6. Average Price: What is the average price of all products?
     select avg(price) from products

-- Sales Order Questions

   -- 7. Total Sales: What is the total sales amount for the year 2023?
     select * from sales_orders
     select sum(total_amount) as total_sales from sales_orders where year(order_date) = 2023
     
   -- 8. Orders by Payment Method: How many orders were made using each payment method?
          select  count(*),payment_method total from sales_orders group by payment_method
   -- 9.   High-Value Customers: Which customer made the highest single order amount, and what was that amount?
		
-- Order Details Questions

  
    select  * from order_details
    
    Product Sales: How many units of each product were sold in total?
  
  
    Order Details: Which orders contained the 'Laptop' product?
           select o.product_id,p.product_name
           from order_details as o
           join products as p 
           on o.product_id =p.product_id
           where p.product_name='laptop'
-- Aggregation and Analysis Questions

    -- 10. Monthly Sales Trends: What were the total sales amounts for each month in 2023?
    select * from sales_orders
    select sum(total_amount) as totalsales_month,month(order_date) as month
    from sales_orders
    group by month(order_date)
   -- 11. Customer Spending: Who are the top 3 customers by total spending?
    select * from customers
    select * from sales_orders
    
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
 -- 12.   Average Order Size: What is the average number of items per order?
     
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


   