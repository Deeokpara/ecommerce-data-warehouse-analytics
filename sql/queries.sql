// Total Revenue

SELECT SUM(revenue) AS total_revenue
FROM sales;

// Monthly Sales Trend

SELECT 
    DATE_TRUNC('month', invoice_date) AS month,
    SUM(revenue) AS monthly_revenue
FROM sales
GROUP BY month
ORDER BY month;

// Top Customers

SELECT 
    customer_id,
    SUM(revenue) AS total_spent
FROM sales
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 10;

// Best-Selling Products

SELECT 
    product_id,
    SUM(quantity) AS total_quantity_sold
FROM sales
GROUP BY product_id
ORDER BY total_quantity_sold DESC
LIMIT 10;

// Revenue by Country
SELECT 
    c.country,
    SUM(s.revenue) AS total_revenue
FROM sales s
JOIN customers c 
    ON s.customer_id = c.customer_id
GROUP BY c.country
ORDER BY total_revenue DESC;

// Repeat Customers (Retention Insight) //
SELECT 
    customer_id,
    COUNT(DISTINCT invoice_no) AS order_count
FROM sales
GROUP BY customer_id
HAVING COUNT(DISTINCT invoice_no) > 1
ORDER BY order_count DESC;

// Profit (If You Add Cost Later) //
SELECT 
    SUM(revenue - (quantity * unit_price * 0.7)) AS estimated_profit
FROM sales;

// Indexes (Performance)//

CREATE INDEX idx_sales_customer ON sales(customer_id);
CREATE INDEX idx_sales_date ON sales(invoice_date);