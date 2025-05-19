WITH dim_host AS (

SELECT {{ dbt_utils.generate_surrogate_key(['id']) }} AS host_key, 
         name AS host_name, 
            CASE 
               WHEN is_superhost = 'f' THEN 'N'
               WHEN is_superhost = 't' THEN 'Y' 
            END AS superhost, 
            {{date_formatting('created_at') }} AS created_at, 
            {{date_formatting('updated_at') }} AS updated_at
                              FROM {{ ref ("stg_airbnb_hosts")}}

)

SELECT * FROM dim_host