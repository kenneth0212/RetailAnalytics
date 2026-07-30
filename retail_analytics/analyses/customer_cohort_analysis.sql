-- Analysis: Customer cohort analysis by first order year
-- Co-authored with CoCo
WITH customer_cohorts AS (
    SELECT
        customer_key,
        first_order_date,
        DATE_TRUNC('year', first_order_date) AS cohort_year,
        lifetime_revenue,
        total_orders
    FROM {{ ref('int_customer_orders') }}
),

orders AS (
    SELECT * FROM {{ ref('fct_orders') }}
)

SELECT
    cc.cohort_year,
    DATEDIFF('year', cc.cohort_year, DATE_TRUNC('year', o.order_date)) AS years_since_first_order,
    COUNT(DISTINCT cc.customer_key) AS active_customers,
    SUM(o.net_revenue) AS cohort_revenue,
    AVG(o.net_revenue) AS avg_order_value
FROM customer_cohorts cc
JOIN orders o ON cc.customer_key = o.customer_key
GROUP BY 1, 2
ORDER BY 1, 2
