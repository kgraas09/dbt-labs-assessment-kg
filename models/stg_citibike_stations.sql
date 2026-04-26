with source as (

    select * from {{ source('citibike', 'citibike_stations') }}

),

normalized as (

    select
        station_id,
        name,
        latitude,
        longitude,
        capacity,
        num_bikes_available,
        num_docks_available,
        is_installed,
        is_renting,
        is_returning
    from source

)

select * from normalized