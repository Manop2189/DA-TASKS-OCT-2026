show databases;
create database Date12092026;
use Date12092026;
show schemas;

/*--------TABLE Customers -------*/
CREATE TABLE IF NOT EXISTS Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    Region VARCHAR(50) NOT NULL
);
INSERT INTO Customers (CustomerID, CustomerName, Region) VALUES
    (1, 'Aarav Traders', 'North'),
    (2, 'Bright Retail', 'South'),
    (3, 'City Mart', 'East'),
    (4, 'Delta Stores', 'West'),
    (5, 'Evergreen Supplies', 'North'),
    (6, 'Fresh Basket', 'South'),
    (7, 'Global Goods', 'East'),
    (8, 'Harbor Market', 'West'),
    (9, 'Indigo Shop', 'North'),
    (10, 'Jupiter Retail', 'South'),
    (11, 'Kite Commerce', 'East'),
    (12, 'Lotus Bazaar', 'West'),
    (13, 'Metro Essentials', 'North'),
    (14, 'Nova Outlet', 'South'),
    (15, 'Orchid Retail', 'East');
    select * from Customers;

/*--------TABLE Orders -------*/
CREATE TABLE IF NOT EXISTS Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate DATE NOT NULL,
    Sales DECIMAL(10,2) NOT NULL,
    Profit DECIMAL(10,2) NOT NULL,
    Category VARCHAR(100) NOT NULL,
    CONSTRAINT fk_orders_customers FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
INSERT INTO Orders (OrderID, CustomerID, OrderDate, Sales, Profit, Category) VALUES
    (1001, 1, '2026-01-03', 720, 145, 'Technology'),
    (1002, 1, '2026-01-15', 240, 48, 'Furniture'),
    (1003, 1, '2026-02-02', 95, 12, 'Office Supplies'),
    (1004, 1, '2026-02-18', 610, 122, 'Technology'),
    (1005, 1, '2026-03-07', 180, 30, 'Office Supplies'),
    (1006, 1, '2026-03-21', 430, 86, 'Furniture'),
    (1007, 2, '2026-01-05', 330, 55, 'Furniture'),
    (1008, 2, '2026-01-19', 540, 108, 'Technology'),
    (1009, 2, '2026-02-09', 125, 18, 'Office Supplies'),
    (1010, 2, '2026-02-22', 890, 178, 'Technology'),
    (1011, 2, '2026-03-11', 260, 42, 'Furniture'),
    (1012, 2, '2026-04-01', 70, -5, 'Office Supplies'),
    (1013, 3, '2026-01-08', 150, 25, 'Office Supplies'),
    (1014, 3, '2026-01-26', 680, 136, 'Technology'),
    (1015, 3, '2026-02-12', 390, 65, 'Furniture'),
    (1016, 3, '2026-03-02', 520, 104, 'Technology'),
    (1017, 4, '2026-01-10', 410, 70, 'Furniture'),
    (1018, 4, '2026-02-04', 760, 152, 'Technology'),
    (1019, 4, '2026-02-20', 85, 8, 'Office Supplies'),
    (1020, 4, '2026-03-18', 290, 45, 'Furniture'),
    (1021, 5, '2026-01-12', 610, 122, 'Technology'),
    (1022, 5, '2026-01-28', 220, 35, 'Furniture'),
    (1023, 5, '2026-02-14', 510, 102, 'Technology'),
    (1024, 5, '2026-03-25', 130, 20, 'Office Supplies'),
    (1025, 6, '2026-01-16', 180, 28, 'Furniture'),
    (1026, 6, '2026-02-06', 640, 128, 'Technology'),
    (1027, 6, '2026-02-24', 75, -2, 'Office Supplies'),
    (1028, 6, '2026-03-15', 350, 58, 'Furniture'),
    (1029, 7, '2026-01-18', 820, 164, 'Technology'),
    (1030, 7, '2026-02-08', 160, 24, 'Office Supplies'),
    (1031, 7, '2026-02-27', 470, 78, 'Furniture'),
    (1032, 8, '2026-01-22', 310, 50, 'Furniture'),
    (1033, 8, '2026-02-11', 920, 184, 'Technology'),
    (1034, 8, '2026-03-05', 115, 16, 'Office Supplies'),
    (1035, 9, '2026-01-24', 560, 112, 'Technology'),
    (1036, 9, '2026-02-15', 245, 40, 'Furniture'),
    (1037, 9, '2026-03-09', 680, 136, 'Technology'),
    (1038, 10, '2026-01-29', 205, 32, 'Furniture'),
    (1039, 10, '2026-02-18', 750, 150, 'Technology'),
    (1040, 10, '2026-03-12', 90, 9, 'Office Supplies'),
    (1041, 11, '2026-02-01', 430, 72, 'Furniture'),
    (1042, 11, '2026-02-21', 580, 116, 'Technology'),
    (1043, 11, '2026-03-17', 145, 22, 'Office Supplies'),
    (1044, 12, '2026-02-03', 670, 134, 'Technology'),
    (1045, 12, '2026-02-25', 320, 52, 'Furniture'),
    (1046, 12, '2026-03-22', 105, 14, 'Office Supplies'),
    (1047, 13, '2026-02-05', 480, 80, 'Furniture'),
    (1048, 13, '2026-03-01', 810, 162, 'Technology'),
    (1049, 14, '2026-02-10', 225, 36, 'Furniture'),
    (1050, 14, '2026-03-28', 590, 118, 'Technology');
    select * from Orders;

