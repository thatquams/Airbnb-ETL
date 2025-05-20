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
            {{ date_formatting ('l.created_at') }} AS listing_created_at,
            l.name AS listing_name, l.room_type, l.minimum_nights, 
            {{ normalize_price('l.price') }} AS listing_price,

    FROM {{ ref("stg_airbnb_listings") }} l
), 
final AS (
    SELECT listing_key, host_key,{{ dbt_utils.generate_surrogate_key(['listing_created_at']) }} AS date_key,
    listing_name, room_type, minimum_nights, listing_price, listing_created_at FROM fct_listings

)

SELECT * 
FROM final
