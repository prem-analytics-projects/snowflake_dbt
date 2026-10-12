with cte as (
    select 
    to_timestamp(STARTED_AT) as started_at,
    date(to_timestamp(STARTED_AT)) as date_started_at,
    hour(to_timestamp(STARTED_AT)) as hour_started_at,
    dayname(to_timestamp(STARTED_AT)) as day_of_week,
    case when dayname(to_timestamp(STARTED_AT)) in ('Sat','Sun') then 'WEEKEND' ELSE 'BUSINESSDAY' end as day_type,
    case when month(to_timestamp(STARTED_AT)) in (12,1,2) then 'WINTER' 
        when month(to_timestamp(STARTED_AT)) in (3,4,5) then 'SPRING'
        when month(to_timestamp(STARTED_AT)) in (6,7,8) then 'SUMMER' ELSE 'AUTUMN' end as station_of_year
    from 
    {{source('DEMO', 'bike')}}
)

select * from CTE