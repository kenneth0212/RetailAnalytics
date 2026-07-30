-- Dimension table for parts/products
-- Co-authored with CoCo
WITH parts AS (
    SELECT * FROM {{ ref('stg_parts') }}
)

SELECT
    part_key,
    part_name,
    manufacturer,
    brand,
    part_type,
    part_size,
    container,
    retail_price
FROM parts
