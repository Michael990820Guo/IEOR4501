
    SELECT strftime('%H', pickup_datetime) AS hour, 
           COUNT(*) AS trip_count
    FROM taxi_trips
    GROUP BY hour
    ORDER BY trip_count DESC;
