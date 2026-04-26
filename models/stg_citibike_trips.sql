with source as (

    select * from {{ source('citibike', 'citibike_trips') }}

),

normalized as (

    select
        tripduration,
        starttime,
        stoptime,
        start_station_name,
        end_station_name,
        bikeid,
        usertype,
        birth_year,
        gender,
        customer_plan
    from source

)

select * from normalized