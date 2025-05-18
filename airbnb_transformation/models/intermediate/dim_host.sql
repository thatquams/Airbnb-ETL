WITH dim_host AS (

SELECT {{ dbt_utils.generate_surrogate_key(['id']) }} AS host_key, 
         name AS host_name, 
            CASE 
               WHEN is_superhost = 'f' THEN 'N'
               WHEN is_superhost = 't' THEN 'Y' 
            END AS superhost, created_at, updated_at
                              FROM {{ ref ("stg_airbnb_hosts")}}

)

SELECT * FROM dim_host