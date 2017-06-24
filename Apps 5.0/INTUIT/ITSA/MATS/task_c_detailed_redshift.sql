select 'ldb.f_task_c a11 ' as Table_name, count(a11.task_key) Row_Count
from ldb.f_task_c a11 
union
select 'ldb.d_internal_contact_assigned_to a12 ' as Table_name, count(a11.task_key) Row_Count
from ldb.f_task_c a11 
join ldb.d_internal_contact_assigned_to a12 
on (a11.assigned_to_key = a12.row_key) 
union
select 'ldb.d_task_c a13 ' as Table_name, count(a11.task_key) Row_Count
from ldb.f_task_c a11 
join ldb.d_task_c a13 
on (a11.task_key = a13.row_key) 
union
select 'ldb.d_calendar_date a14 ' as Table_name, count(a11.task_key) Row_Count
from ldb.f_task_c a11 
join ldb.d_calendar_date a14 
on (a11.opened_on_key = a14.row_key) 
union
select 'ldb.d_internal_organization_group a15 ' as Table_name, count(a11.task_key) Row_Count
from ldb.f_task_c a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) 
union
select 'ldb.d_configuration_item a16 ' as Table_name, count(a11.task_key) Row_Count
from ldb.f_task_c a11 
join ldb.d_configuration_item a16 
on (a11.business_service_key = a16.row_key) 
union
select 'ldb.d_configuration_item a17 ' as Table_name, count(a11.task_key) Row_Count
from ldb.f_task_c a11 
join ldb.d_configuration_item a17 
on (a11.configuration_item_key = a17.row_key) 
union
select 'ldb.d_task_impact_c a18 ' as Table_name, count(a11.task_key) Row_Count
from ldb.f_task_c a11 
join ldb.d_task_impact_c a18 
on (a11.impact_src_key = a18.row_key) 
union
select 'ldb.d_internal_contact_opened_by_key_c a19 ' as Table_name, count(a11.task_key) Row_Count
from ldb.f_task_c a11 
join ldb.d_internal_contact_opened_by_key_c a19 
on (a11.opened_by_key = a19.row_key) 
union
select 'ldb.d_task_priority_c a110 ' as Table_name, count(a11.task_key) Row_Count
from ldb.f_task_c a11 
join ldb.d_task_priority_c a110 
on (a11.priority_src_key = a110.row_key) 
union
select 'ldb.d_task_state_c a111 ' as Table_name, count(a11.task_key) Row_Count
from ldb.f_task_c a11 
join ldb.d_task_state_c a111 
on (a11.state_src_key = a111.row_key) 
union
select 'ldb.d_task_urgency_c a112 ' as Table_name, count(a11.task_key) Row_Count
from ldb.f_task_c a11 
join ldb.d_task_urgency_c a112 
on (a11.urgency_src_key = a112.row_key) 
union
select 'ldb.d_internal_contact_manager_c a113 ' as Table_name, count(a11.task_key) Row_Count
from ldb.f_task_c a11 
join ldb.d_internal_contact_assigned_to a12 
on (a11.assigned_to_key = a12.row_key) 
join ldb.d_internal_contact_manager_c a113 
on (a12.manager_c_key = a113.row_key) 
union
select 'ldb.d_calendar_month a114 ' as Table_name, count(a11.task_key) Row_Count
from ldb.f_task_c a11 
join ldb.d_calendar_date a14 
on (a11.opened_on_key = a14.row_key) 
join ldb.d_calendar_month a114 
on (a14.month_start_date_key = a114.row_key) 
