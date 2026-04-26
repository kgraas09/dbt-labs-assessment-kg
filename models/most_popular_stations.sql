{{ config(materialized='table') }}

with trips as (

    select * from {{ ref('stg_citibike_trips') }}

),

station_counts as (

    select
        start_station_name                        as station_name,
        count(*)                                  as total_trips_started,
        round(avg(tripduration) / 60, 2)          as avg_trip_duration_minutes
    from trips
    where start_station_name is not null
    group by start_station_name

)

select * from station_counts
order by total_trips_started desc