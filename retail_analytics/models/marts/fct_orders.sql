-- Fact table for orders at order-header grain with aggregated metrics
-- Co-authored with CoCo
WITH orders AS (
    SELECT * FROM {{ ref('stg_orders') }}
),

order_summary AS (
    SELECT * FROM {{ ref('int_order_items_summary') }}
)

SELECT
    o.order_key,
    o.customer_key,
    o.order_date,
    o.order_status,
    o.order_priority,
    o.clerk,
    o.ship_priority,
    o.total_price,
    os.line_item_count,
    os.total_quantity,
    os.gross_revenue,
    os.discounted_revenue,
    os.net_revenue,
    os.avg_discount,
    os.first_ship_date,
    os.last_ship_date,
    DATEDIFF('day', o.order_date, os.first_ship_date) AS days_to_first_ship
FROM orders o
LEFT JOIN order_summary os ON o.order_key = os.order_key
