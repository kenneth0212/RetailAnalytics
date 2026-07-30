-- Dimension table for customers with denormalized geography
-- Co-authored with CoCo
WITH customers AS (
    SELECT * FROM {{ ref('stg_customers') }}
),

nations AS (
    SELECT * FROM {{ ref('stg_nations') }}
),

regions AS (
    SELECT * FROM {{ ref('stg_regions') }}
)

SELECT
    c.customer_key,
    c.customer_name,
    c.address,
    c.phone,
    c.account_balance,
    c.market_segment,
    n.nation_name,
    r.region_name
FROM customers c
LEFT JOIN nations n ON c.nation_key = n.nation_key
LEFT JOIN regions r ON n.region_key = r.region_key
