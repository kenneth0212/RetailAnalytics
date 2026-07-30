-- Intermediate model aggregating line items to order grain
-- Co-authored with CoCo
WITH lineitem AS (
    SELECT * FROM {{ ref('stg_lineitem') }}
)

SELECT
    order_key,
    COUNT(*) AS line_item_count,
    SUM(quantity) AS total_quantity,
    SUM(extended_price) AS gross_revenue,
    SUM(extended_price * (1 - discount)) AS discounted_revenue,
    SUM(extended_price * (1 - discount) * (1 + tax)) AS net_revenue,
    AVG(discount) AS avg_discount,
    MIN(ship_date) AS first_ship_date,
    MAX(ship_date) AS last_ship_date
FROM lineitem
GROUP BY order_key
