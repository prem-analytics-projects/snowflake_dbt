with bike as (
    select 
    distinct start_statio_id,
    start_station_name,
    start_lat,
    start_lng

    from {{ source('DEMO', 'bike') }}
    
)
select * from bike