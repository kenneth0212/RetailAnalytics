-- Test: every order in fct_orders must have at least one line item
-- Co-authored with CoCo
SELECT
    o.order_key
FROM {{ ref('fct_orders') }} o
LEFT JOIN {{ ref('fct_order_items') }} oi ON o.order_key = oi.order_key
WHERE oi.order_key IS NULL
