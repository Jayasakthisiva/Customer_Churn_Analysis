-- Total Customers
SELECT
count(*) AS Total_customer,
FROM customers;

-- Total orders
SELECT
count(*) AS Total_orders,
FROM orders;

-- Total products
SELECT
DISTINCT(product_id) AS Total_products,
FROM products;

-- Total Churned and Active customers
SELECT
sum(churned=1) AS Churned_customer,
sum(churned=0) AS Active_customers
FROM customers;

-- Churned rate
SELECT
count(customer_id) AS Total_customers,
sum(churned=1) AS Total_churnes,
round(sum(churned=1)/count(customer_id) * 100,2) AS Churned_rate
FROM customers;

-- Overall Retension rate
SELECT
sum(churned=0) AS Active_customers,
count(customer_id) AS Total_customers,
round((sum(churned=0)/count(customer_id)*100),2) AS Retension_rate
FROM customers;

-- Revenue at Risk
SELECT 
SUM(o.total_amount_usd) AS Revenue_at_Risk
FROM orders o 
JOIN customers c
ON o.customer_id =c.customer_id
WHERE churned = 1;

-- Customer Lifetime Value
SELECT
customer_id,
ROUND(SUM(total_amount_usd), 2) AS Customer_Lifetime_Value
FROM orders
GROUP BY customer_id
ORDER BY Customer_Lifetime_Value DESC;

-- Average Customer Lifetime Value
SELECT
    ROUND(AVG(customer_total), 2) AS Avg_Customer_Lifetime_Value
FROM (
    SELECT
        customer_id,
        SUM(total_amount_usd) AS customer_total
    FROM orders
    GROUP BY customer_id
) AS t;

-- Repeat Customers
SELECT count(*) as Repeat_Customers
FROM (
SELECT
customer_id,
count(order_id) AS Total_customers
FROM orders
GROUP BY customer_id
HAVING count(order_id) > 1
) t;

-- Average Order Value
SELECT
count(order_id) AS Total_orders,
sum(total_amount_usd) AS Total_Revenue,
round(sum(total_amount_usd)/count(order_id),2) AS Avg_order_value
FROM orders ;
