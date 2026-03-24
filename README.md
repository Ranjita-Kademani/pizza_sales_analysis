# pizza_sales_analysis
Data Analytic Project showcasing pizza sales analysis using MySQL and Excel

Pizza Sales Data Analysis (SQL Project)
📌 Overview

This project analyzes pizza sales data using SQL to generate meaningful business insights. The objective is to understand sales performance, customer ordering behavior, and product trends to support data-driven decision-making.

📊 Dataset
Source: Pizza sales transactional dataset
Table Name: pizza_sales
Key Fields:
order_id – Unique order identifier
order_date – Date of order
order_time – Time of order
pizza_name – Name of the pizza
pizza_category – Category (Classic, Veggie, etc.)
pizza_size – Size (S, M, L, XL, XXL)
quantity – Number of pizzas ordered
total_price – Total price per transaction
🛠️ Tools & Technologies
SQL (MySQL) – Data analysis
Excel – Dashboard & visualization
SQL Functions Used:
Aggregate: SUM(), COUNT(), ROUND()
Date/Time: DAYNAME(), HOUR(), MONTH()
Filtering & Grouping: GROUP BY, ORDER BY, WHERE
🔎 Analysis Steps
1. Data Understanding & Preparation
Explored dataset structure and columns
Verified data types and consistency
Used SQL functions for date/time extraction
2. KPI Calculation
Total Revenue
Average Order Value
Total Orders
Total Pizzas Sold
Average Pizzas per Order
3. Time-Based Analysis
Daily order trends (busiest days)
Hourly sales trends (peak hours)
4. Sales Analysis
Revenue by pizza category
Revenue by pizza size
5. Product Performance
Top 5 best-selling pizzas
Bottom 5 least-selling pizzas
Category-wise sales (monthly filter)
📈 Dashboard

An interactive dashboard (Excel) was created to visualize:

Revenue trends
Sales distribution by category and size
Daily and hourly order patterns
Top and bottom performing products
📌 Results & Insights
Identified peak sales days and hours
Found top-performing pizza categories and sizes
Highlighted best-selling and underperforming products
Analyzed customer ordering behavior and average spend
🚀 How to Run
Import the dataset into your SQL environment (MySQL)
Create the table pizza_sales
Load the data into the table
Run the SQL queries provided in the project
Connect to Excel for dashboard visualization
