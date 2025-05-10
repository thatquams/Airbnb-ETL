WITH host_performance AS (

    SELECT h.host_name, {{normalize_price('l.listing_price') }} AS listing_price,

                        h.superhost, l.updated_at AS listings_updated_at, r.sentiment AS listing_review_sentiment
                            FROM {{ ref ("dim_host") }} h 
                            LEFT JOIN {{ ref("fct_listings") }} l ON h.host_id = l.host_id
                            LEFT JOIN {{ ref("dim_reviews") }} r ON l.listing_id = r.listing_id
                        
)

SELECT * FROM host_performance

