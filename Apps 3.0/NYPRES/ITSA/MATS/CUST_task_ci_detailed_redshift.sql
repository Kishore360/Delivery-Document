select 'ldb.f_task_ci_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_ci_c a11 
union
select 'ldb.d_change_request a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_ci_c a11 
join ldb.d_change_request a12 
on (a11.change_request_key = a12.row_key) 
union
select 'ldb.d_incident a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_ci_c a11 
join ldb.d_incident a13 
on (a11.incident_key = a13.row_key) 
union
select 'ldb.d_calendar_date a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_ci_c a11 
join ldb.d_calendar_date a14 
on (a11.task_opened_on_key = a14.row_key) 
union
select 'ldb.d_problem a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_ci_c a11 
join ldb.d_problem a15 
on (a11.problem_key = a15.row_key) 
union
select 'ldb.d_request_item a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_ci_c a11 
join ldb.d_request_item a16 
on (a11.request_item_key = a16.row_key) 
union
select 'ldb.d_request_task a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_ci_c a11 
join ldb.d_request_task a17 
on (a11.request_task_key = a17.row_key) 
union
select 'ldb.d_task_ci_c a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_ci_c a11 
join ldb.d_task_ci_c a18 
on (a11.task_key = a18.row_key) 
union
select 'ldb.d_configuration_item a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_ci_c a11 
join ldb.d_configuration_item a19 
on (a11.configuration_item_key = a19.row_key) 
union
select 'ldb.d_calendar_month a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_ci_c a11 
join ldb.d_calendar_date a14 
on (a11.task_opened_on_key = a14.row_key) 
join ldb.d_calendar_month a110 
on (a14.month_start_date_key = a110.row_key) 
