show databases;
create database Date09102026;
use Date09102026;
show schemas;

/*--------TABLE customers -------*/
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    city VARCHAR(50),
    email VARCHAR(100)
);
INSERT INTO customers (customer_id, customer_name, city, email) VALUES
(1, 'Arun Kumar', 'Chennai', 'arun@example.com'),
(2, 'Priya Sharma', 'Bengaluru', 'priya@example.com'),
(3, 'Rahul Mehta', 'Mumbai', 'rahul@example.com'),
(4, 'Sneha Iyer', 'Chennai', 'sneha@example.com'),
(5, 'Vikram Singh', 'Delhi', 'vikram@example.com'),
(6, 'Ananya Rao', 'Hyderabad', 'ananya@example.com'),
(7, 'Karthik Raj', 'Coimbatore', 'karthik@example.com'),
(8, 'Divya Nair', 'Kochi', 'divya@example.com');
select * from customers;

/*--------TABLE products -------*/
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    unit_price DECIMAL(10,2)
);
INSERT INTO products (product_id, product_name, category, unit_price) VALUES
(101, 'Laptop', 'Electronics', 65000.00),
(102, 'Wireless Mouse', 'Electronics', 1200.00),
(103, 'Keyboard', 'Electronics', 1800.00),
(104, 'Office Chair', 'Furniture', 8500.00),
(105, 'Desk', 'Furniture', 12000.00),
(106, 'Notebook', 'Stationery', 150.00),
(107, 'Pen Pack', 'Stationery', 300.00),
(108, 'Headphones', 'Electronics', 3500.00),
(109, 'Monitor', 'Electronics', 18000.00),
(110, 'Backpack', 'Accessories', 2200.00);
select * from products;

/*--------TABLE orders -------*/
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
INSERT INTO orders (order_id, customer_id, order_date, status) VALUES
(1001, 1, '2026-01-05', 'Delivered'),
(1002, 2, '2026-01-10', 'Delivered'),
(1003, 3, '2026-01-15', 'Delivered'),
(1004, 1, '2026-02-03', 'Delivered'),
(1005, 4, '2026-02-08', 'Delivered'),
(1006, 5, '2026-02-18', 'Shipped'),
(1007, 2, '2026-03-02', 'Delivered'),
(1008, 6, '2026-03-10', 'Delivered'),
(1009, 3, '2026-03-15', 'Delivered'),
(1010, 7, '2026-03-20', 'Delivered'),
(1011, 8, '2026-04-01', 'Delivered'),
(1012, 4, '2026-04-05', 'Cancelled');
select * from orders;

/*--------TABLE order_items -------*/
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
INSERT INTO order_items (order_item_id, order_id, product_id, quantity, unit_price) VALUES
(1, 1001, 101, 1, 65000.00),
(2, 1001, 102, 2, 1200.00),

(3, 1002, 104, 1, 8500.00),
(4, 1002, 106, 5, 150.00),

(5, 1003, 109, 2, 18000.00),
(6, 1003, 108, 1, 3500.00),

(7, 1004, 105, 1, 12000.00),
(8, 1004, 103, 2, 1800.00),

(9, 1005, 101, 1, 65000.00),
(10, 1005, 110, 2, 2200.00),

(11, 1006, 104, 2, 8500.00),
(12, 1006, 107, 3, 300.00),

(13, 1007, 108, 2, 3500.00),
(14, 1007, 102, 1, 1200.00),

(15, 1008, 105, 2, 12000.00),
(16, 1008, 106, 10, 150.00),

(17, 1009, 101, 1, 65000.00),
(18, 1009, 109, 1, 18000.00),

(19, 1010, 103, 3, 1800.00),
(20, 1010, 107, 5, 300.00),

(21, 1011, 110, 2, 2200.00),
(22, 1011, 108, 1, 3500.00),

(23, 1012, 101, 1, 65000.00);

select * from order_items;

-- ========================================================================================
-- 										LEARNING GOAL
-- ========================================================================================
-- ========================================================================================
-- SELECT, WHERE, ORDER BY, LIMIT, Filtering with AND, OR, IN, BETWEEN, LIKE								
-- ========================================================================================
--- SELECT WHERE
-- Business question: Show customers from Chennai.
SELECT customer_id, customer_name, city
FROM customers
WHERE city = 'Chennai';

-- AND
-- Customers from Chennai whose name starts with S.
SELECT customer_name, city
FROM customers
WHERE city = 'Chennai'
  AND customer_name LIKE 'S%';

-- OR
-- Customers from Chennai OR Bengaluru.
SELECT customer_name, city
FROM customers
WHERE city = 'Chennai'
   OR city = 'Bengaluru';

-- IN
-- Customers from selected cities.
SELECT customer_name, city
FROM customers
WHERE city IN ('Chennai', 'Mumbai', 'Delhi');

