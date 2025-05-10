WITH listings_reviews_summary AS (

SELECT l.listing_title, l.room_type, l.minimum_nights, l.host_id,
                listing_price, r.sentiment AS sentiment_score, l.created_at, l.updated_at
                             FROM {{ ref ("fct_listings") }} l
                            INNER JOIN {{ ref ("dim_reviews") }} r ON l.listing_id = r.listing_id
)


SELECT * FROM listings_reviews_summary