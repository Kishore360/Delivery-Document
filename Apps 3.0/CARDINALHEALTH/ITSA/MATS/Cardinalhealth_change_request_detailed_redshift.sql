select 'ldb.f_change_request a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
union
select 'ldb.d_change_request a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request a13 
on (a11.change_request_key = a13.row_key) 
union
select 'ldb.d_internal_organization_group a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_organization_group a14 
on (a11.assignment_group_key = a14.row_key) 
union
select 'ldb.d_internal_contact_emp_seniors_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_organization_group a14 
on (a11.assignment_group_key = a14.row_key) 
join ldb.d_internal_contact_emp_seniors_c a15 
on (a14.manager_c_key = a15.row_key) 
union
select 'ldb.d_assignment_group_level0_manager_c_relation a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_assignment_group_level0_manager_c_relation a16 
on (a11.assignment_group_key = a16.level0_assigment_group_key) 
union
select 'ldb.d_configuration_item a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_configuration_item a17 
on (a11.configuration_item_key = a17.row_key) 
union
select 'ldb.d_calendar_date a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_date a18 
on (a11.opened_on_key = a18.row_key) 
union
select 'ldb.d_internal_organization_causal_assignment_group_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_organization_causal_assignment_group_c a19 
on (a11.causal_assignment_group_c_key = a19.row_key) 
union
select 'ldb.d_calendar_greg_fiscal_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_greg_fiscal_c a110 
on (a11.opened_on_key = a110.greogrian_calendar_key) 
union
select 'ldb.d_calendar_date_fiscal a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_greg_fiscal_c a110 
on (a11.opened_on_key = a110.greogrian_calendar_key) 
join ldb.d_calendar_date_fiscal a111 
on (a110.fiscal_key = a111.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_contact_assigned_to a112 
on (a11.assigned_to_key = a112.row_key) 
union
select 'ldb.d_change_request_category a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_category a113 
on (a11.category_src_key = a113.row_key) 
union
select 'ldb.d_change_request_impact a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_impact a114 
on (a11.impact_src_key = a114.row_key) 
union
select 'ldb.d_change_request_priority a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_priority a115 
on (a11.priority_src_key = a115.row_key) 
union
select 'ldb.d_change_request_reason a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_reason a116 
on (a11.reason_src_key = a116.row_key) 
union
select 'ldb.d_change_request_reported_type a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_reported_type a117 
on (a11.reported_type_src_key = a117.row_key) 
union
select 'ldb.d_change_request_state a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_state a118 
on (a11.state_src_key = a118.row_key) 
union
select 'ldb.d_change_request_risk a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_risk a119 
on (a11.risk_src_key = a119.row_key) 
union
select 'ldb.d_change_request_scope a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_scope a120 
on (a11.scope_src_key = a120.row_key) 
union
select 'ldb.d_change_request_type a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_type a121 
on (a11.type_src_key = a121.row_key) 
union
select 'ldb.d_change_request_urgency a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_urgency a122 
on (a11.urgency_src_key = a122.row_key) 
union
select 'ldb.d_internal_organization_department a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_organization_department a123 
on (a11.requested_by_department_key = a123.row_key) 
union
select 'ldb.d_change_request_lov_deployment_reason_c a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_lov_deployment_reason_c a124 
on (a11.deployment_reason_c_key = a124.row_key) 
union
select 'ldb.d_domain a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_domain a125 
on (a11.domain_key = a125.row_key) 
union
select 'ldb.d_internal_contact_mdm a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
join ldb.d_internal_contact_mdm a126 
on (a12.row_current_key = a126.row_current_key) 
union
select 'ldb.d_lov_reason_for_change_change_request_c a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_lov_reason_for_change_change_request_c a127 
on (a11.reason_for_change_src_c_key = a127.row_key) 
union
select 'ldb.d_change_request_lov_stage_c a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_lov_stage_c a128 
on (a11.stage_src_c_key = a128.row_key) 
union
select 'ldb.d_change_request_lov_standard_status_c a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_lov_standard_status_c a129 
on (a11.standard_status_c_key = a129.row_key) 
union
select 'ldb.d_change_request_lov_subcategory_c a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_lov_subcategory_c a130 
on (a11.subcategory_c_key = a130.row_key) 
union
select 'ldb.d_change_request_lov_success_state_c a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_change_request_lov_success_state_c a131 
on (a11.success_status_c_key = a131.row_key) 
union
select 'ldb.d_location a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_location a132 
on (a11.location_key = a132.row_key) 
union
select 'ldb.d_assignment_group_level0_manager_c a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_assignment_group_level0_manager_c_relation a16 
on (a11.assignment_group_key = a16.level0_assigment_group_key) 
join ldb.d_assignment_group_level0_manager_c a133 
on (a16.level0_manager_c_key = a133.level0_manager_c_key) 
union
select 'ldb.d_internal_contact_configuration_item_cat_representative_c a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_configuration_item a17 
on (a11.configuration_item_key = a17.row_key) 
join ldb.d_internal_contact_configuration_item_cat_representative_c a134 
on (a17.cat_representative_c_key = a134.row_key) 
union
select 'ldb.d_internal_contact_causal_assignment_group_director_c a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_organization_causal_assignment_group_c a19 
on (a11.causal_assignment_group_c_key = a19.row_key) 
join ldb.d_internal_contact_causal_assignment_group_director_c a135 
on (a19.director_c_key = a135.row_key) 
union
select 'ldb.d_internal_contact_assignment_grp_manager_c a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_organization_causal_assignment_group_c a19 
on (a11.causal_assignment_group_c_key = a19.row_key) 
join ldb.d_internal_contact_assignment_grp_manager_c a136 
on (a19.manager_c_key = a136.row_key) 
union
select 'ldb.d_internal_contact_causal_assignment_group_vp_c a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_internal_organization_causal_assignment_group_c a19 
on (a11.causal_assignment_group_c_key = a19.row_key) 
join ldb.d_internal_contact_causal_assignment_group_vp_c a137 
on (a19.vp_c_key = a137.row_key) 
union
select 'ldb.d_internal_contact_level_5_c a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_configuration_item a17 
on (a11.configuration_item_key = a17.row_key) 
join ldb.d_internal_contact_level_5_c a138 
on (a17.cah_level_5_c_key = a138.row_key) 
union
select 'ldb.d_calendar_fiscal_period a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_greg_fiscal_c a110 
on (a11.opened_on_key = a110.greogrian_calendar_key) join ldb.d_calendar_date_fiscal a111 
on (a110.fiscal_key = a111.row_key) 
join ldb.d_calendar_fiscal_period a139 
on (a111.period_start_date_key = a139.row_key) 
union
select 'ldb.d_calendar_month a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_date a18 
on (a11.opened_on_key = a18.row_key) 
join ldb.d_calendar_month a140 
on (a18.month_start_date_key = a140.row_key) 
union
select 'ldb.d_calendar_fiscal_quarter a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_greg_fiscal_c a110 
on (a11.opened_on_key = a110.greogrian_calendar_key) join ldb.d_calendar_date_fiscal a111 
on (a110.fiscal_key = a111.row_key) 
join ldb.d_calendar_fiscal_quarter a141 
on (a111.quarter_start_date_key = a141.row_key) 
union
select 'ldb.d_calendar_fiscal_year a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_calendar_greg_fiscal_c a110 
on (a11.opened_on_key = a110.greogrian_calendar_key) join ldb.d_calendar_date_fiscal a111 
on (a110.fiscal_key = a111.row_key) 
join ldb.d_calendar_fiscal_year a142 
on (a111.year_start_date_key = a142.row_key) 