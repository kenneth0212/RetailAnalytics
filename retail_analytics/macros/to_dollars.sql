-- Macro to convert a price column to a rounded dollar amount
-- Co-authored with CoCo
{% macro to_dollars(column_name, precision=2) %}
    ROUND({{ column_name }}::DECIMAL(18, {{ precision }}), {{ precision }})
{% endmacro %}
