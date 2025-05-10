
{% snapshot hosts_snapshot_view %}

    {{
        config(
            target_schema= 'snapshots',
            mateialized='view',
            unique_key= 'id',
            strategy= 'check',
            check_cols = ['superhost']
        )
    }}
    
    
  SELECT * FROM {{ ref("stg_airbnb_hosts") }}

{% endsnapshot %}