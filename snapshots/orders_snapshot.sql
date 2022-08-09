{% snapshot orders_snapshot_sl %}

    {{
        config(
          target_schema='snapshots',
          strategy='check',
          unique_key='o_orderkey',
          check_cols=['status'],
        )
    }}

    select * from {{ source('tpch', 'orders') }}


{% endsnapshot %}