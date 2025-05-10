SELECT YEAR(created_at) AS `listing_year`, SUM(listing_price) AS listing_price
FROM {{ ref("fct_listings") }} GROUP BY YEAR(created_at) ORDER BY YEAR(created_at) ASC;