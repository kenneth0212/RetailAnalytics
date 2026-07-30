-- Generated date dimension for time intelligence in Power BI
-- Co-authored with CoCo
WITH date_spine AS (
    SELECT
        DATEADD(DAY, seq4(), '1992-01-01'::DATE) AS date_key
    FROM TABLE(GENERATOR(ROWCOUNT => 2557))
)

SELECT
    date_key,
    YEAR(date_key) AS year,
    QUARTER(date_key) AS quarter,
    MONTH(date_key) AS month,
    MONTHNAME(date_key) AS month_name,
    WEEKOFYEAR(date_key) AS week_of_year,
    DAYOFWEEK(date_key) AS day_of_week,
    DAYNAME(date_key) AS day_name,
    DAY(date_key) AS day_of_month,
    CASE WHEN DAYOFWEEK(date_key) IN (0, 6) THEN TRUE ELSE FALSE END AS is_weekend,
    year || '-Q' || QUARTER(date_key) AS year_quarter,
    year || '-' || LPAD(MONTH(date_key), 2, '0') AS year_month
FROM date_spine
