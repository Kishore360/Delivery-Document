select 'ldb.f_request_task_state_activity a11 ' as Table_name, count(a11.request_task_key) Row_Count
from ldb.f_request_task_state_activity a11 
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.request_task_key) Row_Count
from ldb.f_request_task_state_activity a11 
join ldb.d_calendar_date a12 
on (a11.state_on_key = a12.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a13 ' as Table_name, count(a11.request_task_key) Row_Count
from ldb.f_request_task_state_activity a11 
join ldb.d_internal_contact_assigned_to a13 
on (a11.assigned_to_key = a13.row_key) 
union
select 'ldb.d_internal_organization_group a14 ' as Table_name, count(a11.request_task_key) Row_Count
from ldb.f_request_task_state_activity a11 
join ldb.d_internal_organization_group a14 
on (a11.assignment_group_key = a14.row_key) 
union
select 'ldb.d_request_item a15 ' as Table_name, count(a11.request_task_key) Row_Count
from ldb.f_request_task_state_activity a11 
join ldb.d_request_item a15 
on (a11.request_item_key = a15.row_key) 
union
select 'ldb.d_request a16 ' as Table_name, count(a11.request_task_key) Row_Count
from ldb.f_request_task_state_activity a11 
join ldb.d_request a16 
on (a11.request_key = a16.row_key) 
union
select 'ldb.d_request_task a17 ' as Table_name, count(a11.request_task_key) Row_Count
from ldb.f_request_task_state_activity a11 
join ldb.d_request_task a17 
on (a11.request_task_key = a17.row_key) 
union
select 'ldb.d_calendar_month a18 ' as Table_name, count(a11.request_task_key) Row_Count
from ldb.f_request_task_state_activity a11 
join ldb.d_calendar_date a12 
on (a11.state_on_key = a12.row_key) 
join ldb.d_calendar_month a18 
on (a12.month_start_date_key = a18.row_key) 
union
select 'ldb.d_configuration_item a19 ' as Table_name, count(a11.request_task_key) Row_Count
from ldb.f_request_task_state_activity a11 
join ldb.d_configuration_item a19 
on (a11.configuration_item_key = a19.row_key) 
union
select 'ldb.d_request_item_stage a110 ' as Table_name, count(a11.request_task_key) Row_Count
from ldb.f_request_task_state_activity a11 
join ldb.d_request_item_stage a110 
on (a11.current_request_item_stage_key = a110.row_key) 
union
select 'ldb.d_request_item_state a111 ' as Table_name, count(a11.request_task_key) Row_Count
from ldb.f_request_task_state_activity a11 
join ldb.d_request_item_state a111 
on (a11.current_request_item_state_key = a111.row_key) 
union
select 'ldb.d_sc_task_approval a112 ' as Table_name, count(a11.request_task_key) Row_Count
from ldb.f_request_task_state_activity a11 
join ldb.d_sc_task_approval a112 
on (a11.approval_state_src_key = a112.row_key) 
union
select 'ldb.d_sc_task_from_state a113 ' as Table_name, count(a11.request_task_key) Row_Count
from ldb.f_request_task_state_activity a11 
join ldb.d_sc_task_from_state a113 
on (a11.from_state_key = a113.row_key) 
union
select 'ldb.d_sc_task_priority a114 ' as Table_name, count(a11.request_task_key) Row_Count
from ldb.f_request_task_state_activity a11 
join ldb.d_sc_task_priority a114 
on (a11.priority_src_key = a114.row_key) 
union
select 'ldb.d_sc_task_state a115 ' as Table_name, count(a11.request_task_key) Row_Count
from ldb.f_request_task_state_activity a11 
join ldb.d_sc_task_state a115 
on (a11.current_request_task_state_key = a115.row_key) 
union
select 'ldb.d_sc_task_to_state a116 ' as Table_name, count(a11.request_task_key) Row_Count
from ldb.f_request_task_state_activity a11 
join ldb.d_sc_task_to_state a116 
on (a11.to_state_key = a116.row_key) 
union
select 'ldb.d_sc_task_upon_approval a117 ' as Table_name, count(a11.request_task_key) Row_Count
from ldb.f_request_task_state_activity a11 
join ldb.d_sc_task_upon_approval a117 
on (a11.upon_approval_src_key = a117.row_key) 
