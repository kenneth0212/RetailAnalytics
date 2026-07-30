-- Staging model for suppliers with cleaned column names
-- Co-authored with CoCo
WITH source AS (
    SELECT * FROM {{ source('tpch', 'SUPPLIER') }}
)

SELECT
    s_suppkey AS supplier_key,
    s_name AS supplier_name,
    s_address AS address,
    s_nationkey AS nation_key,
    s_phone AS phone,
    s_acctbal AS account_balance,
    s_comment AS comment
FROM source
