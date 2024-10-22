CREATE DATABASE ecommerce;
USE ecommerce;


-- Customers Table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    phone_number VARCHAR(20),
    city VARCHAR(50),
    country VARCHAR(50),
    join_date DATE
);

-- Products Table
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2),
    stock_quantity INT
);

-- Orders Table
-- Orders Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2)  -- DECIMAL(10, 2) allows up to 10 digits total, with 2 digits after the decimal point
);

-- OrderDetails Table
CREATE TABLE OrderDetails (
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10, 2),       -- Price per unit of the product
    total_price DECIMAL(10, 2), -- Total price for the order (quantity * price)
    PRIMARY KEY (order_id, product_id), -- Composite primary key (order_id, product_id)
    FOREIGN KEY (order_id) REFERENCES Orders(order_id), -- Foreign key referencing Orders table
    FOREIGN KEY (product_id) REFERENCES Products(product_id) -- Foreign key referencing Products table
);
    -- Payments Table
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,         -- Primary key for the payment
    order_id INT,                       -- Foreign key referencing Orders table
    payment_date DATE,                  -- Date of payment
    payment_method VARCHAR(50),         -- Payment method (Credit Card, PayPal, etc.)
    amount DECIMAL(10, 2),              -- Amount paid
    FOREIGN KEY (order_id) REFERENCES Orders(order_id) -- Foreign key referencing Orders table
);
INSERT INTO Customers (customer_id, customer_name, email, phone_number, city, country, join_date)
VALUES 
(1, 'John Doe', 'john@example.com', '555-1234', 'New York', 'USA', '2020-01-15'),
(2, 'Jane Smith', 'jane@example.com', '555-5678', 'Los Angeles', 'USA', '2019-05-23'),
(3, 'Michael Johnson', 'mike.j@example.com', '555-8765', 'Chicago', 'USA', '2021-07-11'),
(4, 'Emily Davis', 'emily.d@example.com', '555-4321', 'Houston', 'USA', '2022-09-30'),
(5, 'Sarah Wilson', 'sarah.w@example.com', '555-6789', 'Boston', 'USA', '2021-03-10');
INSERT INTO Products (product_id, product_name, category, price, stock_quantity)
VALUES 
(1001, 'Laptop', 'Electronics', 1200, 150),
(1002, 'Smartphone', 'Electronics', 800, 250),
(1003, 'Wireless Headphones', 'Electronics', 200, 500),
(2001, 'T-Shirt', 'Clothing', 25, 1000),
(2002, 'Jeans', 'Clothing', 50, 600),
(3001, 'Blender', 'Home Appliances', 150, 100),
(3002, 'Coffee Maker', 'Home Appliances', 80, 200),
(4001, 'Organic Milk', 'Groceries', 5, 1000),
(4002, 'Bread', 'Groceries', 2, 1500);
INSERT INTO Orders (order_id, customer_id, order_date, total_amount)
VALUES 
(101, 1, '2023-01-01', 500),
(102, 1, '2023-01-15', 300),
(103, 2, '2023-01-17', 150),
(104, 3, '2023-02-10', 200),
(105, 4, '2023-02-15', 1000),
(106, 2, '2023-02-20', 160),
(107, 5, '2023-02-22', 100),
(108, 3, '2023-02-25', 150),
(109, 1, '2023-03-01', 600),
(110, 4, '2023-03-10', 100);
INSERT INTO OrderDetails (order_id, product_id, quantity, price, total_price)
VALUES 
(101, 1001, 1, 500, 500),
(102, 1002, 2, 150, 300),
(103, 2001, 3, 50, 150),
(104, 3001, 1, 200, 200),
(105, 1001, 2, 500, 1000),
(106, 2002, 4, 40, 160),
(107, 4001, 10, 10, 100),
(108, 3002, 1, 150, 150),
(109, 1003, 1, 600, 600),
(110, 2001, 2, 50, 100);
INSERT INTO Payments (payment_id, order_id, payment_date, payment_method, amount)
VALUES 
(501, 101, '2023-01-01', 'Credit Card', 500),
(502, 102, '2023-01-15', 'PayPal', 300),
(503, 103, '2023-01-17', 'Credit Card', 150),
(504, 104, '2023-02-10', 'Debit Card', 200),
(505, 105, '2023-02-15', 'PayPal', 1000),
(506, 106, '2023-02-20', 'Credit Card', 160),
(507, 107, '2023-02-22', 'Credit Card', 100),
(508, 108, '2023-02-25', 'Debit Card', 150),
(509, 109, '2023-03-01', 'PayPal', 600),
(510, 110, '2023-03-10', 'Credit Card', 100);
