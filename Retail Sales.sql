01_revenue_profit_by_category.sql
/*
1.Business Question:
Which product category generates the highest revenue and profit margin?

Stakeholder Objective:
Identify high-performing and high-margin categories 
to optimize pricing strategy, promotions, and inventory allocation.

Key Metrics:
- Total Revenue
- Total COGS
- Total Profit
- Profit Margin %
*/

SELECT 
    category,
    SUM(total_sale) AS total_revenue,
    SUM(cogs) AS total_cogs,
    SUM(total_sale - cogs) AS total_profit,
    ROUND((SUM(total_sale - cogs) / SUM(total_sale)) * 100, 2) AS profit_margin_pct
FROM retail_sales
GROUP BY category
ORDER BY total_revenue DESC;


02_monthly_sales_trend.sql
/*
2.Business Question:
What is the monthly sales trend and growth pattern?

Stakeholder Objective:
Monitor business growth, detect seasonality, 
and identify revenue fluctuations over time.

Key Metrics:
- Monthly Revenue
- Month-over-Month Growth %
*/

SELECT 
    YEAR(sale_date) AS year,
    MONTH(sale_date) AS month,
    SUM(total_sale) AS monthly_revenue
FROM retail_sales
GROUP BY YEAR(sale_date), MONTH(sale_date)
ORDER BY year, month;


03_customer_segmentation.sql
/*
3.Business Question:
Which customer segments (age group and gender) contribute the most revenue?

Stakeholder Objective:
Identify core target audience to improve marketing 
and customer acquisition strategy.

Key Metrics:
- Revenue by Age Group
- Revenue by Gender
*/
    

SELECT 
    CASE 
        WHEN age BETWEEN 18 AND 25 THEN '18-25'
        WHEN age BETWEEN 26 AND 35 THEN '26-35'
        WHEN age BETWEEN 36 AND 45 THEN '36-45'
        ELSE '46+'
    END AS age_group,
    gender,
    SUM(total_sale) AS total_revenue
FROM retail_sales
GROUP BY age_group, gender
ORDER BY total_revenue DESC;


04_average_order_value.sql
/*
4.Business Question:
What is the Average Order Value (AOV) across product categories?

Stakeholder Objective:
Evaluate purchasing behavior and assess opportunities 
for upselling or bundling strategies.

Key Metrics:
- Total Revenue
- Total Transactions
- Average Order Value
*/

SELECT 
    category,
    COUNT(*) AS total_transactions,
    SUM(total_sale) AS total_revenue,
    ROUND(SUM(total_sale) / COUNT(*), 2) AS avg_order_value
FROM retail_sales
GROUP BY category
ORDER BY avg_order_value DESC;


05_sales_by_time_of_day.sql
/*
5.Business Question:
At what time of day does the business generate the most revenue?

Stakeholder Objective:
Optimize staffing, promotions, and operational efficiency 
based on peak sales hours.

Key Metrics:
- Revenue by Time Segment
*/

SELECT 
    CASE 
        WHEN HOUR(sale_time) BETWEEN 6 AND 11 THEN 'Morning'
        WHEN HOUR(sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS time_of_day,
    SUM(total_sale) AS total_revenue
FROM retail_sales
GROUP BY time_of_day
ORDER BY total_revenue DESC;


06_cost_to_revenue_ratio.sql
/*
6.Business Question:
Which category has the highest cost-to-revenue ratio?

Stakeholder Objective:
Evaluate pricing efficiency and cost control 
to protect profit margins.

Key Metrics:
- Total Revenue
- Total COGS
- Cost-to-Revenue %
*/

SELECT 
    category,
    SUM(cogs) AS total_cogs,
    SUM(total_sale) AS total_revenue,
    ROUND((SUM(cogs) / SUM(total_sale)) * 100, 2) AS cost_to_revenue_pct
FROM retail_sales
GROUP BY category
ORDER BY cost_to_revenue_pct DESC;



07_repeat_customer_analysis.sql
/*
7.Business Question:
How much revenue is generated from repeat customers vs one-time buyers?

Stakeholder Objective:
Measure customer retention impact and evaluate loyalty strength.

Key Metrics:
- Revenue from Repeat Customers
- Revenue from One-Time Customers
*/

SELECT 
    customer_type,
    SUM(total_sale) AS total_revenue
FROM (
    SELECT 
        customer_id,
        CASE 
            WHEN COUNT(*) > 1 THEN 'Repeat'
            ELSE 'One-Time'
        END AS customer_type,
        SUM(total_sale) AS total_sale
    FROM retail_sales
    GROUP BY customer_id
) t
GROUP BY customer_type;



08_quantity_vs_profit.sql
/*
8.Business Question:
Does purchasing higher quantities increase profitability?

Stakeholder Objective:
Assess effectiveness of bulk purchase strategies 
and potential discount impact.

Key Metrics:
- Profit by Quantity
- Average Profit per Transaction
*/

SELECT 
    quantity,
    SUM(total_sale - cogs) AS total_profit,
    ROUND(AVG(total_sale - cogs), 2) AS avg_profit_per_transaction
FROM retail_sales
GROUP BY quantity
ORDER BY quantity;



09_category_by_demographics.sql
/*
9.Business Question:
Which demographic groups prefer specific product categories?

Stakeholder Objective:
Align marketing campaigns with demographic purchasing behavior.

Key Metrics:
- Purchase Count by Gender & Category
- Revenue by Gender & Category
*/

SELECT 
    gender,
    category,
    COUNT(*) AS total_purchases,
    SUM(total_sale) AS total_revenue
FROM retail_sales
GROUP BY gender, category
ORDER BY total_revenue DESC;



10_daily_sales_outliers.sql
/*
10.Business Question:
Are there abnormal daily sales spikes or drops?

Stakeholder Objective:
Identify unusual sales patterns that may indicate 
promotions, operational issues, or anomalies.

Key Metrics:
- Daily Revenue
*/

SELECT 
    sale_date,
    SUM(total_sale) AS daily_revenue
FROM retail_sales
GROUP BY sale_date
ORDER BY daily_revenue DESC;














































