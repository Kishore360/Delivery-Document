select 'ldb.f_cmdb_activity_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cmdb_activity_c a111
union
select 'ldb.d_calendar_date a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cmdb_activity_c a111

join ldb.d_calendar_date a13
on (a111.created_on_key = a13.row_key)
union
select 'ldb.d_configuration_item a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cmdb_activity_c a111

join ldb.d_configuration_item a15
on (a111.configuration_item_key = a15.row_key)
union
select 'ldb.d_calendar_year a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cmdb_activity_c a111
join ldb.d_calendar_date a13
on (a111.created_on_key = a13.row_key)
join ldb.d_calendar_year a112
on (a13.year_start_date_key = a112.row_key)