-- Staging model for orders with cleaned column names
-- Co-authored with CoCo
WITH source AS (
    SELECT * FROM {{ source('tpch', 'ORDERS') }}
)

SELECT
    o_orderkey AS order_key,
    o_custkey AS customer_key,
    o_orderstatus AS order_status,
    o_totalprice AS total_price,
    o_orderdate AS order_date,
    o_orderpriority AS order_priority,
    o_clerk AS clerk,
    o_shippriority AS ship_priority,
    o_comment AS comment
FROM source
