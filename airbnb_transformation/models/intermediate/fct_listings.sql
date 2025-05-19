{{
    config(
        materialized='incremental',
        unique_key='listing_key',
        incremental_strategy = 'merge'
        )
}}



WITH fct_listings AS (

    SELECT {{ dbt_utils.generate_surrogate_key(['l.id']) }} AS listing_key,
            {{ dbt_utils.generate_surrogate_key(['l.host_id']) }} AS host_key,
            {{dbt_utils.generate_surrogate_key(['l.created_at']) }} AS date_key,
            l.name AS listing_name, l.room_type, l.minimum_nights, 
            {{ normalize_price('l.price') }} AS listing_price,
            {{date_formatting("l.updated_at") }} AS updated_at

    FROM {{ ref("stg_airbnb_listings") }} l
)



SELECT * 
FROM fct_listings
