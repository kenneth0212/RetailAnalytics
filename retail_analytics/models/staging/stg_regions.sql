-- Staging model for regions with cleaned column names
-- Co-authored with CoCo
WITH source AS (
    SELECT * FROM {{ source('tpch', 'REGION') }}
)

SELECT
    r_regionkey AS region_key,
    r_name AS region_name,
    r_comment AS comment
FROM source
