--total sales by month

SELECT 
    strftime('%Y-%m', order_date) AS order_month, 
    category, 
    SUM(quantity * price) AS total_sales
FROM combined_sales_data csd 
GROUP BY 1, 2
ORDER BY 1, 3 DESC;


-- top 10 clients

SELECT 
    customer_name, 
    SUM(quantity * price) AS total_spent
FROM combined_sales_data csd 
GROUP BY customer_name
ORDER BY total_spent DESC
LIMIT 10;


-- total quantity sold by product

SELECT product_name, SUM(quantity) AS total_quantity_sold
FROM combined_sales_data csd 
GROUP BY 1
ORDER BY total_quantity_sold DESC; 


-- avg price for each category

SELECT category, round(AVG(price),2) AS avg_price
FROM combined_sales_data csd 
GROUP BY 1;


--popular week day sales

SELECT CASE strftime('%w', order_date)
        WHEN '0' THEN 'Sunday'
        WHEN '1' THEN 'Monday'
        WHEN '2' THEN 'Tuesday'
        WHEN '3' THEN 'Wednesday'
        WHEN '4' THEN 'Thursday'
        WHEN '5' THEN 'Friday'
        WHEN '6' THEN 'Saturday'
    END AS day_of_week,
    sum(quantity) AS total_quantity_sold
FROM combined_sales_data
GROUP BY 1
ORDER BY total_quantity_sold DESC;
