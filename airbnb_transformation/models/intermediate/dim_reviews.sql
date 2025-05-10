WITH listings_review AS (

    SELECT ROW_NUMBER() OVER (ORDER BY date ASC) AS review_id, listing_id, reviewer_name, CASE 
                                            WHEN sentiment = 'positive' THEN 2
                                            WHEN sentiment = 'negative' THEN 0
                                            ELSE 1
                                        END AS sentiment, date AS review_date FROM {{ ref("stg_airbnb_reviews")}}

)

SELECT * FROM listings_review
