select 'ldb.f_change_task_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task_c a11 
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task_c a11 
join ldb.d_calendar_date a12 
on (a11.opened_on_key = a12.row_key) 
union
select 'ldb.d_internal_contact a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task_c a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) 
union
select 'ldb.d_change_request a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task_c a11 
join ldb.d_change_request a14 
on (a11.change_request_key = a14.row_key) 
union
select 'ldb.d_change_task_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task_c a11 
join ldb.d_change_task_c a15 
on (a11.change_task_key = a15.row_key) 
union
select 'ldb.d_internal_organization_group a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task_c a11 
join ldb.d_internal_organization_group a16 
on (a11.assignment_group_key = a16.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task_c a11 
join ldb.d_internal_contact_assigned_to a17 
on (a11.assigned_to_key = a17.row_key) 
union
select 'ldb.d_change_task_priority_c a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task_c a11 
join ldb.d_change_task_priority_c a18 
on (a11.priority_src_key = a18.row_key) 
union
select 'ldb.d_change_task_state_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task_c a11 
join ldb.d_change_task_state_c a19 
on (a11.state_src_key = a19.row_key) 
union
select 'ldb.d_internal_contact_mdm a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task_c a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) 
join ldb.d_internal_contact_mdm a110 
on (a13.row_current_key = a110.row_current_key) 
union
select 'ldb.d_assignment_group_manager_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task_c a11 
join ldb.d_internal_organization_group a16 
on (a11.assignment_group_key = a16.row_key) 
join ldb.d_assignment_group_manager_c a111 
on (a16.manager_c_key = a111.manager_c_key) 
union
select 'ldb.d_calendar_month a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task_c a11 
join ldb.d_calendar_date a12 
on (a11.opened_on_key = a12.row_key) 
join ldb.d_calendar_month a112 
on (a12.month_start_date_key = a112.row_key) 
