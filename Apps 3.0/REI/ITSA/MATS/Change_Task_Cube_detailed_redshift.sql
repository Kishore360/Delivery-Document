select 'ldb.f_change_task_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task_c a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task_c a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
union
select 'ldb.d_change_request a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task_c a11 
join ldb.d_change_request a13 
on (a11.change_request_key = a13.row_key) 
union
select 'ldb.d_change_task_c a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task_c a11 
join ldb.d_change_task_c a14 
on (a11.change_task_key = a14.row_key) 
union
select 'ldb.d_internal_organization_group a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task_c a11 
join ldb.d_internal_organization_group a18 
on (a11.assignment_group_key = a18.row_key) 
union
select 'ldb.d_calendar_date a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task_c a11 
join ldb.d_calendar_date a16 
on (a11.opened_on_key = a16.row_key) 
union
select 'ldb.d_internal_contact a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task_c a11 
join ldb.d_internal_contact a17 
on (a11.assigned_to_key = a17.row_key) 
union
select 'ldb.d_change_task_priority_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task_c a11 
join ldb.d_change_task_priority_c a19 
on (a11.priority_src_key = a19.row_key) 
union
select 'ldb.d_change_task_state_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task_c a11 
join ldb.d_change_task_state_c a110 
on (a11.state_src_key = a110.row_key) 
union
select 'ldb.d_internal_contact_mdm a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task_c a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
join ldb.d_internal_contact_mdm a111 
on (a12.row_current_key = a111.row_current_key) 
union
select 'ldb.d_assignment_group_manager_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task_c a11 
join ldb.d_internal_organization_group a18 
on (a11.assignment_group_key = a18.row_key) 
join ldb.d_assignment_group_manager_c a112 
on (a18.manager_c_key = a112.manager_c_key) 
union
select 'ldb.d_calendar_month a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task_c a11 
join ldb.d_calendar_date a16 
on (a11.opened_on_key = a16.row_key) 
join ldb.d_calendar_month a113 
on (a16.month_start_date_key = a113.row_key) 
union
select 'ldb.d_calendar_week a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task_c a11 
join ldb.d_calendar_date a16 
on (a11.opened_on_key = a16.row_key) 
join ldb.d_calendar_week a114 
on (a16.week_start_date_key = a114.row_key) 
union
select 'ldb.d_calendar_year a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task_c a11 
join ldb.d_calendar_date a16 
on (a11.opened_on_key = a16.row_key) 
join ldb.d_calendar_year a115 
on (a16.year_start_date_key = a115.row_key) 
