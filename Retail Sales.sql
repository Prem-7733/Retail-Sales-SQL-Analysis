select * from retail_sales

1. Which category generates the highest revenue and profit margin?
    
```sql
SELECT 
    category,
    SUM(total_sale) AS total_revenue,
    SUM(cogs) AS total_cogs,
    SUM(total_sale - cogs) AS total_profit,
    ROUND((SUM(total_sale - cogs) / SUM(total_sale)) * 100, 2) AS profit_margin_pct
FROM retail_sales
GROUP BY category
ORDER BY total_revenue DESC;
```

2. What is the monthly sales trend?

```sql    
SELECT 
    YEAR(sale_date) AS year,
    MONTH(sale_date) AS month,
    SUM(total_sale) AS monthly_revenue
FROM retail_sales
GROUP BY YEAR(sale_date), MONTH(sale_date)
ORDER BY year, month;
```

3. Which customer segments drive the most revenue?


```sql
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
```


4. What is the Average Order Value (AOV)?

```sql  
SELECT 
    category,
    COUNT(*) AS total_transactions,
    SUM(total_sale) AS total_revenue,
    ROUND(SUM(total_sale) / COUNT(*), 2) AS avg_order_value
FROM retail_sales
GROUP BY category
ORDER BY avg_order_value DESC;
```


5. What time of day generates the most sales?

```sql
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
```


6. Which category has the highest cost-to-revenue ratio?

```sql
SELECT 
    category,
    SUM(cogs) AS total_cogs,
    SUM(total_sale) AS total_revenue,
    ROUND((SUM(cogs) / SUM(total_sale)) * 100, 2) AS cost_to_revenue_pct
FROM retail_sales
GROUP BY category
ORDER BY cost_to_revenue_pct DESC;
```


7. How much revenue comes from repeat customers?

```sql    
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
```



8. Does quantity impact profitability?

```sql
SELECT 
    quantiy,
    SUM(total_sale - cogs) AS total_profit,
    ROUND(AVG(total_sale - cogs), 2) AS avg_profit_per_transaction
FROM retail_sales
GROUP BY quantiy
ORDER BY quantiy;
```


9. Which demographics prefer which category?

```sql    
SELECT 
    gender,
    category,
    COUNT(*) AS total_purchases,
    SUM(total_sale) AS total_revenue
FROM retail_sales
GROUP BY gender, category
ORDER BY total_revenue DESC;
```


10. Are there abnormal daily sales spikes?


```sql    
SELECT 
    sale_date,
    SUM(total_sale) AS daily_revenue
FROM retail_sales
GROUP BY sale_date
ORDER BY daily_revenue DESC;
```

----End Of The Project----













