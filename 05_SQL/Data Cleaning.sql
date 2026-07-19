-- Check for duplicate Customer IDs
SELECT Customer_id, COUNT(*)
FROM customers
GROUP BY Customer_id
HAVING COUNT(*) > 1;
-- Result: No duplicate records found.

-- Check for duplicate Order IDs
SELECT order_id,count(*)
FROM orders
GROUP BY order_id
HAVING count(*) > 1;
-- Result: No duplicate records found.

-- Check for duplicate Product IDs
SELECT product_id,count(*)
FROM products
GROUP BY product_id
HAVING count(*) > 1;
-- Result: No duplicate records found.

-- Check Trim space
SELECT
    customer_id,
    country <> TRIM(country) AS country_space,
    gender <> TRIM(gender) AS gender_space,
    membership_tier <> TRIM(membership_tier) AS membership_space,
    preferred_category <> TRIM(preferred_category) AS preferred_category_sapce,
    preferred_device <> TRIM(preferred_device) AS preferred_device_space,
    preferred_payment_method <> TRIM(preferred_payment_method) AS preferred_payment_method_space,
    acquisition_channel <> TRIM(acquisition_channel) AS channel_space
FROM customers;

SELECT
    product_id,
    product_name <> TRIM(product_name) AS product_name_space,
    category <> TRIM(category) AS category_space
    FROM products;

SELECT
    order_id,
    day_of_week <> TRIM(day_of_week) AS day_of_week_space,
    product_name <> TRIM(product_name) AS product_name_space,
	category <> TRIM(category) AS category_sapce,
    device_used <> TRIM(device_used) AS device_used_space,
    payment_method <> TRIM(payment_method) AS payment_method_space,
    order_status <> TRIM(order_status) AS order_status_space
FROM orders;
-- Result: No space records found.

-- Check blank space
SELECT
    SUM(TRIM(country) = '') AS country_blank,
    SUM(TRIM(gender) = '') AS gender_blank,
    SUM(TRIM(membership_tier) = '') AS membership_tier_blank,
    SUM(TRIM(preferred_device) = '') AS preferred_device_blank,
    SUM(TRIM(preferred_payment_method) = '') AS preferred_payment_method_blank,
    SUM(TRIM(acquisition_channel) = '') AS acquisition_channel_blank
FROM customers;

SELECT
    SUM(TRIM(product_id) = '') AS blank_product_id,
    SUM(TRIM(category) = '') AS blank_category,
    SUM(TRIM(product_name) = '') AS blank_product_name
FROM products;

SELECT
    SUM(TRIM(order_id) = '') AS blank_order_id,
    SUM(TRIM(customer_id) = '') AS blank_customer_id,
    SUM(TRIM(quarter) = '') AS blank_quarter,
    SUM(TRIM(day_of_week) = '') AS blank_day_of_week,
    SUM(TRIM(product_name) = '') AS blank_product_name,
    SUM(TRIM(category) = '') AS blank_category,
    SUM(TRIM(payment_method) = '') AS blank_payment_method,
    SUM(TRIM(device_used) = '') AS blank_device_used,
    SUM(TRIM(order_status) = '') AS blank_order_status
FROM orders;

-- Check Null Value
SELECT
    SUM(product_id IS NULL) AS product_id_null,
    SUM(category IS NULL) AS category_null,
    SUM(product_name IS NULL) AS product_name_null,
    SUM(total_orders IS NULL) AS total_orders_null,
    SUM(total_revenue_usd IS NULL) AS total_revenue_null,
    SUM(avg_price IS NULL) AS avg_price_null,
    SUM(avg_rating IS NULL) AS avg_rating_null,
    SUM(return_rate IS NULL) AS return_rate_null,
    SUM(avg_discount_pct IS NULL) AS avg_discount_pct_null,
    SUM(avg_delivery_days IS NULL) AS avg_delivery_days_null