-- BETWEEN
-- Orders placed between February 1 and March 31, 2026.
SELECT order_id, customer_id, order_date
FROM orders
WHERE order_date BETWEEN '2026-02-01' AND '2026-03-31';

-- LIKE
-- Find customers whose name contains 'a' (case-insensitive in
-- most default MySQL collations).
SELECT customer_name
FROM customers
WHERE customer_name LIKE '%a%';

-- ORDER BY + LIMIT
-- Highest priced products, top 5.
SELECT product_name, category, unit_price
FROM products
ORDER BY unit_price DESC
LIMIT 5;

-- ========================================================================================
-- 										AGGREGATE FUNCTIONS
-- ========================================================================================
-- ========================================================================================
-- 	COUNT, SUM, AVG, MIN, MAX
-- ========================================================================================
-- COUNT
SELECT COUNT(*) AS total_customers
FROM customers;

-- SUM
SELECT SUM(unit_price) AS total_product_price
FROM products;

-- AVG
SELECT AVG(unit_price) AS average_product_price
FROM products;

-- MIN and MAX
SELECT
    MIN(unit_price) AS lowest_price,
    MAX(unit_price) AS highest_price
FROM products;

-- ========================================================================================
-- 										MAIN TASK
-- ========================================================================================
/*Create the table(s) and load sample data (or use an existing sample DB)
Write 10 queries answering business questions (e.g., top customers, monthly sales, category-wise totals)
Use at least one JOIN across two tables
Use GROUP BY with HAVING to filter aggregated results
Use a CASE statement to create a categorized column
Write a short summary of insights discovered from your queries*/

-- BUSINESS QUESTION 1
-- Who are the top 5 customers by total spending?
SELECT
    c.customer_id,
    c.customer_name,
    SUM(oi.quantity * oi.unit_price) AS total_spent
FROM customers AS c
JOIN orders AS o
    ON c.customer_id = o.customer_id
JOIN order_items AS oi
    ON o.order_id = oi.order_id
WHERE o.status = 'Delivered'
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spent DESC
LIMIT 5;

-- BUSINESS QUESTION 2
-- What are the total sales for each month?
SELECT
    DATE_FORMAT(o.order_date, '%Y-%m') AS sales_month,
    SUM(oi.quantity * oi.unit_price) AS monthly_sales
FROM orders AS o
JOIN order_items AS oi
    ON o.order_id = oi.order_id
WHERE o.status = 'Delivered'
GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
ORDER BY sales_month;

-- BUSINESS QUESTION 3
-- How much sales revenue did each product category generate?
SELECT
    p.category,
    SUM(oi.quantity * oi.unit_price) AS category_sales
FROM products AS p
JOIN order_items AS oi
    ON p.product_id = oi.product_id
JOIN orders AS o
    ON oi.order_id = o.order_id
WHERE o.status = 'Delivered'
GROUP BY p.category
ORDER BY category_sales DESC;

-- BUSINESS QUESTION 4
-- Show each order with the customer's name and order value.
-- This demonstrates JOIN across multiple tables.
SELECT
    o.order_id,
    c.customer_name,
    o.order_date,
    SUM(oi.quantity * oi.unit_price) AS order_value
FROM orders AS o
JOIN customers AS c
    ON o.customer_id = c.customer_id
JOIN order_items AS oi
    ON o.order_id = oi.order_id
WHERE o.status = 'Delivered'
GROUP BY o.order_id, c.customer_name, o.order_date
ORDER BY o.order_date;

-- BUSINESS QUESTION 5
-- Which customers have spent more than 50,000?
-- GROUP BY creates one group per customer.
-- HAVING filters the grouped result.
SELECT
    c.customer_name,
    SUM(oi.quantity * oi.unit_price) AS total_spent
FROM customers AS c
JOIN orders AS o
    ON c.customer_id = o.customer_id
JOIN order_items AS oi
    ON o.order_id = oi.order_id
WHERE o.status = 'Delivered'
GROUP BY c.customer_id, c.customer_name
HAVING SUM(oi.quantity * oi.unit_price) > 50000
ORDER BY total_spent DESC;

-- BUSINESS QUESTION 6
-- Which products have never appeared in a delivered order?
-- LEFT JOIN keeps every product, even if no matching order exists.
SELECT
    p.product_id,
    p.product_name,
    p.category
FROM products AS p
LEFT JOIN order_items AS oi
    ON p.product_id = oi.product_id
LEFT JOIN orders AS o
    ON oi.order_id = o.order_id
   AND o.status = 'Delivered'
WHERE o.order_id IS NULL;

