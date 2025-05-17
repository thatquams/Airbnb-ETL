WITH dates AS (
    {{ dbt_date.get_date_dimension('2010-01-01', '2025-12-31') }}
),

 date_dim AS (
    select {{ dbt_utils.generate_surrogate_key(['date_day']) }} AS date_key, 
    date_day AS date, day_of_week_name AS day_of_week, 
    month_name, quarter_of_year, year_number AS year FROM dates
)

select *
from
    date_dim