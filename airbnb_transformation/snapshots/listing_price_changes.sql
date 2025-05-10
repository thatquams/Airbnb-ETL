{% snapshot listing_price_changes %}


 {{
        config(
            target_schema= 'snapshots',
            mateialized = 'view',
            unique_key= 'id',
            strategy= 'check',
            check_cols = ['price']
        )
    }}
      
    SELECT * FROM {{ ref("stg_airbnb_listings") }}


{% endsnapshot %}