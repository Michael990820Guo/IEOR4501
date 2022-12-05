
    WITH all_trips AS (SELECT pickup_datetime, distance 
                       FROM taxi_trips 
                       WHERE pickup_datetime BETWEEN '2013-07-01' AND '2013-07-31'
                       UNION ALL
                       SELECT pickup_datetime, distance 
                       FROM uber_trips
                       WHERE pickup_datetime BETWEEN '2013-07-01' AND '2013-07-31')
    SELECT distance AS '95% percentile distance'
    FROM all_trips
    ORDER BY distance ASC
    LIMIT 1
    OFFSET (SELECT COUNT(*) 
            FROM all_trips) * 95 / 100 - 1 ;
