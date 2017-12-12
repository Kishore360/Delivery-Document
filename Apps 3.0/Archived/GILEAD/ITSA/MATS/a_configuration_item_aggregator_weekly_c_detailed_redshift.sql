select 'ldb.a_configuration_item_aggregator_weekly_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.a_configuration_item_aggregator_weekly_c a11 
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.a_configuration_item_aggregator_weekly_c a11 
join ldb.d_calendar_date a12  on (a11.aggregate_c_key = a12.row_key) 
union
select 'ldb.d_calendar_month a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.a_configuration_item_aggregator_weekly_c a11 
join ldb.d_calendar_date a12  on (a11.aggregate_c_key = a12.row_key) 
join ldb.d_calendar_month a13 on (a12.month_start_date_key = a13.row_key) 
