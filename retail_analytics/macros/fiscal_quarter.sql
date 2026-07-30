-- Macro to calculate fiscal quarter from a date column
-- Co-authored with CoCo
{% macro fiscal_quarter(date_column) %}
    CASE
        WHEN EXTRACT(MONTH FROM {{ date_column }}) BETWEEN 1 AND 3 THEN 'Q1'
        WHEN EXTRACT(MONTH FROM {{ date_column }}) BETWEEN 4 AND 6 THEN 'Q2'
        WHEN EXTRACT(MONTH FROM {{ date_column }}) BETWEEN 7 AND 9 THEN 'Q3'
        ELSE 'Q4'
    END
{% endmacro %}
