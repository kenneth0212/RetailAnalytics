-- Fact table for order line items with calculated revenue metrics
-- Co-authored with CoCo
WITH lineitem AS (
    SELECT * FROM {{ ref('stg_lineitem') }}
),

orders AS (
    SELECT * FROM {{ ref('stg_orders') }}
)

SELECT
    li.order_key,
    li.line_number,
    o.customer_key,
    li.part_key,
    li.supplier_key,
    o.order_date,
    li.ship_date,
    li.commit_date,
    li.receipt_date,
    o.order_status,
    o.order_priority,
    li.ship_mode,
    li.ship_instruction,
    li.return_flag,
    li.line_status,
    li.quantity,
    li.extended_price,
    li.discount,
    li.tax,
    li.extended_price * (1 - li.discount) AS discounted_price,
    li.extended_price * (1 - li.discount) * (1 + li.tax) AS net_revenue
FROM lineitem li
INNER JOIN orders o ON li.order_key = o.order_key
