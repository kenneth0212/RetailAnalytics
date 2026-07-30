-- Intermediate model summarizing customer order history
-- Co-authored with CoCo
WITH orders AS (
    SELECT * FROM {{ ref('stg_orders') }}
),

order_summary AS (
    SELECT * FROM {{ ref('int_order_items_summary') }}
)

SELECT
    o.customer_key,
    COUNT(DISTINCT o.order_key) AS total_orders,
    MIN(o.order_date) AS first_order_date,
    MAX(o.order_date) AS last_order_date,
    DATEDIFF('day', MIN(o.order_date), MAX(o.order_date)) AS customer_tenure_days,
    SUM(os.net_revenue) AS lifetime_revenue,
    AVG(os.net_revenue) AS avg_order_value,
    SUM(os.total_quantity) AS lifetime_quantity
FROM orders o
LEFT JOIN order_summary os ON o.order_key = os.order_key
GROUP BY o.customer_key
