{{ config(materialized='table') }}

with trips as (

    select * from {{ ref('stg_citibike_trips') }}

),

daily as (

    select
        date(starttime)                     as trip_date,
        usertype,
        count(*)                            as total_trips,
        round(avg(tripduration) / 60, 2)    as avg_duration_minutes
    from trips
    where starttime is not null
    group by trip_date, usertype

)

select * from daily
order by trip_date desc