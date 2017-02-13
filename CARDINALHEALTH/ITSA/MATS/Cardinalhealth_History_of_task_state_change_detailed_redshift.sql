select 'ldb.f_task_status_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_status_c a11 
union
select 'ldb.d_internal_organization_group a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_status_c a11 
join ldb.d_internal_organization_group a12 
on (a11.assignment_group_key = a12.row_key) 
union
select 'ldb.d_internal_contact_emp_seniors_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_status_c a11 
join ldb.d_internal_organization_group a12 
on (a11.assignment_group_key = a12.row_key) 
join ldb.d_internal_contact_emp_seniors_c a13 
on (a12.manager_c_key = a13.row_key) 
union
select 'ldb.d_assignment_group_level0_manager_c_relation a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_status_c a11 
join ldb.d_assignment_group_level0_manager_c_relation a14 
on (a11.assignment_group_key = a14.level0_assigment_group_key) 
union
select 'ldb.d_calendar_date a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_status_c a11 
join ldb.d_calendar_date a15 
on (a11.state_on_key = a15.row_key) 
union
select 'ldb.d_task a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_status_c a11 
join ldb.d_task a16 
on (a11.task_key = a16.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_status_c a11 
join ldb.d_internal_contact_assigned_to a17 
on (a11.assigned_to_key = a17.row_key) 
union
select 'ldb.d_task_state_c a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_status_c a11 
join ldb.d_task_state_c a18 
on (a11.state_src_key = a18.row_key) 
union
select 'ldb.d_task_state_to_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_status_c a11 
join ldb.d_task_state_to_c a19 
on (a11.to_state_src_key = a19.row_key) 
union
select 'ldb.d_task_state_from_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_status_c a11 
join ldb.d_task_state_from_c a110 
on (a11.from_state_src_key = a110.row_key) 
union
select 'ldb.d_assignment_group_level0_manager_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_status_c a11 
join ldb.d_assignment_group_level0_manager_c_relation a14 
on (a11.assignment_group_key = a14.level0_assigment_group_key) 
join ldb.d_assignment_group_level0_manager_c a111 
on (a14.level0_manager_c_key = a111.level0_manager_c_key) 
union
select 'ldb.d_calendar_month a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_status_c a11 
join ldb.d_calendar_date a15 
on (a11.state_on_key = a15.row_key) 
join ldb.d_calendar_month a112 
on (a15.month_start_date_key = a112.row_key) 
union
select 'ldb.d_task_priority_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_status_c a11 
join ldb.d_task_priority_c a113 
on (a11.priority_src_key = a113.row_key) 