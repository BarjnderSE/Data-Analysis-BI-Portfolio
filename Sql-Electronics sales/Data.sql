CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    gender ENUM('Male', 'Female'),
    registration_date DATE
);

INSERT INTO customers (first_name, last_name, email, gender, registration_date) VALUES
('John', 'Doe', 'john.doe@example.com', 'Male', '2022-01-15'),
('Jane', 'Smith', 'jane.smith@example.com', 'Female', '2022-02-20'),
('Alice', 'Johnson', 'alice.j@example.com', 'Female', '2022-03-10'),
('Bob', 'Brown', 'bob.brown@example.com', 'Male', '2022-04-05'),
('Charlie', 'Davis', 'charlie.d@example.com', 'Male', '2022-05-12'),
('Eve', 'White', 'eve.white@example.com', 'Female', '2022-06-01'),
('Tom', 'Harris', 'tom.harris@example.com', 'Male', '2022-06-25'),
('Lucy', 'Wilson', 'lucy.wilson@example.com', 'Female', '2022-07-10');


CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2),
    stock_quantity INT
);

INSERT INTO products (product_name, category, price, stock_quantity) VALUES
('Laptop', 'Electronics', 999.99, 50),
('Smartphone', 'Electronics', 499.99, 100),
('Headphones', 'Electronics', 199.99, 200),
('Monitor', 'Electronics', 299.99, 75),
('Keyboard', 'Accessories', 49.99, 150),
('Mouse', 'Accessories', 29.99, 300),
('Coffee Maker', 'Home Appliances', 89.99, 60),
('Blender', 'Home Appliances', 49.99, 80);


CREATE TABLE sales_orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    payment_method ENUM('Credit Card', 'PayPal', 'Bank Transfer'),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO sales_orders (customer_id, order_date, total_amount, payment_method) VALUES
(1, '2023-01-05', 1049.98, 'Credit Card'),
(2, '2023-01-12', 499.99, 'PayPal'),
(3, '2023-02-01', 199.99, 'Bank Transfer'),
(4, '2023-02-15', 299.99, 'Credit Card'),
(5, '2023-03-10', 1499.98, 'PayPal'),
(6, '2023-03-20', 89.99, 'Credit Card'),
(1, '2023-04-05', 199.99, 'Bank Transfer'),
(2, '2023-04-15', 499.99, 'Credit Card'),
(3, '2023-05-01', 29.99, 'PayPal'),
(4, '2023-05-10', 79.99, 'Bank Transfer');

CREATE TABLE order_details (
    detail_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES sales_orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO order_details (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 999.99),
(1, 3, 1, 49.99),
(2, 2, 1, 499.99),
(3, 3, 1, 199.99),
(4, 4, 1, 299.99),
(5, 1, 1, 999.99),
(5, 7, 1, 89.99),
(6, 7, 1, 89.99),
(7, 3, 1, 29.99),
(8, 2, 1, 499.99);

