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
select 'ldb.d_calendar_date a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_calendar_date a15 
on (a11.opened_on_key = a15.row_key) 
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
join ldb.d_internal_organization_department a19 
on (a11.opened_by_department_key = a19.row_key) 
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
select 'ldb.d_request a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_request a113 
on (a11.request_key = a113.row_key) 
union
select 'ldb.d_sc_req_item_approval a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_sc_req_item_approval a114 
on (a11.approval_state_src_key = a114.row_key) 
union
select 'ldb.d_sc_req_item_impact a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_sc_req_item_impact a115 
on (a11.impact_src_key = a115.row_key) 
union
select 'ldb.d_sc_req_item_priority a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_sc_req_item_priority a116 
on (a11.priority_src_key = a116.row_key) 
union
select 'ldb.d_request_item_stage a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_request_item_stage a117 
on (a11.stage_src_key = a117.row_key) 
union
select 'ldb.d_request_item_state a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_request_item_state a118 
on (a11.state_src_key = a118.row_key) 
union
select 'ldb.d_sc_req_item_urgency a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_sc_req_item_urgency a119 
on (a11.urgency_src_key = a119.row_key) 
union
select 'ldb.d_internal_contact_requested_for a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_contact_requested_for a120 
on (a11.requested_for_key = a120.row_key) 
union
select 'ldb.d_internal_contact_request_item_requester_c a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_contact_request_item_requester_c a121 
on (a11.requester_c_key = a121.row_key) 
union
select 'ldb.d_internal_contact a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_contact a122 
on (a11.resolved_by_c_key = a122.row_key) 
union
select 'ldb.d_internal_contact_task_closed_by a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_contact_task_closed_by a123 
on (a11.closed_by_key = a123.row_key) 
union
select 'ldb.d_location a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_location a124 
on (a11.location_key = a124.row_key) 
union
select 'ldb.d_request_item_affected_enivronment_c a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_request_item a14 
on (a11.request_item_key = a14.row_key) 
join ldb.d_request_item_affected_enivronment_c a125 
on (a14.affected_environment_src_c_key = a125.row_key) 
union
select 'ldb.d_calendar_month a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_calendar_date a15 
on (a11.opened_on_key = a15.row_key) 
join ldb.d_calendar_month a126 
on (a15.month_start_date_key = a126.row_key) 
union
select 'ldb.d_request_item_remainder_notifications_c a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_request_item a14 
on (a11.request_item_key = a14.row_key) 
join ldb.d_request_item_remainder_notifications_c a127 
on (a14.reminder_notifications_src_c_key = a127.row_key) 
union
select 'ldb.d_request_item_resolution_code_c a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_request_item a14 
on (a11.request_item_key = a14.row_key) 
join ldb.d_request_item_resolution_code_c a128 
on (a14.resolution_code_src_c_key = a128.row_key) 
union
select 'ldb.d_request_item_service_category_c a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_request_item a14 
on (a11.request_item_key = a14.row_key) 
join ldb.d_request_item_service_category_c a129 
on (a14.service_category_src_c_key = a129.row_key) 
union
select 'ldb.d_request_item_situation_c a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_request_item a14 
on (a11.request_item_key = a14.row_key) 
join ldb.d_request_item_situation_c a130 
on (a14.situation_src_c_key = a130.row_key) 
