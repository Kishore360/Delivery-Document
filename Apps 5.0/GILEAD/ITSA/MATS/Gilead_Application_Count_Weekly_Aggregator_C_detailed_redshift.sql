select a.ci_type,avg(a.application_count) as Application_Count_Weekly_Aggregator_C
from ldb.a_configuration_item_aggregator_weekly_c a 
join ldb.d_calendar_date b  on (a.aggregate_c_key = b.row_key)
group by 1;
