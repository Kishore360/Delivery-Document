select 'ldb.f_request_item a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
union
select 'ldb.d_location a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_location a12 
on (a11.location_key = a12.row_key) 
union
select 'ldb.d_internal_contact a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) 
union
select 'ldb.d_master_item a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_master_item a14 
on (a11.catalog_item_key = a14.row_key) 
union
select 'ldb.d_internal_organization_group a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) 
union
select 'ldb.dh_user_group_hierarchy a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) 
join ldb.dh_user_group_hierarchy a16 
on (a15.row_dn_key = a16.lev_0_key) 
union
select 'ldb.d_request_item a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_request_item a17 
on (a11.request_item_key = a17.row_key) 
union
select 'ldb.d_configuration_item a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_configuration_item a18 
on (a11.configuration_item_key = a18.row_key) 
union
select 'ldb.d_calendar_date a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_calendar_date a19 
on (a11.opened_on_key = a19.row_key) 
union
select 'ldb.d_request_item_parent_task_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_request_item_parent_task_c a110 
on (a11.parent_task_c_key = a110.row_key) 
union
select 'ldb.d_internal_contact_requested_for_company_name_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_contact_requested_for_company_name_c a111 
on (a11.requested_for_key = a111.row_key) 
union
select 'ldb.d_internal_contact_requested_for_cost_center_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_contact_requested_for_cost_center_c a112 
on (a11.requested_for_key = a112.row_key) 
union
select 'ldb.d_request a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_request a113 
on (a11.request_key = a113.row_key) 
union
select 'ldb.d_lov_sc_req_item_action_c a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_lov_sc_req_item_action_c a114 
on (a11.action_src_c_key = a114.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_contact_assigned_to a115 
on (a11.assigned_to_key = a115.row_key) 
union
select 'ldb.d_lov_sc_req_item_category_c a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_lov_sc_req_item_category_c a116 
on (a11.category_src_c_key = a116.row_key) 
union
select 'ldb.d_lov_sc_req_item_close_code_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_lov_sc_req_item_close_code_c a117 
on (a11.close_code_src_c_key = a117.row_key) 
union
select 'ldb.d_internal_organization_department a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_organization_department a118 
on (a11.opened_by_department_key = a118.row_key) 
union
select 'ldb.d_internal_contact_mdm a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) 
join ldb.d_internal_contact_mdm a119 
on (a13.row_current_key = a119.row_current_key) 
union
select 'ldb.d_internal_contact_fulfilled_by_c a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_contact_fulfilled_by_c a120 
on (a11.fulfilled_by_c_key = a120.row_key) 
union
select 'ldb.d_hr_change_category a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_hr_change_category a121 
on (a11.hr_category_src_key = a121.row_key) 
union
select 'ldb.d_hr_change a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_hr_change a122 
on (a11.hr_change_key = a122.row_key) 
union
select 'ldb.d_lov_sc_req_item_pending_state_c a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_lov_sc_req_item_pending_state_c a123 
on (a11.pending_state_src_c_key = a123.row_key) 
union
select 'ldb.d_lov_sc_req_item_region_c a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_lov_sc_req_item_region_c a124 
on (a11.region_src_c_key = a124.row_key) 
union
select 'ldb.d_sc_req_item_approval a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_sc_req_item_approval a125 
on (a11.approval_state_src_key = a125.row_key) 
union
select 'ldb.d_request_item_contacttype_c a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_request_item_contacttype_c a126 
on (a11.contact_type_src_c_key = a126.row_key) 
union
select 'ldb.d_request_task_location_c a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_request_task_location_c a127 
on (a11.location_key = a127.row_key) 
union
select 'ldb.d_sc_req_item_priority a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_sc_req_item_priority a128 
on (a11.priority_src_key = a128.row_key) 
union
select 'ldb.d_request_item_stage a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_request_item_stage a129 
on (a11.stage_src_key = a129.row_key) 
union
select 'ldb.d_request_item_state a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_request_item_state a130 
on (a11.state_src_key = a130.row_key) 
union
select 'ldb.d_internal_contact_requested_for a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_contact_requested_for a131 
on (a11.requested_for_key = a131.row_key) 
union
select 'ldb.d_internal_contact_requestor_c a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_contact_requestor_c a132 
on (a11.requestor_c_key = a132.row_key) 
union
select 'ldb.d_lov_source_c a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_lov_source_c a133 
on (a11.source_src_c_key = a133.row_key) 
union
select 'ldb.d_lov_sc_req_item_sub_category_c a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_lov_sc_req_item_sub_category_c a134 
on (a11.sub_category_src_c_key = a134.row_key) 
union
select 'ldb.d_internal_contact_task_closed_by a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_contact_task_closed_by a135 
on (a11.closed_by_key = a135.row_key) 
union
select 'ldb.dh_user_group_level1 a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) join ldb.dh_user_group_hierarchy a16 
on (a15.row_dn_key = a16.lev_0_key) 
join ldb.dh_user_group_level1 a136 
on (a16.lev_1_key = a136.row_key) 
union
select 'ldb.d_lov_incident_dispatch_reason_c a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_request_item a17 
on (a11.request_item_key = a17.row_key) 
join ldb.d_lov_sc_req_item_dispatch_reason_c a137 
on (a17.dispatch_reason_src_c_key = a137.row_key) 
union
select 'ldb.dh_user_group_level2 a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) join ldb.dh_user_group_hierarchy a16 
on (a15.row_dn_key = a16.lev_0_key) 
join ldb.dh_user_group_level2 a138 
on (a16.lev_2_key = a138.row_key) 
union
select 'ldb.d_calendar_month a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_calendar_date a19 
on (a11.opened_on_key = a19.row_key) 
join ldb.d_calendar_month a139 
on (a19.month_start_date_key = a139.row_key) 
union
select 'ldb.dh_user_group_level3 a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) join ldb.dh_user_group_hierarchy a16 
on (a15.row_dn_key = a16.lev_0_key) 
join ldb.dh_user_group_level3 a140 
on (a16.lev_3_key = a140.row_key) 
union
select 'ldb.dh_user_group_level4 a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) join ldb.dh_user_group_hierarchy a16 
on (a15.row_dn_key = a16.lev_0_key) 
join ldb.dh_user_group_level4 a141 
on (a16.lev_4_key = a141.row_key) 
union
select 'ldb.dh_user_group_level5 a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) join ldb.dh_user_group_hierarchy a16 
on (a15.row_dn_key = a16.lev_0_key) 
join ldb.dh_user_group_level5 a142 
on (a16.lev_5_key = a142.row_key) 
