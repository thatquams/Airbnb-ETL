WITH stg_reviews AS (
    SELECT * FROM {{ source ("airbnb_listings", "RAW_REVIEWS")}}
)


SELECT * FROM stg_reviews