WITH listings_reviews_summary AS (

SELECT l.listing_name, l.room_type, l.minimum_nights, l.host_key,
                l.listing_price, r.sentiment AS sentiment_score
                             FROM {{ ref ("fct_listings") }} l
                            INNER JOIN {{ ref ("dim_reviews") }} r ON l.listing_key = r.listing_key
)


SELECT * FROM listings_reviews_summary