-- Analysis: Monthly revenue trend by region
-- Co-authored with CoCo
WITH order_items AS (
    SELECT * FROM {{ ref('fct_order_items') }}
),

customers AS (
    SELECT * FROM {{ ref('dim_customer') }}
)

SELECT
    DATE_TRUNC('month', oi.order_date) AS order_month,
    c.region_name,
    COUNT(DISTINCT oi.order_key) AS total_orders,
    SUM(oi.net_revenue) AS monthly_revenue,
    AVG(oi.net_revenue) AS avg_line_item_revenue
FROM order_items oi
JOIN customers c ON oi.customer_key = c.customer_key
GROUP BY 1, 2
ORDER BY 1, 2
