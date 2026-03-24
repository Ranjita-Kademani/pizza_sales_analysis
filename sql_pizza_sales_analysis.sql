USE pizza;
SELECT * FROM pizza_sales;
DESCRIBE pizza_sales;
SHOW COLUMNS FROM pizza_sales;

ALTER TABLE pizza_sales
MODIFY COLUMN pizza_name_id VARCHAR(100),
MODIFY COLUMN pizza_name VARCHAR(100),
MODIFY COLUMN pizza_ingredients VARCHAR(100),
MODIFY COLUMN pizza_category VARCHAR(100),
MODIFY COLUMN pizza_size VARCHAR(100),
MODIFY COLUMN order_date DATE,
MODIFY COLUMN order_time TIME;

UPDATE pizza_sales
SET order_date = str_to_date(order_date, '%d-%m-%Y')
WHERE order_date IS NOT NULL;

SET SQL_SAFE_UPDATES = 0;

/* Total Revenue: The sum of total price of all pizza orders*/
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales;

/* Average OrderValue: The average amount spent per order, calculated by dividing the total
revenue by the total number of order */
SELECT SUM(total_price) / COUNT(DISTINCT order_id)AS Avg_Oreder_Value FROM pizza_sales; 

/*Total Pizzas Sold: The sum of the quantities of all pizzas sold*/
SELECT SUM(quantity) AS Total_Pizza_Sold FROM pizza_sales; 

/*Total Orders: The total number of orders placed */
SELECT COUNT(DISTINCT order_id) AS Total_Order FROM pizza_sales;

/*Avaerage Pizza Per Orders: The average number of pizzas sold per order, calculated by dividing 
the total number of pizzas sold by the total numbers of orders*/
SELECT SUM(quantity) / COUNT(DISTINCT order_id) FROM pizza_sales;

/*Daily Trend Total Orders:*/
SELECT DAYNAME(order_date) AS Order_Day, COUNT(DISTINCT order_id) AS Total_Orders 
FROM pizza_sales
GROUP BY DAYNAME(order_date);

/*Hourly Trend for Total Orders*/
SELECT HOUR(order_time) AS Order_Hours,
       COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY HOUR(order_time)
ORDER BY HOUR(order_time);

/*Percentage of sales by pizza category*/
SELECT 
    pizza_category,
    ROUND(SUM(total_price), 2) AS total_revenue,
    ROUND(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales), 2) AS pct
FROM pizza_sales
GROUP BY pizza_category
ORDER BY total_revenue DESC;

/* Percentage of Sales by Pizza Size*/
SELECT 
    pizza_size,
    ROUND(SUM(total_price), 2) AS total_revenue,
    ROUND(SUM(total_price) * 100 / t.total_revenue, 2) AS pct
FROM pizza_sales,
     (SELECT SUM(total_price) AS total_revenue FROM pizza_sales) t
GROUP BY pizza_size, t.total_revenue
ORDER BY FIELD(pizza_size, 'S','M','L','XL','XXL');

/*Total Pizzas Sold by Pizza Category*/
SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
GROUP BY pizza_category;

/*Top 5 Best Sellers by Total Pizzas Sold */
SELECT pizza_name, 
       SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC
LIMIT 5;

/*Bottom 5 Best Sellers by Total Pizzas Sold*/
SELECT pizza_name, 
       SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC
LIMIT 5;


SHOW VARIABLES LIKE 'secure_file_priv';

SELECT * 
FROM pizza_sales
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/pizza_sales.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';