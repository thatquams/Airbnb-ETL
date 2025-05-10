
SELECT * FROM {{ ref("fct_listings")}} WHERE room_type NOT IN (SELECT DISTINCT(room_type) FROM {{ref("stg_airbnb_listings") }} )