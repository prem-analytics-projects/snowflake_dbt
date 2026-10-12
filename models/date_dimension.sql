with cte as (
    select 
    to_timestamp(STARTED_AT) as started_at,
    date(to_timestamp(STARTED_AT)) as date_started_at,
    hour(to_timestamp(STARTED_AT)) as hour_started_at,
    dayname(to_timestamp(STARTED_AT)) as day_of_week,
    case when dayname(to_timestamp(STARTED_AT)) in ('Sat','Sun') then 'WEEKEND' ELSE 'BUSINESSDAY' end as day_type,
    {{season_function('STARTED_AT')}} as station_of_year --macro is called

    from  {{source('DEMO', 'bike')}}
)

select * from CTE