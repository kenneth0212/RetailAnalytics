-- Snapshot tracking changes to supplier attributes over time (SCD Type 2)
-- Co-authored with CoCo
{% snapshot snap_suppliers %}

{{
    config(
      target_schema='snapshots',
      unique_key='supplier_key',
      strategy='check',
      check_cols=['supplier_name', 'address', 'phone', 'account_balance', 'nation_key']
    )
}}

SELECT * FROM {{ ref('stg_suppliers') }}

{% endsnapshot %}
