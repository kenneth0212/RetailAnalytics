-- Test: net revenue should always be positive for non-returned items
-- Co-authored with CoCo
SELECT
    order_key,
    line_number,
    net_revenue
FROM {{ ref('fct_order_items') }}
WHERE return_flag = 'N'
  AND net_revenue <= 0
