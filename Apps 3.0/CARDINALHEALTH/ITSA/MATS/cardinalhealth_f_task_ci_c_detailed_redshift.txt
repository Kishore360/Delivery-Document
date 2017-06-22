select 'ldb.f_task_ci_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_ci_c a11 
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_ci_c a11 
join ldb.d_calendar_date a12 
on (a11.created_on_c_key = a12.row_key) 
union
select 'ldb.d_task a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_ci_c a11 
join ldb.d_task a13 
on (a11.task_c_key = a13.row_key) 
union
select 'ldb.d_configuration_item_change_rel_cmdb_ci_configuration_item_c a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_ci_c a11 
join ldb.d_configuration_item_change_rel_cmdb_ci_configuration_item_c a14 
on (a11.configuration_item_c_key = a14.row_key) 
union
select 'ldb.d_change_request a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_ci_c a11 
join ldb.d_change_request a15 
on (a11.change_request_c_key = a15.row_key) 
union
select 'ldb.d_incident a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_ci_c a11 
join ldb.d_incident a16 
on (a11.incident_c_key = a16.row_key) 
union
select 'ldb.d_calendar_month a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_ci_c a11 
join ldb.d_calendar_date a12 
on (a11.created_on_c_key = a12.row_key) 
join ldb.d_calendar_month a17 
on (a12.month_start_date_key = a17.row_key) 