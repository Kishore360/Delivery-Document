select a.ci_type,
avg(a.missing_name_flag_count) as Missing_Name_Flag
from ldb.a_configuration_item_aggregator_weekly_c a 
join ldb.d_calendar_date b  on (a.aggregate_c_key = b.row_key)
group by 1;