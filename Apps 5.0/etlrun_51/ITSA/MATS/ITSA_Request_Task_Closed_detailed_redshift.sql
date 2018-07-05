select 'ldb.f_request_task_closed a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task_closed a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task_closed a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
union
select 'ldb.d_calendar_date a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task_closed a11 
join ldb.d_calendar_date a13 
on (a11.closed_on_key = a13.row_key) 
union
select 'ldb.d_calendar_date_closed a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task_closed a11 
join ldb.d_calendar_date_closed a14 
on (a11.closed_on_key = a14.row_key) 
union
select 'ldb.d_internal_contact_cost_center_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task_closed a11 
join ldb.d_internal_contact_cost_center_c a15 
on (a11.requested_for_c_key = a15.row_key) 
union
select 'ldb.d_request_task a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task_closed a11 
join ldb.d_request_task a16 
on (a11.request_task_key = a16.row_key) 
union
select 'ldb.d_request_item a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task_closed a11 
join ldb.d_request_item a17 
on (a11.request_item_key = a17.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task_closed a11 
join ldb.d_internal_contact_assigned_to a18 
on (a11.assigned_to_key = a18.row_key) 
union
select 'ldb.d_internal_organization_group a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task_closed a11 
join ldb.d_internal_organization_group a19 
on (a11.assignment_group_key = a19.row_key) 
union
select 'ldb.d_internal_organization_department a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task_closed a11 
join ldb.d_internal_organization_department a110 
on (a11.opened_by_department_key = a110.row_key) 
union
select 'ldb.d_internal_contact_mdm a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task_closed a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
join ldb.d_internal_contact_mdm a111 
on (a12.row_current_key = a111.row_current_key) 
union
select 'ldb.d_request_task_agebucket_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task_closed a11 
join ldb.d_request_task_agebucket_c a112 
on (a11.request_task_age_c_key = a112.row_key) 
union
select 'ldb.d_sc_task_priority a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task_closed a11 
join ldb.d_sc_task_priority a113 
on (a11.priority_src_key = a113.row_key) 
union
select 'ldb.d_sc_task_state a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task_closed a11 
join ldb.d_sc_task_state a114 
on (a11.state_src_key = a114.row_key) 
union
select 'ldb.d_sd_flag_c a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task_closed a11 
join ldb.d_sd_flag_c a115 
on (a11.touched_by_service_desk_level_1_c_flag_key = a115.row_key) 
union
select 'ldb.d_flag_c a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task_closed a11 
join ldb.d_flag_c a116 
on (a11.touched_by_virteva_c_flag_key = a116.row_key) 
union
select 'ldb.d_cost_center a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task_closed a11 
join ldb.d_internal_contact_cost_center_c a15 
on (a11.requested_for_c_key = a15.row_key) 
join ldb.d_cost_center a117 
on (a15.cost_center_c_key = a117.row_key) 
union
select 'ldb.d_internal_contact_request_task_assigned_to_manager_c a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task_closed a11 
join ldb.d_internal_contact_assigned_to a18 
on (a11.assigned_to_key = a18.row_key) 
join ldb.d_internal_contact_request_task_assigned_to_manager_c a118 
on (a18.employee_manager_c_key = a118.row_key) 
union
select 'ldb.d_calendar_month a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task_closed a11 
join ldb.d_calendar_date a13 
on (a11.closed_on_key = a13.row_key) 
join ldb.d_calendar_month a119 
on (a13.month_start_date_key = a119.row_key) 
union
select 'ldb.d_calendar_week a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task_closed a11 
join ldb.d_calendar_date a13 
on (a11.closed_on_key = a13.row_key) 
join ldb.d_calendar_week a120 
on (a13.week_start_date_key = a120.row_key) 
union
select 'ldb.d_calendar_month_closed a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task_closed a11 
join ldb.d_calendar_date_closed a14 
on (a11.closed_on_key = a14.row_key) 
join ldb.d_calendar_month_closed a121 
on (a14.month_start_date_key = a121.row_key) 
union
select 'ldb.d_calendar_quarter a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task_closed a11 
join ldb.d_calendar_date a13 
on (a11.closed_on_key = a13.row_key) 
join ldb.d_calendar_quarter a122 
on (a13.quarter_start_date_key = a122.row_key) 
union
select 'ldb.d_calendar_year a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task_closed a11 
join ldb.d_calendar_date a13 
on (a11.closed_on_key = a13.row_key) 
join ldb.d_calendar_year a123 
on (a13.year_start_date_key = a123.row_key) 
