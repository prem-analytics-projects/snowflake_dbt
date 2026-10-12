with trips as (
    select 
    RIDE_ID,
    RIDEABLE_TYPE,
    date(to_timestamp(STARTED_AT)) as trip_date,
    START_STATIO_ID as start_station_id,
    END_STATION_ID,
    MEMBER_CSUAL as member_casual,
    timestampdiff(second,to_timestamp(STARTED_AT), to_timestamp(ENDED_AT) ) as trip_dutation_seconds,
   
    from {{ source('DEMO', 'bike') }}
    
)
select * from trips