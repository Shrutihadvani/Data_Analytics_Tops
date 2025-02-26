create database uber;

use uber;

create table sales(
	s_id int primary key,
    p_id int,
    quantity int,
    sale_date date,
    total_price int);
    
insert into sales (s_id, p_id, quantity, sale_date, total_price)
values 
(1, 101, 5, '2025-02-01', 150),
(2, 102, 3, '2025-02-02', 90),
(3, 103, 10, '2025-02-03', 300),
(4, 104, 2, '2025-02-04', 60),
(5, 105, 7, '2025-02-05', 210),
(6, 106, 4, '2025-02-06', 120),
(7, 107, 8, '2025-02-07', 240),
(8, 108, 6, '2025-02-08', 180),
(9, 109, 9, '2025-02-09', 270),
(10, 110, 1, '2025-02-10', 30),
(11, 111, 12, '2025-02-11', 360),
(12, 112, 5, '2025-02-12', 150),
(13, 113, 15, '2025-02-13', 450),
(14, 114, 3, '2025-02-14', 90),
(15, 115, 4, '2025-02-15', 120),
(16, 116, 2, '2025-02-16', 60),
(17, 117, 10, '2025-02-17', 300),
(18, 118, 6, '2025-02-18', 180),
(19, 119, 7, '2025-02-19', 210),
(20, 120, 9, '2025-02-20', 270);

create table products(
		p_id int primary key,
        p_name varchar(50),
        category varchar(25),
        unit_price int);
        
insert into products (p_id, p_name, category, unit_price)
values 
(101, 'Laptop', 'Electronics', 1000),
(102, 'Smartphone', 'Electronics', 700),
(103, 'Tablet', 'Electronics', 400),
(104, 'Headphones', 'Electronics', 100),
(105, 'Smartwatch', 'Electronics', 250),
(106, 'Keyboard', 'Accessories', 50),
(107, 'Mouse', 'Accessories', 25),
(108, 'Monitor', 'Electronics', 200),
(109, 'Charger', 'Accessories', 30),
(110, 'USB Cable', 'Accessories', 10),
(111, 'Sofa', 'Furniture', 500),
(112, 'Dining Table', 'Furniture', 300),
(113, 'Bookshelf', 'Furniture', 150),
(114, 'Armchair', 'Furniture', 200),
(115, 'Coffee Table', 'Furniture', 100),
(116, 'T-Shirt', 'Clothing', 20),
(117, 'Jeans', 'Clothing', 40),
(118, 'Jacket', 'Clothing', 60),
(119, 'Shoes', 'Clothing', 80),
(120, 'Hat', 'Clothing', 15);

#1.Retrieve all columns from the Sales table.
SELECT * FROM sales;

#2.Retrieve the product_name and unit_price from the Products table.
SELECT p_name, unit_price FROM products;

#3.Filter the Sales table to show only sales with a total_price greater than $100.
SELECT * FROM sales WHERE total_price > 100;

#4.Filter the Products table to show only products in the 'Electronics' category.
SELECT * FROM products WHERE category = 'Electronics';

#5.Calculate the total revenue generated from all sales in the Sales table:
SELECT SUM(total_price) AS total_revenue FROM sales;

#6.Calculate the total quantity sold from the Sales table:
SELECT SUM(quantity) AS total_quantity_sold FROM sales;

#7.Count Sales Per Day from the Sales table
SELECT sale_date, COUNT(s_id) AS sales_count FROM sales GROUP BY sale_date;

#8.Retrieve product_name and unit_price from the Products table with the Highest Unit Price to lowest unit_price
SELECT p_name, unit_price FROM products ORDER BY unit_price DESC;

#9.Retrieve the sale_id, product_id, and total_price from the Sales table for sales with a quantity_sold greater than 4.
SELECT s_id, p_id, total_price FROM sales WHERE quantity > 4;

#10.Calculate the total revenue generated from sales of products in the 'Electronics' category.
SELECT SUM(s.total_price) AS electronics_revenue
FROM sales s
JOIN products p ON s.p_id = p.p_id
WHERE p.category = 'Electronics';

#11.Retrieve the product_name and unit_price from the Products table, filtering the unit_price to show only values between $20 and $600.
SELECT p_name, unit_price FROM products WHERE unit_price BETWEEN 20 AND 600;

#12.Calculate the total quantity_sold of products in the 'Electronics' category.
SELECT SUM(s.quantity) AS total_electronics_quantity
FROM sales s
JOIN products p ON s.p_id = p.p_id
WHERE p.category = 'Electronics';

#13.Identify the Most Frequently Sold Product from Sales table 
SELECT p_id, SUM(quantity) AS total_sold
FROM sales
GROUP BY p_id
ORDER BY total_sold DESC
LIMIT 1;

#14.Identify products with total sales exceeding[make sure the answer is not look like copied one.
SELECT p.p_name, SUM(s.total_price) AS total_sales
FROM sales s
JOIN products p ON s.p_id = p.p_id
GROUP BY p.p_name
HAVING total_sales > 500;
