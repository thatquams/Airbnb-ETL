SELECT superhost, COUNT(superhost) AS `No. Listing Reviews` FROM {{ ref("host_performance") }}
GROUP BY superhost;