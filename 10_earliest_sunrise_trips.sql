
    WITH all_trips AS (SELECT pickup_datetime 
                       FROM taxi_trips
                       UNION ALL
                       SELECT pickup_datetime 
                       FROM uber_trips)
    SELECT date(pickup_datetime) AS date, COUNT(*) AS trip_count
    FROM all_trips
    GROUP BY date
    HAVING date IN (SELECT date(DATE) 
                    FROM sun_data 
                    WHERE DATE BETWEEN '2014-01-01' AND '2014-12-31' 
                    ORDER BY Sunrise ASC
                    LIMIT 10);
