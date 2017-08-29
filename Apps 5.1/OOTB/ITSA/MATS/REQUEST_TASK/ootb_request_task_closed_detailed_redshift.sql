select 'ldb.f_request_task_closed a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task_closed a11 
union
select 'ldb.d_internal_organization_department a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task_closed a11 
join ldb.d_internal_organization_department a12 
on (a11.opened_by_department_key = a12.row_key) 
union
select 'ldb.d_calendar_date a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task_closed a11 
join ldb.d_calendar_date a14 
on (a11.closed_on_key = a14.row_key) 
union
select 'ldb.d_request_task a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task_closed a11 
join ldb.d_request_task a15 
on (a11.request_task_key = a15.row_key) 
union
select 'ldb.d_internal_contact a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task_closed a11 
join ldb.d_internal_contact a17 
on (a11.assigned_to_key = a17.row_key) 
union
select 'ldb.d_internal_organization_group a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task_closed a11 
join ldb.d_internal_organization_group a18 
on (a11.assignment_group_key = a18.row_key) 
union
select 'ldb.d_request_item a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task_closed a11 
join ldb.d_request_item a19 
on (a11.request_item_key = a19.row_key) 
union
select 'ldb.d_task_priority a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task_closed a11 
join ldb.d_sc_task_priority a110 
on (a11.priority_src_key = a110.row_key) 
union
select 'ldb.d_task_state a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task_closed a11 
join ldb.d_sc_task_state a111 
on (a11.state_src_key = a111.row_key) 
union
select 'ldb.d_calendar_month a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task_closed a11 
join ldb.d_calendar_date a14 
on (a11.closed_on_key = a14.row_key) 
join ldb.d_calendar_month a112 
on (a14.month_start_date_key = a112.row_key) 
union
select 'ldb.d_calendar_week a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task_closed a11 
join ldb.d_calendar_date a14 
on (a11.closed_on_key = a14.row_key) 
join ldb.d_calendar_week a113 
on (a14.week_start_date_key = a113.row_key) 
union
select 'ldb.d_calendar_quarter a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task_closed a11 
join ldb.d_calendar_date a14 
on (a11.closed_on_key = a14.row_key) 
join ldb.d_calendar_quarter a114 
on (a14.quarter_start_date_key = a114.row_key) 
union
select 'ldb.d_calendar_year a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task_closed a11 
join ldb.d_calendar_date a14 
on (a11.closed_on_key = a14.row_key) 
join ldb.d_calendar_year a115 
on (a14.year_start_date_key = a115.row_key) 
