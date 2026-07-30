-- Dimension table for suppliers with denormalized geography
-- Co-authored with CoCo
WITH suppliers AS (
    SELECT * FROM {{ ref('stg_suppliers') }}
),

nations AS (
    SELECT * FROM {{ ref('stg_nations') }}
),

regions AS (
    SELECT * FROM {{ ref('stg_regions') }}
)

SELECT
    s.supplier_key,
    s.supplier_name,
    s.address,
    s.phone,
    s.account_balance,
    n.nation_name,
    r.region_name
FROM suppliers s
LEFT JOIN nations n ON s.nation_key = n.nation_key
LEFT JOIN regions r ON n.region_key = r.region_key
