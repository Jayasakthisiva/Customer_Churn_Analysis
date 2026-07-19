-- What is the revenue by Membership?
SELECT 
c.membership_tier,
round(sum(o.total_amount_usd),2) AS Total_revenue
FROM customers c
JOIN orders o
ON c.customer_id =o.customer_id
GROUP BY c.membership_tier
ORDER BY Total_revenue desc;

-- What is the revenue by acquisition channel?
SELECT 
c.acquisition_channel,
round(sum(o.total_amount_usd),2) AS Total_revenue
FROM customers c
JOIN orders o
ON c.customer_id =o.customer_id
GROUP BY c.acquisition_channel
ORDER BY Total_revenue DESC;

-- How much Churn by Country?
SELECT country,
COUNT(*) AS Total_customers,
SUM(churned = 1) AS Total_churned_customers,
ROUND(SUM(churned = 1) / COUNT(*) * 100, 2) AS churn_rate
FROM customers
GROUP BY country
ORDER BY churn_rate DESC
LIMIT 5;

-- What are the Top 5 Products as per revenue?
SELECT
p.product_name,
round(sum(o.total_amount_usd),2) AS Total_Revenue
FROM orders O
JOIN products p
ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY Total_revenue DESC
LIMIT 5;

-- What are the Top 5 Category as per revenue?
SELECT
p.category,
round(sum(o.total_amount_usd),2) AS Total_Revenue
FROM orders O
JOIN products p
ON o.product_id = p.product_id
GROUP BY p.category
ORDER BY Total_revenue DESC
LIMIT 5;

-- Which customer segments are most likely to churn?
SELECT 
age_segmentation,
count(*) AS total_customers,
sum(churned='yes') AS total_churn,
round((sum(churned='yes')/count(*) *100.0),2) AS churned_rate
FROM customers
GROUP BY age_segmentation
ORDER BY churned_rate DESC;

-- Which membership_tier are most likely to churn?
SELECT 
membership_tier,
count(*) AS total_customers,
sum(churned='yes') AS total_churn,
round((sum(churned='yes')/count(*) *100.0),2) AS churned_rate
FROM customers
GROUP BY membership_tier
ORDER BY churned_rate DESC;

-- Which acquisition channel brings loyal customers?
SELECT 
acquisition_channel,
count(*) AS total_customers,
sum(churned='yes') AS total_churn,
round((sum(churned='yes')/count(*) *100.0),2) AS churned_rate,
avg(returns_made) AS average_return
FROM customers
GROUP BY acquisition_channel
ORDER BY churned_rate DESC;

-- Which products drive the most revenue?
SELECT
product_name,
round(sum(total_amount_usd),2) AS product_revenue,
round(avg(tax_amount_usd),2) AS average_tax,
round(avg(shipping_fee_usd),2) AS average_shipping_charge
FROM orders 
where returned = 0
GROUP BY product_name 
ORDER BY product_revenue DESC;

-- Which payment methods are associated with higher churn?
SELECT
preferred_payment_method,
COUNT(*) AS total_customers,
SUM(churned = 'Yes') AS churned_customers,
ROUND(SUM(churned = 'Yes') * 100.0 / COUNT(*), 2) AS churn_rate
FROM customers
GROUP BY preferred_payment_method
ORDER BY churn_rate DESC;

-- Where should the company invest its marketing budget?
SELECT
acquisition_channel,
COUNT(*) AS total_customers,
SUM(churned = 'no') AS Loyal_customers,
ROUND(SUM(churned = 'yes') * 100.0 / COUNT(*), 2) AS churn_rate
FROM customers
GROUP BY acquisition_channel
ORDER BY churn_rate DESC;

-- How much revenue lost in return per category ?
SELECT
category,
ROUND(SUM(total_amount_usd),2) AS revenue_lost
FROM orders
WHERE returned=1
GROUP BY category
ORDER BY revenue_lost DESC;

-- Which country has the highest revenue loss due to churn among Premium members?
SELECT 
c.country,
round(sum(o.total_amount_usd),2) AS Total_revenue,
round(sum(case when c.churned='yes' then o.total_amount_usd else 0 end ),2) AS Revenue_loss,
round(sum(case when c.churned='yes' then o.total_amount_usd else 0 end )/sum(o.total_amount_usd)*100.0,2) AS Revenue_loss_percentage
FROM customers c 
JOIN orders o 
ON c.customer_id = o.customer_id
WHERE c.membership_tier ='platinum'
GROUP BY c.country
ORDER BY revenue_loss DESC;
