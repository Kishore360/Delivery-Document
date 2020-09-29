select 'ldb.f_incident_keyword a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
union
select 'ldb.d_configuration_item a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
union
select 'ldb.d_calendar_date a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_calendar_date a13
on (a11.date_key = a13.row_key)
union
select 'ldb.d_configuration_item_mdm a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_configuration_item_mdm a14
on (a12.mdm_key = a14.row_key)
union
select 'ldb.d_incident a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_incident a15
on (a11.table_row_key = a15.row_key)
union
select 'ldb.d_calendar_month a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_calendar_date a13
on (a11.date_key = a13.row_key)
join ldb.d_calendar_month a16
on (a13.month_start_date_key = a16.row_key)
union
select 'ldb.d_lov_incident_environment_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_incident a15
on (a11.table_row_key = a15.row_key)
join ldb.d_lov_incident_environment_c a17
on (a15.environment_src_c_key = a17.row_key)
union
select 'ldb.d_incident_priority a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_keyword a11
join ldb.d_incident a15
on (a11.table_row_key = a15.row_key)
join ldb.d_incident_priority a18
on (a15.priority_src_key = a18.row_key)