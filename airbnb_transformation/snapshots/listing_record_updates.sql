{% snapshot listing_record_updates %}


 {{
        config(
            target_schema= 'snapshots',
            mateialized = 'view',
            unique_key= 'id',
            strategy= 'timestamp',
            updated_at = 'updated_at'
        )
    }}
      
    SELECT * FROM {{ ref("stg_airbnb_listings") }}


{% endsnapshot %}