WITH host_performance AS (

    SELECT h.host_name, {{normalize_price('l.listing_price') }} AS listing_price,

                        h.superhost, r.sentiment AS listing_review_sentiment
                            FROM {{ ref ("dim_host") }} h 
                            LEFT JOIN {{ ref("fct_listings") }} l ON h.host_key = l.host_key
                            INNER JOIN {{ ref("dim_reviews") }} r ON l.listing_key = r.listing_key
                        
)

SELECT * FROM host_performance

