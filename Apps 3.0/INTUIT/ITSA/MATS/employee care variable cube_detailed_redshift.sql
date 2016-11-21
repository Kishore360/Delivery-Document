select 'ldb.f_request_item a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
 join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
union
select 'ldb.d_master_item a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
 join ldb.d_master_item a13 
on (a11.catalog_item_key = a13.row_key) 
union
select 'ldb.d_request_item a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
 join ldb.d_request_item a14 
on (a11.request_item_key = a14.row_key) 
union
select 'ldb.d_request_item_variable_audio_issue_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
 join ldb.d_request_item_variable_audio_issue_c a15 
on (a11.request_item_key = a15.row_key) 
union
select 'ldb.d_request_item_variable_calendar_issue_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
 join ldb.d_request_item_variable_calendar_issue_c a16 
on (a11.request_item_key = a16.row_key) 
union
select 'ldb.d_request_item_variable_camera_issue_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
 join ldb.d_request_item_variable_camera_issue_c a17 
on (a11.request_item_key = a17.row_key) 
union
select 'ldb.d_request_item_variable_content_issue_c a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
 join ldb.d_request_item_variable_content_issue_c a18 
on (a11.request_item_key = a18.row_key) 
union
select 'ldb.d_request_item_variable_monitor_issue_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
 join ldb.d_request_item_variable_monitor_issue_c a19 
on (a11.request_item_key = a19.row_key) 
union
select 'ldb.d_request_item_variable_tablet_issue_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
 join ldb.d_request_item_variable_tablet_issue_c a110 
on (a11.request_item_key = a110.row_key) 
union
select 'ldb.d_calendar_date_closed a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
 join ldb.d_calendar_date_closed a111 
on (a11.closed_on_key = a111.row_key) 
union
select 'ldb.d_request_item_variable_comments a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
 join ldb.d_request_item_variable_comments a112 
on (a11.request_item_key = a112.row_key) 
union
select 'ldb.d_request_item_variable_cmdb_ci_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
 join ldb.d_request_item_variable_cmdb_ci_c a113 
on (a11.request_item_key = a113.row_key) 
union
select 'ldb.d_request_item_variable_hardware a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
 join ldb.d_request_item_variable_hardware a114 
on (a11.request_item_key = a114.row_key) 
union
select 'ldb.d_request_item_variable_location a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
 join ldb.d_request_item_variable_location a115 
on (a11.request_item_key = a115.row_key) 
union
select 'ldb.d_calendar_date a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
 join ldb.d_calendar_date a116 
on (a11.opened_on_key = a116.row_key) 
union
select 'ldb.d_request_item_variable_site_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
 join ldb.d_request_item_variable_site_c a117 
on (a11.request_item_key = a117.row_key) 
union
select 'ldb.d_request_item_variable_software a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
 join ldb.d_request_item_variable_software a118 
on (a11.request_item_key = a118.row_key) 
union
select 'ldb.d_request_item_variable_start_date a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
 join ldb.d_request_item_variable_start_date a119 
on (a11.request_item_key = a119.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
 join ldb.d_internal_contact_assigned_to a120 
on (a11.assigned_to_key = a120.row_key) 
union
select 'ldb.d_internal_organization_group a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
 join ldb.d_internal_organization_group a121 
on (a11.assignment_group_key = a121.row_key) 
union
select 'ldb.d_internal_contact_mdm a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
 join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
 join ldb.d_internal_contact_mdm a122 
on (a12.row_current_key = a122.row_current_key) 
union
select 'ldb.d_party_new_hire a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
 join ldb.d_party_new_hire a123 
on (a11.new_hire_c_key = a123.row_key) 
union
select 'ldb.d_party_preparer a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
 join ldb.d_party_preparer a124 
on (a11.requested_for_c_key = a124.row_key) 
union
select 'ldb.d_request a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
 join ldb.d_request a125 
on (a11.request_key = a125.row_key) 
union
select 'ldb.d_sc_req_item_approval a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
 join ldb.d_sc_req_item_approval a126 
on (a11.approval_state_src_key = a126.row_key) 
union
select 'ldb.d_request_item_stage a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
 join ldb.d_request_item_stage a127 
on (a11.stage_src_key = a127.row_key) 
union
select 'ldb.d_request_item_state a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
 join ldb.d_request_item_state a128 
on (a11.state_src_key = a128.row_key) 
union
select 'ldb.d_internal_contact_requested_for a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
 join ldb.d_internal_contact_requested_for a129 
on (a11.requested_for_key = a129.row_key) 
union
select 'ldb.d_internal_contact_task_closed_by a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
 join ldb.d_internal_contact_task_closed_by a130 
on (a11.closed_by_key = a130.row_key) 
union
select 'ldb.d_configuration_item_cmdb_ci_c a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
 join ldb.d_request_item_variable_cmdb_ci_c a113 
on (a11.request_item_key = a113.row_key) 
 join ldb.d_configuration_item_cmdb_ci_c a131 
on (a113.cmdb_ci = a131.row_key) 
union
select 'ldb.d_calendar_month a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
 join ldb.d_calendar_date a116 
on (a11.opened_on_key = a116.row_key) 
 join ldb.d_calendar_month a132 
on (a116.month_start_date_key = a132.row_key) 
union
select 'ldb.d_location_site_c a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
 join ldb.d_request_item_variable_site_c a117 
on (a11.request_item_key = a117.row_key) 
 join ldb.d_location_site_c a133 
on (a117.site = a133.row_key) 
union
select 'ldb.d_calendar_week a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
 join ldb.d_calendar_date a116 
on (a11.opened_on_key = a116.row_key) 
 join ldb.d_calendar_week a134 
on (a116.week_start_date_key = a134.row_key) 
union
select 'ldb.d_calendar_month_closed a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
 join ldb.d_calendar_date_closed a111 
on (a11.closed_on_key = a111.row_key) 
 join ldb.d_calendar_month_closed a135 
on (a111.month_start_date_key = a135.row_key) 