FROM products;
 
 SELECT
    SUM(customer_id IS NULL) AS customer_id_null,
    SUM(country IS NULL) AS country_null,
    SUM(age IS NULL) AS age_null,
    SUM(gender IS NULL) AS gender_null,
    SUM(membership_tier IS NULL) AS membership_tier_null,
    SUM(registration_date IS NULL) AS registration_date_null,
    SUM(total_orders IS NULL) AS total_orders_null,
    SUM(total_spend_usd IS NULL) AS total_spend_null,
    SUM(avg_order_value_usd IS NULL) AS avg_order_value_null,
    SUM(days_since_last_purchase IS NULL) AS days_since_last_purchase_null,
    SUM(preferred_category IS NULL) AS preferred_category_null,
    SUM(preferred_device IS NULL) AS preferred_device_null,
    SUM(preferred_payment_method IS NULL) AS preferred_payment_method_null,
    SUM(acquisition_channel IS NULL) AS acquisition_channel_null,
    SUM(reviews_given IS NULL) AS reviews_given_null,
    SUM(avg_review_score IS NULL) AS avg_review_score_null,
    SUM(returns_made IS NULL) AS returns_made_null,
    SUM(wishlist_items IS NULL) AS wishlist_items_null,
    SUM(newsletter_subscribed IS NULL) AS newsletter_subscribed_null,
    SUM(churned IS NULL) AS churned_null
FROM customers;

SELECT
    SUM(order_id IS NULL) AS order_id_null,
    SUM(customer_id IS NULL) AS customer_id_null,
    SUM(order_date IS NULL) AS order_date_null,
    SUM(year IS NULL) AS year_null,
    SUM(month IS NULL) AS month_null,
    SUM(quarter IS NULL) AS quarter_null,
    SUM(product_name IS NULL) AS product_name_null,
    SUM(category IS NULL) AS category_null,
    SUM(unit_price_usd IS NULL) AS unit_price_null,
    SUM(quantity IS NULL) AS quantity_null,
    SUM(subtotal_usd IS NULL) AS subtotal_null,
    SUM(discount_pct IS NULL) AS discount_pct_null,
    SUM(discount_amount_usd IS NULL) AS discount_amount_null,
    SUM(shipping_fee_usd IS NULL) AS shipping_fee_null,
    SUM(tax_pct IS NULL) AS tax_pct_null,
    SUM(tax_amount_usd IS NULL) AS tax_amount_null,
    SUM(total_amount_usd IS NULL) AS total_amount_null,
    SUM(payment_method IS NULL) AS payment_method_null,
    SUM(device_used IS NULL) AS device_used_null,
    SUM(delivery_days IS NULL) AS delivery_days_null,
    SUM(delivery_date IS NULL) AS delivery_date_null,
    SUM(order_status IS NULL) AS order_status_null,
    SUM(returned IS NULL) AS returned_null,
    SUM(customer_rating IS NULL) AS customer_rating_null,
    SUM(session_duration_minutes IS NULL) AS session_duration_null,
    SUM(pages_viewed_before_purchase IS NULL) AS pages_viewed_null,
    SUM(is_repeat_customer IS NULL) AS is_repeat_customer_null
FROM orders;

-- Updating null value
SET SQL_SAFE_UPDATES = 0;

UPDATE orders
SET customer_rating = NULL
WHERE customer_rating = 0;

SET SQL_SAFE_UPDATES =1;

-- Updating Customer rating 
UPDATE orders
SET customer_rating =
(
    SELECT avg_rating
    FROM
    (
        SELECT ROUND(AVG(customer_rating),2) avg_rating
        FROM orders
        WHERE customer_rating IS NOT NULL
    ) t
)
WHERE customer_rating IS NULL;

-- Updating age segment
UPDATE customers
SET  age_segmentation= 
CASE 
WHEN age between 18 and 24 THEN "18-24"
WHEN age between 25 and 34 THEN "25-34"
WHEN age between 35 and 44 THEN "35-44"
WHEN age between 45 and 54 THEN "45-54"
ELSE ">= 55"
END;
 
-- Invalid data 
SELECT  total_amount_usd 
FROM orders
WHERE total_amount_usd <= 0 ;

SELECT age 
FROM customers 
WHERE age <=0 and age >= 100;

SELECT registration_date 
FROM customers 
WHERE registration_date > curdate();

SELECT UPPER(TRIM(category)) AS standardized_category,
COUNT(*) AS total
FROM products
GROUP BY UPPER(TRIM(category));

SELECT days_since_last_purchase 
FROM customers
WHERE days_since_last_purchase < 0 ;
