-- Test: customer lifetime revenue should match sum of their order revenues
-- Co-authored with CoCo
WITH customer_orders AS (
    SELECT
        customer_key,
        SUM(net_revenue) AS total_from_orders
    FROM {{ ref('fct_orders') }}
    GROUP BY customer_key
),

customer_summary AS (
    SELECT
        customer_key,
        lifetime_revenue
    FROM {{ ref('int_customer_orders') }}
)

SELECT
    co.customer_key,
    co.total_from_orders,
    cs.lifetime_revenue,
    ABS(co.total_from_orders - cs.lifetime_revenue) AS difference
FROM customer_orders co
JOIN customer_summary cs ON co.customer_key = cs.customer_key
WHERE ABS(co.total_from_orders - cs.lifetime_revenue) > 0.01
