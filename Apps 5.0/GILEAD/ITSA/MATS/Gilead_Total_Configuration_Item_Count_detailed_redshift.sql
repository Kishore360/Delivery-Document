select a.ci_type,avg(a.total_configuration_items_count) as Total_Configuration_Item_Count
from ldb.a_configuration_item_aggregator_weekly_c a 
join ldb.d_calendar_date b  on (a.aggregate_c_key = b.row_key)
group by 1;