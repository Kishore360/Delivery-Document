select 'ldb.f_change_request a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
union
select 'ldb.d_internal_contact_assigned_to a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_contact_assigned_to a12 
on (a11.assigned_to_key = a12.row_key) 
union
select 'ldb.d_internal_contact a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) 
union
select 'ldb.d_change_request a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request a14 
on (a11.change_request_key = a14.row_key) 
union
select 'ldb.d_calendar_date_actual_start_on_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_date_actual_start_on_c a15 
on (a11.work_start_on_key = a15.row_key) 
union
select 'ldb.d_internal_organization_group a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_organization_group a16 
on (a11.assignment_group_key = a16.row_key) 
union
select 'ldb.dh_employee_hierarchy_dept_head_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_organization_group a16 
on (a11.assignment_group_key = a16.row_key) 
join ldb.dh_employee_hierarchy_dept_head_c a17 
on (a16.department_head_c_key = a17.lev_0_key) 
union
select 'ldb.d_business_service a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_business_service a18 
on (a11.business_service_key = a18.row_key) 
union
select 'ldb.d_calendar_date a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_date a19 
on (a11.opened_on_key = a19.row_key) 
union
select 'ldb.d_change_request_risk a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_risk a110 
on (a11.risk_src_key = a110.row_key) 
union
select 'ldb.d_calendar_date_closed_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_date_closed_c a111 
on (a11.closed_on_key = a111.row_key) 
union
select 'ldb.d_configuration_item a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_configuration_item a112 
on (a11.configuration_item_key = a112.row_key) 
union
select 'ldb.d_calendar_date_opened_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_date_opened_c a113 
on (a11.opened_on_key = a113.row_key) 
union
select 'ldb.d_calendar_date_planned_start_on_c a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_date_planned_start_on_c a114 
on (a11.planned_start_on_key = a114.row_key) 
union
select 'ldb.d_calendar_month a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_date a19 
on (a11.opened_on_key = a19.row_key) 
join ldb.d_calendar_month a115 
on (a19.month_start_date_key = a115.row_key) 
union
select 'ldb.d_calendar_week a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_date a19 
on (a11.opened_on_key = a19.row_key) 
join ldb.d_calendar_week a116 
on (a19.week_start_date_key = a116.row_key) 
union
select 'ldb.d_calendar_quarter a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_date a19 
on (a11.opened_on_key = a19.row_key) 
join ldb.d_calendar_quarter a117 
on (a19.quarter_start_date_key = a117.row_key) 
union
select 'ldb.d_calendar_year a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_date a19 
on (a11.opened_on_key = a19.row_key) 
join ldb.d_calendar_year a118 
on (a19.year_start_date_key = a118.row_key) 
union
select 'ldb.d_change_request_approval a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_approval a119 
on (a11.approval_state_src_key = a119.row_key) 
union
select 'ldb.d_internal_contact_cab_delegate_c a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_contact_cab_delegate_c a120 
on (a11.cab_delegate_c_key = a120.row_key) 
union
select 'ldb.d_change_request_category a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_category a121 
on (a11.category_src_key = a121.row_key) 
union
select 'ldb.d_change_request_reported_type a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_reported_type a122 
on (a11.reported_type_src_key = a122.row_key) 
union
select 'ldb.d_change_request_impact a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_impact a123 
on (a11.impact_src_key = a123.row_key) 
union
select 'ldb.d_change_request_priority a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_priority a124 
on (a11.priority_src_key = a124.row_key) 
union
select 'ldb.d_change_request_reason a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_reason a125 
on (a11.reason_src_key = a125.row_key) 
union
select 'ldb.d_change_request_review_status a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_review_status a126 
on (a11.review_status_src_key = a126.row_key) 
union
select 'ldb.d_change_request_scope a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_scope a127 
on (a11.scope_src_key = a127.row_key) 
union
select 'ldb.d_change_request_state a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_state a128 
on (a11.state_src_key = a128.row_key) 
union
select 'ldb.d_change_request_type a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_type a129 
on (a11.type_src_key = a129.row_key) 
union
select 'ldb.d_change_request_urgency a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_urgency a130 
on (a11.urgency_src_key = a130.row_key) 
union
select 'ldb.d_internal_organization_department a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_organization_department a131 
on (a11.requested_by_department_key = a131.row_key) 
union
select 'ldb.d_domain a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_domain a132 
on (a11.domain_key = a132.row_key) 
union
select 'ldb.d_internal_contact_mdm a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) 
join ldb.d_internal_contact_mdm a133 
on (a13.row_current_key = a133.row_current_key) 
union
select 'ldb.d_location a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_location a134 
on (a11.location_key = a134.row_key) 
union
select 'ldb.d_aetna_system_environments_c a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request a14 
on (a11.change_request_key = a14.row_key) 
join ldb.d_aetna_system_environments_c a135 
on (a14.aetna_system_environment_c_key = a135.row_key) 
union
select 'ldb.dh_employee_hierarchy_dept_head_level2_c a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_organization_group a16 
on (a11.assignment_group_key = a16.row_key) join ldb.dh_employee_hierarchy_dept_head_c a17 
on (a16.department_head_c_key = a17.lev_0_key) 
join ldb.dh_employee_hierarchy_dept_head_level2_c a136 
on (a17.lev_1_key = a136.row_key) 
union
select 'ldb.dh_employee_hierarchy_dept_head_level3_c a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_organization_group a16 
on (a11.assignment_group_key = a16.row_key) join ldb.dh_employee_hierarchy_dept_head_c a17 
on (a16.department_head_c_key = a17.lev_0_key) 
join ldb.dh_employee_hierarchy_dept_head_level3_c a137 
on (a17.lev_2_key = a137.row_key) 
union
select 'ldb.dh_employee_hierarchy_dept_head_level4_c a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_organization_group a16 
on (a11.assignment_group_key = a16.row_key) join ldb.dh_employee_hierarchy_dept_head_c a17 
on (a16.department_head_c_key = a17.lev_0_key) 
join ldb.dh_employee_hierarchy_dept_head_level4_c a138 
on (a17.lev_3_key = a138.row_key) 
union
select 'ldb.dh_employee_hierarchy_dept_head_level5_c a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_organization_group a16 
on (a11.assignment_group_key = a16.row_key) join ldb.dh_employee_hierarchy_dept_head_c a17 
on (a16.department_head_c_key = a17.lev_0_key) 
join ldb.dh_employee_hierarchy_dept_head_level5_c a139 
on (a17.lev_4_key = a139.row_key) 
union
select 'ldb.d_internal_contact_department_head_c a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_organization_group a16 
on (a11.assignment_group_key = a16.row_key) 
join ldb.d_internal_contact_department_head_c a140 
on (a16.department_head_c_key = a140.row_key) 
union
select 'ldb.d_internal_organization_department_c a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_organization_group a16 
on (a11.assignment_group_key = a16.row_key) 
join ldb.d_internal_organization_department_c a141 
on (a16.department_c_key = a141.row_key) 
union
select 'ldb.d_business_service_criticality a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_business_service a18 
on (a11.business_service_key = a18.row_key) 
join ldb.d_business_service_criticality a142 
on (a18.criticality_key = a142.row_key) 
union
select 'ldb.d_business_service_used_for a143 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_business_service a18 
on (a11.business_service_key = a18.row_key) 
join ldb.d_business_service_used_for a143 
on (a18.used_for_src_key = a143.row_key) 
union
select 'ldb.d_change_request_close_code a144 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request a14 
on (a11.change_request_key = a14.row_key) 
join ldb.d_change_request_close_code a144 
on (a14.close_code_src_key = a144.row_key) 
union
select 'ldb.d_lov_change_request_data_center_alerts_c a145 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request a14 
on (a11.change_request_key = a14.row_key) 
join ldb.d_lov_change_request_data_center_alerts_c a145 
on (a14.data_center_alerts_src_c_key = a145.row_key) 
union
select 'ldb.d_lov_change_request_verification_method_c a146 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request a14 
on (a11.change_request_key = a14.row_key) 
join ldb.d_lov_change_request_verification_method_c a146 
on (a14.verification_method_src_c_key = a146.row_key) 
union
select 'ldb.d_lov_change_request_impact_during_change_c a147 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request a14 
on (a11.change_request_key = a14.row_key) 
join ldb.d_lov_change_request_impact_during_change_c a147 
on (a14.impact_during_change_src_c_key = a147.row_key) 
union
select 'ldb.d_lov_change_request_resolution_reason_c a148 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request a14 
on (a11.change_request_key = a14.row_key) 
join ldb.d_lov_change_request_resolution_reason_c a148 
on (a14.resolution_reason_src_c_key = a148.row_key) 