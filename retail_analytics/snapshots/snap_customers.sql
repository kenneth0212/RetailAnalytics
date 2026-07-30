-- Snapshot tracking changes to customer attributes over time (SCD Type 2)
-- Co-authored with CoCo
{% snapshot snap_customers %}

{{
    config(
      target_schema='snapshots',
      unique_key='customer_key',
      strategy='check',
      check_cols=['customer_name', 'address', 'phone', 'account_balance', 'market_segment', 'nation_key']
    )
}}

SELECT * FROM {{ ref('stg_customers') }}

{% endsnapshot %}
