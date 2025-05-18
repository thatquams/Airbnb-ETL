WITH stg_hosts AS (
    SELECT * FROM {{ source ("airbnb_listings", "RAW_HOSTS")}}
)


SELECT * FROM stg_hosts WHERE name IS NOT NULL ORDER BY name DESC