
    SELECT strftime('%w', pickup_datetime) AS day, 
           COUNT(*) AS trip_count
    FROM uber_trips
    GROUP BY day
    ORDER BY trip_count DESC;
