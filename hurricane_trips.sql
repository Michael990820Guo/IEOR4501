
    WITH all_trips AS (SELECT strftime('%m/%d/%Y %H', pickup_datetime) as trip_date_hour
                       FROM taxi_trips
                       WHERE pickup_datetime BETWEEN '2012-10-22' AND '2012-11-04'
                       UNION ALL
                       SELECT strftime('%m/%d/%Y %H', pickup_datetime) as trip_date_hour 
                       FROM uber_trips
                       WHERE pickup_datetime BETWEEN '2012-10-22' AND '2012-11-04')
    SELECT strftime('%m/%d/%Y %H', DATE) AS weather_date_hour,
           COALESCE(COUNT(all_trips.trip_date_hour), 0) AS trip_count,
           HourlyPrecipitation,
           HourlyWindSpeed
    FROM hourly_weather
    LEFT JOIN all_trips
    ON weather_date_hour = trip_date_hour
    WHERE hourly_weather.DATE BETWEEN '2012-10-22' AND '2012-11-04'
    GROUP BY weather_date_hour