/*Q1. Find the top 5 customers by total sales (JOIN + GROUP BY + ORDER BY + LIMIT)*/
SELECT c.CustomerID, c.CustomerName, SUM(o.Sales) AS total_sales
FROM Customers AS c
JOIN Orders AS o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CustomerName
ORDER BY total_sales DESC
LIMIT 5;

/*Q2. Find customers who placed more than 5 orders (GROUP BY + HAVING)*/
SELECT c.CustomerID, c.CustomerName, COUNT(o.OrderID) AS order_count
FROM Customers AS c
JOIN Orders AS o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CustomerName
HAVING COUNT(o.OrderID) > 5
ORDER BY order_count DESC;

/*Q3. Find the region with the highest average order profit*/
SELECT c.Region, AVG(o.Profit) AS average_order_profit
FROM Customers AS c
JOIN Orders AS o ON c.CustomerID = o.CustomerID
GROUP BY c.Region
ORDER BY average_order_profit DESC
LIMIT 1;

/*Q4. List all orders where Sales is above the overall average Sales (subquery)*/
SELECT OrderID, CustomerID, OrderDate, Sales
FROM Orders
WHERE Sales > (SELECT AVG(Sales) FROM Orders)
ORDER BY Sales DESC;

/*Q5. Categorize each order as "High Value" (Sales > 500), 
"Medium Value" (100–500), or "Low Value" (<100) using CASE WHEN*/
SELECT OrderID, Sales,
       CASE
           WHEN Sales > 500 THEN 'High Value'
           WHEN Sales >= 100 THEN 'Medium Value'
           ELSE 'Low Value'
       END AS sales_category
FROM Orders
ORDER BY Sales DESC;

/*Q6. Find the most popular Category per Region (JOIN + GROUP BY + subquery or window function)*/
WITH category_counts AS (
    SELECT c.Region, o.Category, COUNT(*) AS order_count
    FROM Customers AS c
    JOIN Orders AS o ON c.CustomerID = o.CustomerID
    GROUP BY c.Region, o.Category
),
ranked_categories AS (
    SELECT Region, Category, order_count,
           RANK() OVER (PARTITION BY Region ORDER BY order_count DESC) AS category_rank
    FROM category_counts
)
SELECT Region, Category, order_count
FROM ranked_categories
WHERE category_rank = 1
ORDER BY Region, Category;

/*Q7. Find customers who have never placed an order (LEFT JOIN + IS NULL)*/
SELECT c.CustomerID, c.CustomerName
FROM Customers AS c
LEFT JOIN Orders AS o ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL
ORDER BY c.CustomerID;

/*Q8. Calculate each customer's total profit and rank them from highest to lowest*/
WITH customer_profit AS (
    SELECT c.CustomerID, c.CustomerName,
           COALESCE(SUM(o.Profit), 0) AS total_profit
    FROM Customers AS c
    LEFT JOIN Orders AS o ON c.CustomerID = o.CustomerID
    GROUP BY c.CustomerID, c.CustomerName
)
SELECT CustomerID, CustomerName, total_profit,
       RANK() OVER (ORDER BY total_profit DESC) AS profit_rank
FROM customer_profit
ORDER BY profit_rank, CustomerID;

/*Q9. Find the month with the highest total sales across all orders*/
SELECT DATE_FORMAT(OrderDate, '%Y-%m') AS sales_month,
       SUM(Sales) AS total_sales
FROM Orders
GROUP BY DATE_FORMAT(OrderDate, '%Y-%m')
ORDER BY total_sales DESC
LIMIT 1;

/*Q10. Write a query using WITH (CTE) to first calculate customer totals, 
then filter for customers above a profit threshold*/
WITH customer_totals AS (
    SELECT c.CustomerID, c.CustomerName,
           COALESCE(SUM(o.Profit), 0) AS total_profit,
           COALESCE(SUM(o.Sales), 0) AS total_sales
    FROM Customers AS c
    LEFT JOIN Orders AS o ON c.CustomerID = o.CustomerID
    GROUP BY c.CustomerID, c.CustomerName
)
SELECT CustomerID, CustomerName, total_sales, total_profit
FROM customer_totals
WHERE total_profit > 100
ORDER BY total_profit DESC;






