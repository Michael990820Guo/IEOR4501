
    WITH all_trips AS (SELECT pickup_datetime, distance 
                       FROM taxi_trips 
                       WHERE pickup_datetime BETWEEN '2009-01-01' AND '2009-12-31'
                       UNION ALL
                       SELECT pickup_datetime, distance 
                       FROM uber_trips
                       WHERE pickup_datetime BETWEEN '2009-01-01' AND '2009-12-31')
    SELECT date(pickup_datetime) AS date, AVG(distance) AS avg_distance, COUNT(*) AS trip_count
    FROM all_trips
    GROUP BY date
    ORDER BY trip_count DESC
    LIMIT 10;
