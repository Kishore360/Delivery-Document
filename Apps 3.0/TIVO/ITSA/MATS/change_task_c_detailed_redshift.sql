select 'ldb.f_change_task_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task_c a11 
union
select 'ldb.d_change_task_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task_c a11 
join ldb.d_change_task_c a12 
on (a11.change_task_key = a12.row_key) 
union
select 'ldb.d_calendar_date a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task_c a11 
join ldb.d_calendar_date a13 
on (a11.opened_on_key = a13.row_key) 
union
select 'ldb.d_internal_contact a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task_c a11 
join ldb.d_internal_contact a14 
on (a11.assigned_to_key = a14.row_key) 
union
select 'ldb.d_internal_organization_group a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task_c a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) 
union
select 'ldb.d_change_request a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task_c a11 
join ldb.d_change_request a16 
on (a11.change_request_key = a16.row_key) 
union
select 'ldb.d_change_task_state_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task_c a11 
join ldb.d_change_task_state_c a17 
on (a11.state_src_key = a17.row_key) 
union
select 'ldb.d_calendar_month a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task_c a11 
join ldb.d_calendar_date a13 
on (a11.opened_on_key = a13.row_key) 
join ldb.d_calendar_month a18 
on (a13.month_start_date_key = a18.row_key)