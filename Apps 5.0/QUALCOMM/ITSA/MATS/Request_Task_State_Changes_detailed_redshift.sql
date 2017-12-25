select 'ldb.f_request_task_state_activity a11 ' as Table_name, count(a11.request_task_key) Row_Count
from ldb.f_request_task_state_activity a11 
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.request_task_key) Row_Count
from ldb.f_request_task_state_activity a11 
join ldb.d_calendar_date a12 
on (a11.state_on_key = a12.row_key) 
union
select 'ldb.d_calendar_week a13 ' as Table_name, count(a11.request_task_key) Row_Count
from ldb.f_request_task_state_activity a11 
join ldb.d_calendar_date a12 
on (a11.state_on_key = a12.row_key) 
join ldb.d_calendar_week a13 
on (a12.week_start_date_key = a13.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a14 ' as Table_name, count(a11.request_task_key) Row_Count
from ldb.f_request_task_state_activity a11 
join ldb.d_internal_contact_assigned_to a14 
on (a11.assigned_to_key = a14.row_key) 
union
select 'ldb.d_internal_organization_group a15 ' as Table_name, count(a11.request_task_key) Row_Count
from ldb.f_request_task_state_activity a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) 
union
select 'ldb.d_calendar_month a16 ' as Table_name, count(a11.request_task_key) Row_Count
from ldb.f_request_task_state_activity a11 
join ldb.d_calendar_date a12 
on (a11.state_on_key = a12.row_key) 
join ldb.d_calendar_month a16 
on (a12.month_start_date_key = a16.row_key) 
union
select 'ldb.d_calendar_quarter a17 ' as Table_name, count(a11.request_task_key) Row_Count
from ldb.f_request_task_state_activity a11 
join ldb.d_calendar_date a12 
on (a11.state_on_key = a12.row_key) 
join ldb.d_calendar_quarter a17 
on (a12.quarter_start_date_key = a17.row_key) 
union
select 'ldb.d_calendar_year a18 ' as Table_name, count(a11.request_task_key) Row_Count
from ldb.f_request_task_state_activity a11 
join ldb.d_calendar_date a12 
on (a11.state_on_key = a12.row_key) 
join ldb.d_calendar_year a18 
on (a12.year_start_date_key = a18.row_key) 
union
select 'ldb.d_request_item a19 ' as Table_name, count(a11.request_task_key) Row_Count
from ldb.f_request_task_state_activity a11 
join ldb.d_request_item a19 
on (a11.request_item_key = a19.row_key) 
union
select 'ldb.d_request a110 ' as Table_name, count(a11.request_task_key) Row_Count
from ldb.f_request_task_state_activity a11 
join ldb.d_request a110 
on (a11.request_key = a110.row_key) 
union
select 'ldb.d_request_task a111 ' as Table_name, count(a11.request_task_key) Row_Count
from ldb.f_request_task_state_activity a11 
join ldb.d_request_task a111 
on (a11.request_task_key = a111.row_key) 
union
select 'ldb.d_internal_contact_request_task_closed_by_c a112 ' as Table_name, count(a11.request_task_key) Row_Count
from ldb.f_request_task_state_activity a11 
join ldb.d_request_task a111 
on (a11.request_task_key = a111.row_key) 
join ldb.d_internal_contact_request_task_closed_by_c a112 
on (a111.closed_by_key = a112.row_key) 
union
select 'ldb.d_internal_contact_request_task_opened_by_c a113 ' as Table_name, count(a11.request_task_key) Row_Count
from ldb.f_request_task_state_activity a11 
join ldb.d_request_task a111 
on (a11.request_task_key = a111.row_key) 
join ldb.d_internal_contact_request_task_opened_by_c a113 
on (a111.opened_by_key = a113.row_key) 
union
select 'ldb.d_internal_contact_request_task_opened_by_manager_c a114 ' as Table_name, count(a11.request_task_key) Row_Count
from ldb.f_request_task_state_activity a11 
join ldb.d_request_task a111 
on (a11.request_task_key = a111.row_key) join ldb.d_internal_contact_request_task_opened_by_c a113 
on (a111.opened_by_key = a113.row_key) 
join ldb.d_internal_contact_request_task_opened_by_manager_c a114 
on (a113.manager_key = a114.row_key) 
union
select 'ldb.d_configuration_item a115 ' as Table_name, count(a11.request_task_key) Row_Count
from ldb.f_request_task_state_activity a11 
join ldb.d_configuration_item a115 
on (a11.configuration_item_key = a115.row_key) 
union
select 'ldb.d_request_item_stage a116 ' as Table_name, count(a11.request_task_key) Row_Count
from ldb.f_request_task_state_activity a11 
join ldb.d_request_item_stage a116 
on (a11.current_request_item_stage_key = a116.row_key) 
union
select 'ldb.d_request_item_state a117 ' as Table_name, count(a11.request_task_key) Row_Count
from ldb.f_request_task_state_activity a11 
join ldb.d_request_item_state a117 
on (a11.current_request_item_state_key = a117.row_key) 
union
select 'ldb.d_sc_task_approval a118 ' as Table_name, count(a11.request_task_key) Row_Count
from ldb.f_request_task_state_activity a11 
join ldb.d_sc_task_approval a118 
on (a11.approval_state_src_key = a118.row_key) 
union
select 'ldb.d_sc_task_from_state a119 ' as Table_name, count(a11.request_task_key) Row_Count
from ldb.f_request_task_state_activity a11 
join ldb.d_sc_task_from_state a119 
on (a11.from_state_key = a119.row_key) 
union
select 'ldb.d_request_task_previous_state_c a120 ' as Table_name, count(a11.request_task_key) Row_Count
from ldb.f_request_task_state_activity a11 
join ldb.d_request_task_previous_state_c a120 
on (a11.previous_state_key = a120.row_key) 
union
select 'ldb.d_sc_task_priority a121 ' as Table_name, count(a11.request_task_key) Row_Count
from ldb.f_request_task_state_activity a11 
join ldb.d_sc_task_priority a121 
on (a11.priority_src_key = a121.row_key) 
union
select 'ldb.d_sc_task_state a122 ' as Table_name, count(a11.request_task_key) Row_Count
from ldb.f_request_task_state_activity a11 
join ldb.d_sc_task_state a122 
on (a11.current_request_task_state_key = a122.row_key) 
union
select 'ldb.d_sc_task_to_state a123 ' as Table_name, count(a11.request_task_key) Row_Count
from ldb.f_request_task_state_activity a11 
join ldb.d_sc_task_to_state a123 
on (a11.to_state_key = a123.row_key) 
union
select 'ldb.d_sc_task_upon_approval a124 ' as Table_name, count(a11.request_task_key) Row_Count
from ldb.f_request_task_state_activity a11 
join ldb.d_sc_task_upon_approval a124 
on (a11.upon_approval_src_key = a124.row_key) 
union
select 'ldb.o_data_freshness a125 ' as Table_name, count(a11.request_task_key) Row_Count
from ldb.f_request_task_state_activity a11 
join ldb.d_calendar_date a12 
on (a11.state_on_key = a12.row_key) 
join ldb.o_data_freshness a125 
on (a12.source_id = a125.source_id) 
