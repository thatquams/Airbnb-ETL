WITH stg_listings AS (
    SELECT * FROM {{ source ("airbnb_listings", "RAW_LISTINGS")}}
)


SELECT * FROM stg_listings