
-- ========================================================================= Analysis =========================================================================

-- ------------------------------------------------------- Count of Rows or records in each table ------------------------------------------
select 'customers' as table_name, count(*) as row_count from customers 
union all
select 'restaurants' as table_name, count(*) as row_count from restaurants
union all
select 'menu_items' as table_name, count(*) as row_count from menu_items
union all
select 'orders' as table_name, count(*) as row_count from orders
union all
select 'order_items' as table_name, count(*) as row_count from order_items;

-- ------------------------------------------------------- Module 1 – Database Exploration  -------------------------------------------------------

-- ------------------------------------------------------- Total Customers -------------------------------------------------------
SELECT COUNT(*) AS Total_Customers
from customers;

-- ------------------------------------------------------- Total Restaurants -----------------------------------------------------
SELECT COUNT(*) AS Total_restaurants
FROM restaurants;

-- ------------------------------------------------------- Total Orders ----------------------------------------------------------
SELECT COUNT(*) AS Total_Orders
FROM orders;

-- ------------------------------------------------------- Total Menu Items ------------------------------------------------------
SELECT COUNT(*) AS Total_Menu_Items
FROM menu_items;

-- ------------------------------------------------------- Total Revenue (First Real Business Query) -----------------------------
SELECT 
	ROUND(SUM(quantity * price),2) AS Total_Revenue
FROM order_items;

-- ------------------------------------------------------- Module 2 – Customer Analysis ----------------------------------------------------------

-- Business Question 1
-- Q. 1 Who are our top 10 customers by total spending ?

SELECT 
	c.customer_id,
    SUM(oi.quantity * oi.price) AS total_spent
FROM customers c 
JOIN orders o
	ON c.customer_id = o.customer_id
JOIN order_items oi
	ON o.order_id = oi.order_id
GROUP BY c.customer_id
ORDER BY total_spent DESC
LIMIT 10;    

-- ------------------------------------------------------------------------------------------------------------
-- Q. 2 Who are our repeat customers?

SELECT 
	customer_id,
    COUNT(order_id) as Total_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) > 1
ORDER BY Total_orders DESC;

-- ------------------------------------------------------------------------------------------------------------
-- Q. 3 What is the Average Order Value (AOV) ?
SELECT 
	ROUND(AVG(order_total), 2) AS average_order_value
FROM (
		SELECT 
			order_id,
			SUM(quantity * price) AS order_total
		FROM order_items
		GROUP BY order_id)
AS order_summary;

-- ------------------------------------------------------------------------------------------------------------
-- Q. Extra : How many total repeated customers are there ?

SELECT 
	COUNT(customer_id) AS total_repeated_customers 
FROM (
		SELECT 
			customer_id,
			COUNT(order_id) as Total_orders
		FROM orders
		GROUP BY customer_id
		HAVING COUNT(order_id) > 1
		ORDER BY Total_orders DESC) 
as temp;

-- ------------------------------------------------------- Module 3 – Restaurant Analysis -------------------------------------------------------
-- Q. 1 Top 10 Restaurants by revenue

SELECT 
	r.restaurant_id,
    SUM(oi.quantity * oi.price) AS Revenue
FROM restaurants r
JOIN orders o
	ON r.restaurant_id = o.restaurant_id
JOIN order_items oi
	ON o.order_id = oi.order_id
GROUP BY 
	r.restaurant_id
ORDER BY 
	Revenue DESC
LIMIT 10;

-- ------------------------------------------------------------------------------------------------------------
-- Q. 2 Top 5 Cuisines by Revenue

SELECT 
	r.cuisine,
    ROUND(SUM(oi.quantity * oi.price),2) as Revenue
FROM restaurants r
JOIN orders o
	ON r.restaurant_id = o.restaurant_id
JOIN order_items oi
	ON o.order_id = oi.order_id
GROUP BY 
	r.cuisine
ORDER BY 
	Revenue DESC
LIMIT 5;

-- ------------------------------------------------------------------------------------------------------------    
-- Q. 3 Query 11 – Average Restaurant Rating by Cuisine    

SELECT 
	cuisine,
    ROUND(AVG(rating),2) as Avg_Cuisine_Rating
FROM restaurantS 
GROUP BY 
	cuisine
ORDER BY     
	Avg_Cuisine_Rating DESC;    
    
-- ========================================================================= Analysis =========================================================================
    
-- ========================================================================= Rough Work =======================================================================
-- Top 10 Restaurants by Revenue
SELECT
	r.restaurant_id,
    ROUND(SUM( quantity * price),2) AS revenue
FROM restaurants r
JOIN orders o
	ON r.restaurant_id = o.restaurant_id
JOIN order_items oi
	ON o.order_id = oi.order_id
GROUP BY 
	r.restaurant_id 
ORDER BY revenue DESC;
    
-- How is customer spending distributed?
SELECT
	c.customer_id,
    ROUND(SUM( quantity * price), 2) AS revenue
FROM customers c
JOIN orders o
	ON c.customer_id = o.customer_id
JOIN order_items oi
	ON o.order_id = oi.order_id
GROUP BY
	c.customer_id
ORDER BY 
	revenue DESC;
    
-- Order Status Distribution
SELECT 
	status,
    COUNT(*) AS total_orders
FROM orders o
GROUP BY status
ORDER BY total_orders DESC;

-- Monthly Revenue Trend

SELECT
	DATE_FORMAT(o.order_time, '%Y-%m') AS month,
    ROUND(SUM(oi.quantity * oi.price), 2) AS revenue
FROM orders o
JOIN order_items oi
	ON o.order_id = oi.order_id
GROUP BY  DATE_FORMAT(o.order_time, '%Y-%m')
ORDER BY revenue;

-- Which cuisine contributes the largest share of total revenue?
SELECT
    r.cuisine,
    ROUND(SUM(oi.quantity * oi.price), 2) AS revenue
FROM restaurants r
JOIN orders o
    ON r.restaurant_id = o.restaurant_id
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY r.cuisine
ORDER BY revenue DESC;

-- Who are the highest-value customers?
SELECT
    c.customer_id,
    ROUND(SUM(oi.quantity*oi.price),2) AS total_spent
FROM customers c
JOIN orders o
ON c.customer_id=o.customer_id
JOIN order_items oi
ON o.order_id=oi.order_id
GROUP BY c.customer_id
ORDER BY total_spent DESC
LIMIT 10;


-- Which weekday generates the highest revenue?
SELECT
    DAYNAME(o.order_time) AS day_name,
    ROUND(SUM(oi.quantity * oi.price), 2) AS revenue
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY DAYNAME(o.order_time)
ORDER BY FIELD(
    day_name,
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
);


-- ========================================================================= Rough Work =======================================================================