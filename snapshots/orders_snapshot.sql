{% snapshot orders_snapshot_sl %}

    {{
        config(
          target_schema='snapshots',
          strategy='check',
          unique_key='o_orderkey',
          check_cols=['o_orderstatus'],
        )
    }}

    select * from {{ source('tpch', 'orders') }}


{% endsnapshot %}