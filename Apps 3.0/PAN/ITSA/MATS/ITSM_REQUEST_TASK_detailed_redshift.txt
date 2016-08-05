select 'ldb.f_request_task a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_calendar_date a12 
on (a11.opened_on_key = a12.row_key) 
union
select 'ldb.d_request_item a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_request_item a13 
on (a11.request_item_key = a13.row_key) 
union
select 'ldb.d_request_task a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_request_task a14 
on (a11.request_task_key = a14.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_internal_contact_assigned_to a15 
on (a11.assigned_to_key = a15.row_key) 
union
select 'ldb.d_internal_organization_group a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_internal_organization_group a16 
on (a11.assignment_group_key = a16.row_key) 
union
select 'ldb.d_internal_organization_department a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_internal_organization_department a17 
on (a11.opened_by_department_key = a17.row_key) 
union
select 'ldb.d_sc_task_priority a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_sc_task_priority a18 
on (a11.priority_src_key = a18.row_key) 
union
select 'ldb.d_sc_task_state a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_sc_task_state a19 
on (a11.state_src_key = a19.row_key) 
union
select 'ldb.d_calendar_month a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_calendar_date a12 
on (a11.opened_on_key = a12.row_key) 
join ldb.d_calendar_month a110 
on (a12.month_start_date_key = a110.row_key) 
union
select 'ldb.d_calendar_week a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11 
join ldb.d_calendar_date a12 
on (a11.opened_on_key = a12.row_key) 
join ldb.d_calendar_week a111 
on (a12.week_start_date_key = a111.row_key) 