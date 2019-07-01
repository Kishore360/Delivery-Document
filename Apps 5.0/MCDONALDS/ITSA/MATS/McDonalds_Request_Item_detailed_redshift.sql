select 'ldb.f_request_item a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
union
select 'ldb.d_request_item a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_request_item a13 
on (a11.request_item_key = a13.row_key) 
union
select 'ldb.d_calendar_date a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_calendar_date a14 
on (a11.opened_on_key = a14.row_key) 
union
select 'ldb.d_master_item a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_master_item a15 
on (a11.catalog_item_key = a15.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_contact_assigned_to a16 
on (a11.assigned_to_key = a16.row_key) 
union
select 'ldb.d_internal_organization_group a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_organization_group a17 
on (a11.assignment_group_key = a17.row_key) 
union
select 'ldb.d_request_item_business_service_c a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_request_item_business_service_c a18 
on (a11.business_service_c_key = a18.row_key) 
union
select 'ldb.d_internal_organization_department a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
join ldb.d_internal_organization_department a19 
on (a12.department_key = a19.row_key) 
union
select 'ldb.d_internal_contact_mdm a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
join ldb.d_internal_contact_mdm a110 
on (a12.row_current_key = a110.row_current_key) 
union
select 'ldb.d_hr_change_category a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_hr_change_category a111 
on (a11.hr_category_src_key = a111.row_key) 
union
select 'ldb.d_hr_change a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_hr_change a112 
on (a11.hr_change_key = a112.row_key) 
union
select 'ldb.d_scafe_core_realm_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_scafe_core_realm_c a113 
on (a11.scafe_core_realm_c_key = a113.row_key) 
union
select 'ldb.d_request a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_request a114 
on (a11.request_key = a114.row_key) 
union
select 'ldb.d_sc_req_item_approval a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_sc_req_item_approval a115 
on (a11.approval_state_src_key = a115.row_key) 
union
select 'ldb.d_sc_req_item_impact a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_sc_req_item_impact a116 
on (a11.impact_src_key = a116.row_key) 
union
select 'ldb.d_sc_req_item_priority a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_sc_req_item_priority a117 
on (a11.priority_src_key = a117.row_key) 
union
select 'ldb.d_request_item_stage a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_request_item_stage a118 
on (a11.stage_src_key = a118.row_key) 
union
select 'ldb.d_request_item_state a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_request_item_state a119 
on (a11.state_src_key = a119.row_key) 
union
select 'ldb.d_sc_req_item_urgency a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_sc_req_item_urgency a120 
on (a11.urgency_src_key = a120.row_key) 
union
select 'ldb.d_internal_contact_requested_for a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_contact_requested_for a121 
on (a11.requested_for_key = a121.row_key) 
union
select 'ldb.d_internal_contact_request_item_requester_c a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_contact_request_item_requester_c a122 
on (a11.requester_c_key = a122.row_key) 
union
select 'ldb.d_internal_contact a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_contact a123 
on (a11.resolved_by_c_key = a123.row_key) 
union
select 'ldb.d_internal_contact_task_closed_by a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_contact_task_closed_by a124 
on (a11.closed_by_key = a124.row_key) 
union
select 'ldb.d_location a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_location a125 
on (a11.location_key = a125.row_key) 
union
select 'ldb.d_lov_request_item_affected_enivronment_c a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_request_item a13 
on (a11.request_item_key = a13.row_key) 
join ldb.d_lov_request_item_affected_enivronment_c a126 
on (a13.affected_environment_src_c_key = a126.row_key) 
union
select 'ldb.d_calendar_month a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_calendar_date a14 
on (a11.opened_on_key = a14.row_key) 
join ldb.d_calendar_month a127 
on (a14.month_start_date_key = a127.row_key) 
union
select 'ldb.d_calendar_week a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_calendar_date a14 
on (a11.opened_on_key = a14.row_key) 
join ldb.d_calendar_week a128 
on (a14.week_start_date_key = a128.row_key) 
union
select 'ldb.d_lov_request_item_remainder_notifications_c a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_request_item a13 
on (a11.request_item_key = a13.row_key) 
join ldb.d_lov_request_item_remainder_notifications_c a129 
on (a13.reminder_notifications_src_c_key = a129.row_key) 
union
select 'ldb.d_lov_request_item_resolution_code_c a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_request_item a13 
on (a11.request_item_key = a13.row_key) 
join ldb.d_lov_request_item_resolution_code_c a130 
on (a13.resolution_code_src_c_key = a130.row_key) 
union
select 'ldb.d_lov_request_item_service_category_c a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_request_item a13 
on (a11.request_item_key = a13.row_key) 
join ldb.d_lov_request_item_service_category_c a131 
on (a13.service_category_src_c_key = a131.row_key) 
union
select 'ldb.d_lov_request_item_situation_c a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_request_item a13 
on (a11.request_item_key = a13.row_key) 
join ldb.d_lov_request_item_situation_c a132 
on (a13.situation_src_c_key = a132.row_key) 
union
select 'ldb.d_calendar_quarter a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_calendar_date a14 
on (a11.opened_on_key = a14.row_key) 
join ldb.d_calendar_quarter a133 
on (a14.quarter_start_date_key = a133.row_key) 
union
select 'ldb.d_calendar_year a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_calendar_date a14 
on (a11.opened_on_key = a14.row_key) 
join ldb.d_calendar_year a134 
on (a14.year_start_date_key = a134.row_key) 