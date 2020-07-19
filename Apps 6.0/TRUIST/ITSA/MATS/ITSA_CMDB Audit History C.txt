select 'ldb.f_cmdb_activity_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cmdb_activity_c a11
union
select 'ldb.d_calendar_date a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cmdb_activity_c a11
join ldb.d_calendar_date a13
on (a11.date_key = a13.row_key)
union
select 'ldb.d_calendar_month a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cmdb_activity_c a11
join ldb.d_calendar_date a13
on (a11.date_key = a13.row_key)
join ldb.d_calendar_month a14
on (a13.month_start_date_key = a14.row_key)
union
select 'ldb.d_calendar_quarter a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cmdb_activity_c a11
join ldb.d_calendar_date a13
on (a11.date_key = a13.row_key) join ldb.d_calendar_month a14
on (a13.month_start_date_key = a14.row_key)
join ldb.d_calendar_quarter a15
on (a14.quarter_start_date_key = a15.row_key)
union
select 'ldb.d_configuration_item a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cmdb_activity_c a11
join ldb.d_configuration_item a17
on (a11.configuration_item_key = a17.row_key)
union
select 'ldb.d_configuration_item_mdm a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cmdb_activity_c a11
join ldb.d_configuration_item a17
on (a11.configuration_item_key = a17.row_key)
join ldb.d_configuration_item_mdm a18
on (a17.mdm_key = a18.row_key)
union
select 'ldb.d_calendar_year a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_cmdb_activity_c a11
join ldb.d_calendar_date a13
on (a11.date_key = a13.row_key) join ldb.d_calendar_month a14
on (a13.month_start_date_key = a14.row_key) join ldb.d_calendar_quarter a15
on (a14.quarter_start_date_key = a15.row_key)
join ldb.d_calendar_year a115
on (a15.year_start_date_key = a115.row_key)