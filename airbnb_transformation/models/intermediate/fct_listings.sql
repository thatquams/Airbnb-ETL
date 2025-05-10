{{
    config(
        materialized='incremental',
        unique_key='listing_id',
        incremental_strategy = 'merge'
        )
}}



WITH fct_listings AS (

    SELECT l.id AS listing_id, l.name AS listing_title, l.room_type, l.minimum_nights, l.host_id,
                {{ normalize_price('l.price') }} AS listing_price, {{ date_formatting('l.created_at') }} AS created_at, l.updated_at

    FROM {{ ref("stg_airbnb_listings") }} l
)



SELECT * 
FROM fct_listings
{% if is_incremental() %}
WHERE created_at > (
    SELECT MAX(created_at) FROM {{ this }}
)
{% endif %}