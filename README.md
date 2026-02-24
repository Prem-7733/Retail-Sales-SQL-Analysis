# Retail-Sales-SQL-Analysis


#  Retail Sales Data Analysis (MySQL)

## 📌 Project Overview
This project analyzes retail sales data using MySQL to generate business insights for stakeholders.

The goal is to answer key business questions related to:
- Revenue growth
- Profitability
- Customer segmentation
- Sales performance
- Operational efficiency

---

## 📂 Dataset Information
- 2,000 retail transactions
- Features:
  - Sale Date
  - Sale Time
  - Customer ID
  - Gender
  - Age
  - Category
  - Quantity
  - Price per Unit
  - COGS
  - Total Sale

---

##  Business Questions Answered

1. Which category generates the highest revenue and profit margin?
2. What is the monthly sales trend?
3. Which customer segments drive the most revenue?
4. What is the Average Order Value (AOV)?
5. What time of day generates the most sales?
6. Which category has the highest cost-to-revenue ratio?
7. How much revenue comes from repeat customers?
8. Does quantity impact profitability?
9. Which demographics prefer which category?
10. Are there abnormal daily sales spikes?

---

##  Tools Used
- MySQL Workbench
- SQL (Aggregation, CASE, Window Functions, Group By)
- GitHub for version control

---

##  Key Insights
- Identified top-performing product categories
- Analyzed customer buying behavior
- Evaluated profit margins
- Detected revenue trends and outliers

---

##  How to Run

1. Import the dataset into MySQL
2. Create table `retail_sales`
3. Run the SQL queries inside the `/sql` folder
4. Analyze results
```sql
CREATE DATABASE p1_retail_db;

CREATE TABLE retail_sales
(
    transactions_id INT PRIMARY KEY,
    sale_date DATE,	
    sale_time TIME,
    customer_id INT,	
    gender VARCHAR(10),
    age INT,
    category VARCHAR(35),
    quantity INT,
    price_per_unit FLOAT,	
    cogs FLOAT,
    total_sale FLOAT
);
```
---

##  Author
Prem  
Aspiring Data Analyst | SQL | Power BI | Data Storytelling
