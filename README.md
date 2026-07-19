# 📊 Customer Churn Analytics Dashboard

## About the Project

I built this project to understand why customers stop purchasing and how customer churn affects business revenue.

The project covers the complete data analysis process, starting from data cleaning in SQL to building an interactive Power BI dashboard. The goal was not only to calculate business metrics but also to identify customer behavior, discover churn patterns, and provide practical business recommendations.

Throughout the project, I worked with customer, order, and product data to answer business questions such as:

- Which customers are most likely to churn?
- Which customer segments generate the highest revenue?
- How much revenue is at risk due to customer churn?
- Which acquisition channels perform the best?
- What actions can improve customer retention?

---

## Project Workflow

Raw Dataset

↓

Data Cleaning (SQL)

↓

Database Design

↓

Data Validation

↓

SQL Analysis

↓

Power BI Data Modeling

↓

DAX Measures

↓

Interactive Dashboard

↓

Business Insights & Recommendations

---

## Tools Used

- MySQL
- Power BI
- Power Query
- DAX
- Microsoft Excel
- GitHub

---

## Dataset

The project uses an e-commerce customer dataset containing three related tables.

**Customers**

Contains customer profile information such as

- Customer ID
- Country
- Gender
- Age
- Membership Tier
- Acquisition Channel
- Registration Date
- Churn Status

**Orders**

Contains

- Order ID
- Customer ID
- Product ID
- Order Date
- Order Amount

**Products**

Contains

- Product Category
- Average Rating
- Average Discount
- Return Rate

---

## Data Cleaning

Before starting the analysis, I cleaned and validated the data using SQL.

Some of the cleaning steps included:

- Removing duplicate records
- Trimming unnecessary spaces
- Standardizing text values
- Checking missing values
- Validating customer and product relationships
- Verifying data consistency

---

## Database Model

The database follows a relational model.

Customers
        │
        │
        ▼
      Orders
        ▲
        │
Products

The complete ER Diagram is available in the repository.

---

## Dashboard

The dashboard consists of five pages.

### Executive Summary

Provides a quick overview of overall business performance using KPIs and revenue trends.

Main KPIs

- Total Customers
- Total Orders
- Total Revenue
- Churn Rate
- Retention Rate
- Average Order Value

---

### Customer Analysis

Focuses on customer demographics and purchasing behaviour.

It answers questions like:

- Which countries have more customers?
- Which membership tier has the highest customers?
- Which acquisition channel brings more customers?
- How are customers distributed across age groups and gender?

---

### Sales Analysis

Analyzes product and sales performance.

It includes

- Revenue by Category
- Revenue at Risk
- Active Revenue
- Return Rate
- Product Performance

---

### Churn Analysis

This page focuses on customer churn.

It helps identify

- High-risk customer segments
- Revenue lost due to churn
- Churn by country
- Churn by membership tier
- Churn by age group
- Customer inactivity

---

### Business Recommendations

The final page summarizes the findings and provides recommendations that could help improve customer retention and business performance.

---

## Key KPIs

- Total Customers
- Total Orders
- Total Revenue
- Churn Rate
- Retention Rate
- Average Order Value
- Revenue at Risk
- Active Revenue
- Return Rate
- Repeat Customers
- Customer Lifetime Value

---

## Key Insights

Some important findings from the analysis include:

- Customers inactive for more than 90 days had the highest chance of churning.
- Gold membership customers contributed significant revenue but also showed relatively high churn.
- Organic Search generated strong customer acquisition.
- Revenue at Risk highlighted the financial impact of customer churn.
- Customer demographics helped identify high-risk customer segments.

---

## Business Recommendations

Based on the analysis, I recommend:

- Launch retention campaigns before customers become inactive for 90 days.
- Provide loyalty rewards for valuable customers.
- Personalize offers for high-risk customer groups.
- Track Revenue at Risk regularly.
- Continue monitoring churn trends through Power BI dashboards.

---

## Repository Structure

```
Customer-Churn-Analytics
│
├── Dataset
├── SQL
├── Power BI
├── Documentation
├── Images
└── README.md
```

---

## Author

**Jayasakthi S**

Aspiring Data Analyst

Skills:
SQL • Power BI • Excel • Power Query • DAX

Thank you for visiting this project.
Feedback and suggestions are always welcome.
