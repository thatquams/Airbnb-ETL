WITH dim_host AS (

SELECT id AS host_id, name AS host_name, CASE 
                                            WHEN is_superhost = 'f' THEN 'N' ELSE 'Y' 
                                         END AS superhost, created_at, updated_at
                                        FROM {{ ref ("stg_airbnb_hosts")}}

)

SELECT * FROM dim_host