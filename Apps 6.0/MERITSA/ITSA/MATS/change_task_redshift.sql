select 'ldb.f_change_task a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
union
select 'ldb.d_application a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_application a12 
on (a11.application_key = a12.row_key) 
union
select 'ldb.d_internal_contact a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_internal_contact a13 
on (a11.employee_key = a13.row_key) 
union
select 'ldb.d_calendar_time a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_calendar_time a14 
on (a11.opened_time_key = a14.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_internal_contact_assigned_to a15 
on (a11.assigned_to_key = a15.row_key) 
union
select 'ldb.d_internal_organization_group a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_internal_organization_group a16 
on (a11.assignment_group_key = a16.row_key) 
union
select 'ldb.d_calendar_date a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_calendar_date a17 
on (a11.date_key = a17.row_key) 
union
select 'ldb.d_calendar_month a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_calendar_date a17 
on (a11.date_key = a17.row_key) 
join ldb.d_calendar_month a18 
on (a17.month_start_date_key = a18.row_key) 
union
select 'ldb.d_change_request a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_change_request a19 
on (a11.change_request_key = a19.row_key) 
union
select 'ldb.d_change_task a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_change_task a110 
on (a11.change_task_key = a110.row_key) 
union
select 'ldb.d_internal_contact_change_task_closed_by_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_internal_contact_change_task_closed_by_c a111 
on (a11.closed_by_key = a111.row_key) 
union
select 'ldb.d_internal_contact_change_task_opened_by_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_internal_contact_change_task_opened_by_c a112 
on (a11.opened_by_key = a112.row_key) 
union
select 'ldb.d_calendar_week a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_calendar_date a17 
on (a11.date_key = a17.row_key) 
join ldb.d_calendar_week a113 
on (a17.week_start_date_key = a113.row_key) 
union
select 'ldb.d_calendar_quarter a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_calendar_date a17 
on (a11.date_key = a17.row_key) join ldb.d_calendar_month a18 
on (a17.month_start_date_key = a18.row_key) 
join ldb.d_calendar_quarter a114 
on (a18.quarter_start_date_key = a114.row_key) 
union
select 'ldb.d_calendar_year a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_calendar_date a17 
on (a11.date_key = a17.row_key) join ldb.d_calendar_month a18 
on (a17.month_start_date_key = a18.row_key) join ldb.d_calendar_quarter a114 
on (a18.quarter_start_date_key = a114.row_key) 
join ldb.d_calendar_year a115 
on (a114.year_start_date_key = a115.row_key) 
union
select 'ldb.d_application_mdm a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_application a12 
on (a11.application_key = a12.row_key) 
join ldb.d_application_mdm a116 
on (a12.mdm_key = a116.row_key) 
union
select 'ldb.d_business_service a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_business_service a117 
on (a11.business_service_key = a117.row_key) 
union
select 'ldb.d_change_request_assignment_group a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_change_request_assignment_group a118 
on (a11.parent_assignment_group_key = a118.row_key) 
union
select 'ldb.d_change_request_priority a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_change_request_priority a119 
on (a11.parent_priority_src_key = a119.row_key) 
union
select 'ldb.d_change_request_state a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_change_request_state a120 
on (a11.parent_state_src_key = a120.row_key) 
union
select 'ldb.d_change_request_type a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_change_request_type a121 
on (a11.parent_type_src_key = a121.row_key) 
union
select 'ldb.d_configuration_item a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_configuration_item a122 
on (a11.configuration_item_key = a122.row_key) 
union
select 'ldb.d_internal_contact_mdm a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_internal_contact a13 
on (a11.employee_key = a13.row_key) 
join ldb.d_internal_contact_mdm a123 
on (a13.employee_mdm_key = a123.row_key) 
union
select 'ldb.d_calendar_time_hour a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_calendar_time a14 
on (a11.opened_time_key = a14.row_key) 
join ldb.d_calendar_time_hour a124 
on (a14.hour_key = a124.row_key) 
union
select 'ldb.d_location a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_location a125 
on (a11.location_key = a125.row_key) 
union
select 'ldb.o_data_freshness a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.o_data_freshness a126 
on (a11.source_id = a126.source_id) 
union
select 'ldb.d_change_request_close_code a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_change_request a19 
on (a11.change_request_key = a19.row_key) 
join ldb.d_change_request_close_code a127 
on (a19.close_code_src_key = a127.row_key) 
union
select 'ldb.d_change_request_phase a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_change_request a19 
on (a11.change_request_key = a19.row_key) 
join ldb.d_change_request_phase a128 
on (a19.phase_src_key = a128.row_key) 
union
select 'ldb.d_change_request_phase_state a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_change_request a19 
on (a11.change_request_key = a19.row_key) 
join ldb.d_change_request_phase_state a129 
on (a19.phase_state_src_key = a129.row_key) 
union
select 'ldb.d_change_task_approval a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_change_task a110 
on (a11.change_task_key = a110.row_key) 
join ldb.d_change_task_approval a130 
on (a110.approval_src_key = a130.row_key) 
union
select 'ldb.d_internal_contact_change_task_closed_by_manager_c a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_internal_contact_change_task_closed_by_c a111 
on (a11.closed_by_key = a111.row_key) 
join ldb.d_internal_contact_change_task_closed_by_manager_c a131 
on (a111.manager_c_key = a131.row_key) 
union
select 'ldb.d_change_task_reported_type a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_change_task a110 
on (a11.change_task_key = a110.row_key) 
join ldb.d_change_task_reported_type a132 
on (a110.reported_type_src_key = a132.row_key) 
union
select 'ldb.d_change_task_impact a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_change_task a110 
on (a11.change_task_key = a110.row_key) 
join ldb.d_change_task_impact a133 
on (a110.impact_src_key = a133.row_key) 
union
select 'ldb.d_internal_contact_change_task_opened_by_manager_c a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_internal_contact_change_task_opened_by_c a112 
on (a11.opened_by_key = a112.row_key) 
join ldb.d_internal_contact_change_task_opened_by_manager_c a134 
on (a112.manager_key = a134.row_key) 
union
select 'ldb.d_change_task_priority a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_change_task a110 
on (a11.change_task_key = a110.row_key) 
join ldb.d_change_task_priority a135 
on (a110.priority_src_key = a135.row_key) 
union
select 'ldb.d_change_task_state a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_change_task a110 
on (a11.change_task_key = a110.row_key) 
join ldb.d_change_task_state a136 
on (a110.state_src_key = a136.row_key) 
union
select 'ldb.d_change_task_task_type a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_change_task a110 
on (a11.change_task_key = a110.row_key) 
join ldb.d_change_task_task_type a137 
on (a110.task_type_src_key = a137.row_key) 
union
select 'ldb.d_change_task_urgency a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_task a11 
join ldb.d_change_task a110 
on (a11.change_task_key = a110.row_key) 
join ldb.d_change_task_urgency a138 
on (a110.urgency_src_key = a138.row_key) 