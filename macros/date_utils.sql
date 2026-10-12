 {% macro date_function(x) %}

case when TO_TIMESTAMP({{x}}) < current_date then 'PAST' else 'FUTURE' End

{% endmacro %}


{% macro season_function(x) %}

case when month(to_timestamp({{x}})) in (12,1,2) then 'WINTER' 
        when month(to_timestamp({{x}})) in (3,4,5) then 'SPRING'
        when month(to_timestamp({{x}})) in (6,7,8) then 'SUMMER' ELSE 'AUTUMN' end 

{% endmacro %}