WITH listings_review AS (

    SELECT ROW_NUMBER() OVER (ORDER BY date ASC) AS review_id, listing_id, reviewer_name, CASE 
                                            WHEN sentiment = 'positive' THEN 1
                                            WHEN sentiment = 'negative' THEN 0
                                            ELSE 2
                                        END AS sentiment, date AS review_date FROM {{ ref("stg_airbnb_reviews")}}

)

SELECT {{ dbt_utils.generate_surrogate_key(['review_id']) }} AS review_key,
        {{ dbt_utils.generate_surrogate_key(['listing_id']) }} AS listing_key,
        reviewer_name, sentiment, review_date  FROM listings_review
