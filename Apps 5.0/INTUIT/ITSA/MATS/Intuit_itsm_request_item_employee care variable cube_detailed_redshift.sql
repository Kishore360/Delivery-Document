select 'ldb.f_request_item_closed a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
union
select 'ldb.d_request_item_variable_audio_issue_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_request_item_variable_audio_issue_c a12 
on (a11.request_item_key = a12.row_key) 
union
select 'ldb.d_request_item_variable_calendar_issue_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_request_item_variable_calendar_issue_c a13 
on (a11.request_item_key = a13.row_key) 
union
select 'ldb.d_request_item_variable_camera_issue_c a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_request_item_variable_camera_issue_c a14 
on (a11.request_item_key = a14.row_key) 
union
select 'ldb.d_request_item_variable_content_issue_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_request_item_variable_content_issue_c a15 
on (a11.request_item_key = a15.row_key) 
union
select 'ldb.d_request_item_variable_monitor_issue_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_request_item_variable_monitor_issue_c a16 
on (a11.request_item_key = a16.row_key) 
union
select 'ldb.d_request_item_variable_tablet_issue_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_request_item_variable_tablet_issue_c a17 
on (a11.request_item_key = a17.row_key) 
union
select 'ldb.d_request_item_variable_details_c a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_request_item_variable_details_c a18 
on (a11.request_item_key = a18.row_key) 
union
select 'ldb.d_request_item_variable_failure_mode_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_request_item_variable_failure_mode_c a19 
on (a11.request_item_key = a19.row_key) 
union
select 'ldb.d_internal_contact a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_internal_contact a110 
on (a11.closed_by_key = a110.row_key) 
union
select 'ldb.d_calendar_date a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_calendar_date a111 
on (a11.closed_on_key = a111.row_key) 
union
select 'ldb.d_request_item a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_request_item a112 
on (a11.request_item_key = a112.row_key) 
union
select 'ldb.d_request_item_variable_comments_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_request_item_variable_comments_c a113 
on (a11.request_item_key = a113.row_key) 
union
select 'ldb.d_request_item_variable_cmdb_ci_c a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_request_item_variable_cmdb_ci_c a114 
on (a11.request_item_key = a114.row_key) 
union
select 'ldb.d_request_item_variable_hardware_c a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_request_item_variable_hardware_c a115 
on (a11.request_item_key = a115.row_key) 
union
select 'ldb.d_master_item a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_master_item a116 
on (a11.catalog_item_key = a116.row_key) 
union
select 'ldb.d_request_item_variable_location_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_request_item_variable_location_c a117 
on (a11.request_item_key = a117.row_key) 
union
select 'ldb.d_request_item_variable_site_c a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_request_item_variable_site_c a118 
on (a11.request_item_key = a118.row_key) 
union
select 'ldb.d_request_item_variable_software_c a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_request_item_variable_software_c a119 
on (a11.request_item_key = a119.row_key) 
union
select 'ldb.d_request_item_variable_start_date_c a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_request_item_variable_start_date_c a120 
on (a11.request_item_key = a120.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_internal_contact_assigned_to a121 
on (a11.assigned_to_key = a121.row_key) 
union
select 'ldb.d_internal_organization_group a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_internal_organization_group a122 
on (a11.assignment_group_key = a122.row_key) 
union
select 'ldb.d_internal_contact_mdm a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_internal_contact a110 
on (a11.closed_by_key = a110.row_key) 
join ldb.d_internal_contact_mdm a123 
on (a110.row_current_key = a123.row_current_key) 
union
select 'ldb.d_party_new_hire_c a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_party_new_hire_c a124 
on (a11.new_hire_c_key = a124.row_key) 
union
select 'ldb.d_party_preparer_c a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_party_preparer_c a125 
on (a11.requested_for_c_key = a125.row_key) 
union
select 'ldb.d_request a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_request a126 
on (a11.request_key = a126.row_key) 
union
select 'ldb.d_sc_req_item_approval a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_sc_req_item_approval a127 
on (a11.approval_state_src_key = a127.row_key) 
union
select 'ldb.d_request_item_stage a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_request_item_stage a128 
on (a11.stage_src_key = a128.row_key) 
union
select 'ldb.d_request_item_state a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_request_item_state a129 
on (a11.state_src_key = a129.row_key) 
union
select 'ldb.d_internal_contact_requested_for a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_internal_contact_requested_for a130 
on (a11.requested_for_key = a130.row_key) 
union
select 'ldb.d_internal_contact_task_closed_by a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_internal_contact_task_closed_by a131 
on (a11.closed_by_key = a131.row_key) 
union
select 'ldb.d_calendar_month a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_calendar_date a111 
on (a11.closed_on_key = a111.row_key) 
join ldb.d_calendar_month a132 
on (a111.month_start_date_key = a132.row_key) 
union
select 'ldb.d_calendar_week a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_calendar_date a111 
on (a11.closed_on_key = a111.row_key) 
join ldb.d_calendar_week a133 
on (a111.week_start_date_key = a133.row_key) 
union
select 'ldb.d_configuration_item_cmdb_ci_c a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_request_item_variable_cmdb_ci_c a114 
on (a11.request_item_key = a114.row_key) 
join ldb.d_configuration_item_cmdb_ci_c a134 
on (a114.cmdb_ci = a134.row_key) 
union
select 'ldb.d_location_site_c a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_request_item_variable_site_c a118 
on (a11.request_item_key = a118.row_key) 
join ldb.d_location_site_c a135 
on (a118.site = a135.row_key) 
union
select 'ldb.d_calendar_quarter a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_calendar_date a111 
on (a11.closed_on_key = a111.row_key) 
join ldb.d_calendar_quarter a136 
on (a111.quarter_start_date_key = a136.row_key) 
union
select 'ldb.d_calendar_year a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11 
join ldb.d_calendar_date a111 
on (a11.closed_on_key = a111.row_key) 
join ldb.d_calendar_year a137 
on (a111.year_start_date_key = a137.row_key) 