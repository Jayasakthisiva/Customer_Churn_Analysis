-- ====================================================
-- Customer Churn Analytics
-- Database Schema
-- ====================================================
CREATE DATABASE customer_churn;

USE customer_churn;

SHOW CREATE TABLE customers;

SHOW CREATE TABLE orders;

SHOW CREATE TABLE products;

DESCRIBE customers;

DESCRIBE orders;

DESCRIBE products;

ALTER TABLE customers 
MODIFY customer_id VARCHAR(10) NOT NULL;

ALTER TABLE orders
ADD CONSTRAINT fk_orders_customers
FOREIGN KEY (customer_id)
REFERENCES customers(customer_id);

ALTER TABLE orders
ADD CONSTRAINT fk_orders_products
FOREIGN KEY (product_id)
REFERENCES products(product_id);

ALTER TABLE customers
MODIFY registration_date date;

ALTER TABLE orders
MODIFY order_id VARCHAR (10) NOT NULL ;

ALTER TABLE orders
ADD PRIMARY KEY (order_id);

ALTER TABLE orders 
MODIFY order_date date; 

ALTER TABLE orders 
MODIFY COLUMN delivery_date date; 

ALTER TABLE orders
MODIFY customer_rating DECIMAL(3,1);
