SELECT CASE WHEN max_count<>min_count THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN  max_count<>min_count THEN 'OOTB has Keys Dropped' ELSE 'SUCCESS'  END as Message FROM (
 select max(Row_Count) max_count,Min(Row_Count) min_count from (
 select 'ldb.f_change_task_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task_c a11 
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task_c a11 
join ldb.d_calendar_date a12 
on (a11.opened_on_key = a12.row_key) 
union
select 'ldb.d_change_task_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task_c a11 
join ldb.d_change_task_c a13 
on (a11.change_task_key = a13.row_key) 
union
select 'ldb.d_internal_contact_change_task_c a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task_c a11 
join ldb.d_internal_contact_change_task_c a14 
on (a11.assigned_to_key = a14.row_key) 
union
select 'ldb.d_configuration_item_change_task_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task_c a11 
join ldb.d_configuration_item_change_task_c a15 
on (a11.configuration_item_key = a15.row_key) 
union
select 'ldb.d_task_priority_change_task_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task_c a11 
join ldb.d_task_priority_change_task_c a16 
on (a11.priority_src_key = a16.row_key) 
union
select 'ldb.d_task_contacttype_change_task_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task_c a11 
join ldb.d_task_contacttype_change_task_c a17 
on (a11.reported_type_src_key = a17.row_key) 
union
select 'ldb.d_change_task_state a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task_c a11 
join ldb.d_change_task_state a18 
on (a11.state_src_key = a18.row_key) 
union
select 'ldb.d_internal_organization_group_change_task_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task_c a11 
join ldb.d_internal_organization_group_change_task_c a19 
on (a11.assignment_group_key = a19.row_key) 
union
select 'ldb.d_task_impact_change_task_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task_c a11 
join ldb.d_task_impact_change_task_c a110 
on (a11.impact_src_key = a110.row_key) 
union
select 'ldb.d_task_urgency_change_task_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task_c a11 
join ldb.d_task_urgency_change_task_c a111 
on (a11.urgency_src_key = a111.row_key) 
union
select 'ldb.d_calendar_month a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task_c a11 
join ldb.d_calendar_date a12 
on (a11.opened_on_key = a12.row_key) 
join ldb.d_calendar_month a112 
on (a12.month_start_date_key = a112.row_key)   )a
  )b