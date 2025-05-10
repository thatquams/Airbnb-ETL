WITH stg_hosts AS (
    SELECT * FROM {{ source ("airbnb_listings", "RAW_HOSTS")}}
)


SELECT * FROM stg_hosts