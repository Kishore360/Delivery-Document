



select 'ldb.f_request_task_activity_c a11 ' as Table_name, count(1) Row_Count
from ldb.f_request_task_activity_c a11 
union
select 'ldb.d_internal_contact_assigned_to a12 ' as Table_name, count(1) Row_Count
from ldb.f_request_task_activity_c a11 
join ldb.d_internal_contact_assigned_to a12 
on (a11.assigned_to_key = a12.row_key) 
union
select 'ldb.d_internal_organization_group a13 ' as Table_name, count(1) Row_Count
from ldb.f_request_task_activity_c a11 
join ldb.d_internal_organization_group a13 
on (a11.assignment_group_key = a13.row_key) 
union
select 'ldb.d_calendar_date a14 ' as Table_name, count(1) Row_Count
from ldb.f_request_task_activity_c a11 
join ldb.d_calendar_date a14 
on (a11.changed_on_key = a14.row_key) 
union
select 'ldb.d_internal_contact_to a15 ' as Table_name, count(1) Row_Count
from ldb.f_request_task_activity_c a11 
join ldb.d_internal_contact_to a15 
on (a11.to_assigned_to_key = a15.row_key) 
union
select 'ldb.d_internal_organization_group_to a16 ' as Table_name, count(1) Row_Count
from ldb.f_request_task_activity_c a11 
join ldb.d_internal_organization_group_to a16 
on (a11.to_assignment_group_key = a16.row_key) 
union
select 'ldb.d_internal_contact_from a17 ' as Table_name, count(1) Row_Count
from ldb.f_request_task_activity_c a11 
join ldb.d_internal_contact_from a17 
on (a11.from_assigned_to_key = a17.row_key) 
union
select 'ldb.d_internal_organization_group_from a18 ' as Table_name, count(1) Row_Count
from ldb.f_request_task_activity_c a11 
join ldb.d_internal_organization_group_from a18 
on (a11.from_assignment_group_key = a18.row_key) 
union
select 'ldb.d_request_task a19 ' as Table_name, count(1) Row_Count
from ldb.f_request_task_activity_c a11 
join ldb.d_request_task a19 
on (a11.request_task_key = a19.row_key) 
union
select 'ldb.d_sc_task_priority a110 ' as Table_name, count(1) Row_Count
from ldb.f_request_task_activity_c a11 
join ldb.d_sc_task_priority a110 
on (a11.priority_src_key = a110.row_key) 
union
select 'ldb.d_sc_task_state a111 ' as Table_name, count(1) Row_Count
from ldb.f_request_task_activity_c a11 
join ldb.d_sc_task_state a111 
on (a11.current_request_task_state_key = a111.row_key) 
union
select 'ldb.d_calendar_month a112 ' as Table_name, count(1) Row_Count
from ldb.f_request_task_activity_c a11 
join ldb.d_calendar_date a14 
on (a11.changed_on_key = a14.row_key) 
join ldb.d_calendar_month a112 
on (a14.month_start_date_key = a112.row_key) 
union
select 'ldb.o_data_freshness a113 ' as Table_name, count(1) Row_Count
from ldb.f_request_task_activity_c a11 
join ldb.d_calendar_date a14 
on (a11.changed_on_key = a14.row_key) 
join ldb.o_data_freshness a113 
on (a14.source_id = a113.source_id) 