-- BUSINESS QUESTION 7
-- Categorize each delivered order as Low, Medium, or High value.
-- CASE creates a new calculated category.
SELECT
    o.order_id,
    SUM(oi.quantity * oi.unit_price) AS order_value,
    CASE
        WHEN SUM(oi.quantity * oi.unit_price) < 5000 THEN 'Low'
        WHEN SUM(oi.quantity * oi.unit_price) BETWEEN 5000 AND 20000 THEN 'Medium'
        ELSE 'High'
    END AS order_value_category
FROM orders AS o
JOIN order_items AS oi
    ON o.order_id = oi.order_id
WHERE o.status = 'Delivered'
GROUP BY o.order_id
ORDER BY order_value DESC;

-- BUSINESS QUESTION 8
-- Which products sold the highest number of units?
SELECT
    p.product_name,
    p.category,
    SUM(oi.quantity) AS units_sold
FROM products AS p
JOIN order_items AS oi
    ON p.product_id = oi.product_id
JOIN orders AS o
    ON oi.order_id = o.order_id
WHERE o.status = 'Delivered'
GROUP BY p.product_id, p.product_name, p.category
ORDER BY units_sold DESC
LIMIT 5;

-- BUSINESS QUESTION 9
-- How many delivered orders and how much revenue came from each city?
SELECT
    c.city,
    COUNT(DISTINCT o.order_id) AS delivered_orders,
    SUM(oi.quantity * oi.unit_price) AS city_sales
FROM customers AS c
JOIN orders AS o
    ON c.customer_id = o.customer_id
JOIN order_items AS oi
    ON o.order_id = oi.order_id
WHERE o.status = 'Delivered'
GROUP BY c.city
ORDER BY city_sales DESC;

-- BUSINESS QUESTION 10
-- Which customers spent more than the average customer spending?
-- The inner query calculates each customer's spending.
-- The outer query compares each customer against the average
-- of those customer totals.
SELECT
    customer_name,
    total_spent
FROM (
    SELECT
        c.customer_id,
        c.customer_name,
        SUM(oi.quantity * oi.unit_price) AS total_spent
    FROM customers AS c
    JOIN orders AS o
        ON c.customer_id = o.customer_id
    JOIN order_items AS oi
        ON o.order_id = oi.order_id
    WHERE o.status = 'Delivered'
    GROUP BY c.customer_id, c.customer_name
) AS customer_totals
WHERE total_spent > (
    SELECT AVG(total_spent)
    FROM (
        SELECT
            c.customer_id,
            SUM(oi.quantity * oi.unit_price) AS total_spent
        FROM customers AS c
        JOIN orders AS o
            ON c.customer_id = o.customer_id
        JOIN order_items AS oi
            ON o.order_id = oi.order_id
        WHERE o.status = 'Delivered'
        GROUP BY c.customer_id
    ) AS spending_summary
)
ORDER BY total_spent DESC;

-- ========================================================================================
-- 										SUPPORTING EXERCISES
-- ========================================================================================
/*1. Select specific columns with a WHERE filter*/
SELECT customer_name, city
FROM customers
WHERE city = 'Chennai';

/*2. Sort results and limit to the top 5 records*/
SELECT product_name, unit_price
FROM products
ORDER BY unit_price DESC
LIMIT 5;

/*3. Use COUNT, SUM, and AVG with GROUP BY*/
SELECT
    category,
    COUNT(*) AS number_of_products,
    SUM(unit_price) AS total_price,
    AVG(unit_price) AS average_price
FROM products
GROUP BY category
ORDER BY average_price DESC;

/*4. Join two tables and return combined results*/
SELECT
    o.order_id,
    c.customer_name,
    o.order_date,
    o.status
FROM orders AS o
JOIN customers AS c
    ON o.customer_id = c.customer_id;
    
/*5. Use HAVING to filter groups (e.g., totals above a threshold)*/
SELECT
    category,
    SUM(unit_price) AS category_value
FROM products
GROUP BY category
HAVING SUM(unit_price) > 10000
ORDER BY category_value DESC;

/*6. Write a subquery (e.g., records above the average value)*/
SELECT
    product_name,
    unit_price
FROM products
WHERE unit_price > (
    SELECT AVG(unit_price)
    FROM products
)
ORDER BY unit_price DESC;

-- ========================================================================================
-- 										INSIGHTS SUMMARY
-- ========================================================================================
-- 1. The highest-value customers contributed a large share of sales.
-- 2. Electronics generated strong revenue compared with lower-priced
--    categories because products such as laptops and monitors have
--    higher selling prices.
-- 3. Some products had no delivered sales and may need promotion,
--    better placement, or further investigation.
-- 4. The CASE analysis grouped orders into Low, Medium, and High
--    value categories, which helps management quickly understand
--    order-value distribution.
-- 5. The monthly sales query shows how revenue changed over time.
