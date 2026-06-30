## Overview

This project uses a simulated e-commerce customer dataset to analyze customer behavior, purchasing patterns, sales performance, and customer churn. The dataset consists of multiple related tables representing customers, orders, products, and monthly sales summaries, enabling end-to-end business analysis and dashboard development.
---

## Dataset Source
- **Source:** Kaggle
- **Dataset Type:** Simulated E-Commerce Customer Churn Dataset
- **Usage:** Educational and Portfolio Project
---

## Project Domain
**E-Commerce Analytics**
---

## Dataset Files
| File Name | Description |
|-----------|-------------|
| customers.csv | Contains customer demographics, membership details, shopping preferences, and churn information. |
| orders.csv | Contains order-level transactional data, payment details, delivery information, and customer interactions. |
| products.csv | Contains product details along with sales and performance metrics. |
| monthly_sales.csv | Contains monthly aggregated business metrics including revenue, orders, customer growth, and sales trends. |
| data_dictionary.xlsx | Documents the metadata for each dataset, including column names, data types, and descriptions. |
---

## Dataset Structure
| Table | Number of Records | Description |
|-------|------------------:|-------------|
| Customers | Customer-level data | Stores customer profile and behavioral information. |
| Orders | Order-level data | Stores individual purchase transactions. |
| Products | Product-level data | Stores product information and performance statistics. |
| Monthly Sales | Monthly summary | Stores aggregated monthly business metrics. |
> *Record counts may vary depending on the dataset version.*
---

## Primary Keys
| Table | Primary Key |
|--------|-------------|
| Customers | customer_id |
| Orders | order_id |
| Products | product_name *(used as a unique identifier in this dataset)* |
| Monthly Sales | Composite Key (year, month) |
---

## Table Relationships
| Parent Table | Child Table | Relationship |
|--------------|-------------|--------------|
| Customers | Orders | One-to-Many |
| Products | Orders | One-to-Many (via product_name) |
---

## Business Objective
The primary objective of this dataset is to identify customers who are at risk of churning and uncover the key business factors influencing customer retention. The analysis aims to support data-driven decision-making by providing actionable insights into customer behavior, sales trends, and product performance.
---

## Project Scope
This dataset supports the following analyses:

- Customer Churn Analysis
- Customer Segmentation
- Sales Trend Analysis
- Product Performance Analysis
- Revenue Analysis
- Customer Retention Analysis
- Customer Purchase Behavior Analysis
- KPI Reporting
- Interactive Dashboard Development
---

## Tools & Technologies
- MySQL
- Microsoft Excel
- Power Query
- Power BI
- Git & GitHub
---

## Notes
- This dataset was obtained from Kaggle for educational and portfolio purposes.
- The raw dataset is preserved without modification.
- Data cleaning and transformation (ETL) are performed using Power Query.
- SQL is used for exploratory data analysis, KPI calculations, and business insights.
- Power BI is used to develop interactive dashboards and visualizations.
