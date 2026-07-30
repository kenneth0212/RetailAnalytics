-- Staging model for nations with cleaned column names
-- Co-authored with CoCo
WITH source AS (
    SELECT * FROM {{ source('tpch', 'NATION') }}
)

SELECT
    n_nationkey AS nation_key,
    n_name AS nation_name,
    n_regionkey AS region_key,
    n_comment AS comment
FROM source
