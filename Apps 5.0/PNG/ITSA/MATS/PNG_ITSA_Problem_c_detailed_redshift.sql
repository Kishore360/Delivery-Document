select 'ldb.f_problem a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
union
select 'ldb.d_ag_manager_role_vp_dir_ad_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_ag_manager_role_vp_dir_ad_c a12 
on (a11.problem_assignment_group_key = a12.internal_organization_key) 
union
select 'ldb.d_internal_contact a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) 
union
select 'ldb.d_calendar_date_fiscal a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_calendar_date_fiscal a14 
on (a11.opened_on_key = a14.row_key) 
union
select 'ldb.d_calendar_time a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_calendar_time a15 
on (a11.opened_time_key = a15.row_key) 
union
select 'ldb.d_internal_organization_group a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_organization_group a16 
on (a11.assignment_group_key = a16.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_contact_assigned_to a17 
on (a11.assigned_to_key = a17.row_key) 
union
select 'ldb.dh_user_group_hierarchy a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_organization_group a16 
on (a11.assignment_group_key = a16.row_key) 
join ldb.dh_user_group_hierarchy a18 
on (a16.row_dn_key = a18.lev_0_key) 
union
select 'ldb.d_business_service a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_business_service a19 
on (a11.business_service_key = a19.row_key) 
union
select 'ldb.d_calendar_date a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_calendar_date a110 
on (a11.opened_on_key = a110.row_key) 
union
select 'ldb.d_configuration_item a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_configuration_item a111 
on (a11.configuration_item_key = a111.row_key) 
union
select 'ldb.d_internal_contact_director_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_ag_manager_role_vp_dir_ad_c a12 
on (a11.problem_assignment_group_key = a12.internal_organization_key) 
join ldb.d_internal_contact_director_c a112 
on (a12.director_key = a112.row_key) 
union
select 'ldb.d_calendar_month a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_calendar_date a110 
on (a11.opened_on_key = a110.row_key) 
join ldb.d_calendar_month a113 
on (a110.month_start_date_key = a113.row_key) 
union
select 'ldb.d_calendar_quarter a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_calendar_date a110 
on (a11.opened_on_key = a110.row_key) 
join ldb.d_calendar_quarter a114 
on (a110.quarter_start_date_key = a114.row_key) 
union
select 'ldb.d_calendar_week a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_calendar_date a110 
on (a11.opened_on_key = a110.row_key) 
join ldb.d_calendar_week a115 
on (a110.week_start_date_key = a115.row_key) 
union
select 'ldb.d_calendar_year a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_calendar_date a110 
on (a11.opened_on_key = a110.row_key) 
join ldb.d_calendar_year a116 
on (a110.year_start_date_key = a116.row_key) 
union
select 'ldb.d_problem a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem a117 
on (a11.problem_key = a117.row_key) 
union
select 'ldb.d_location a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_location a118 
on (a11.location_key = a118.row_key) 
union
select 'ldb.d_business_service_parent_c a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_business_service a19 
on (a11.business_service_key = a19.row_key) 
join ldb.d_business_service_parent_c a119 
on (a19.parent_business_service_c_key = a119.row_key) 
union
select 'ldb.d_internal_contact_associate_director_c a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_ag_manager_role_vp_dir_ad_c a12 
on (a11.problem_assignment_group_key = a12.internal_organization_key) 
join ldb.d_internal_contact_associate_director_c a120 
on (a12.associate_director_key = a120.row_key) 
union
select 'ldb.d_change_request a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_change_request a121 
on (a11.change_request_key = a121.row_key) 
union
select 'ldb.d_internal_organization_department a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) 
join ldb.d_internal_organization_department a122 
on (a13.department_key = a122.row_key) 
union
select 'ldb.d_internal_contact_mdm a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) 
join ldb.d_internal_contact_mdm a123 
on (a13.row_current_key = a123.row_current_key) 
union
select 'ldb.d_calendar_fiscal_quarter a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_calendar_date_fiscal a14 
on (a11.opened_on_key = a14.row_key) 
join ldb.d_calendar_fiscal_quarter a124 
on (a14.quarter_start_date_key = a124.row_key) 
union
select 'ldb.d_calendar_time_hour a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_calendar_time a15 
on (a11.opened_time_key = a15.row_key) 
join ldb.d_calendar_time_hour a125 
on (a15.hour_24_format_num = a125.hour_24_format_num) 
union
select 'ldb.d_lov_problem_category_c a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_lov_problem_category_c a126 
on (a11.category_src_key = a126.row_key) 
union
select 'ldb.d_problem_reported_type a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem_reported_type a127 
on (a11.reported_type_src_key = a127.row_key) 
union
select 'ldb.d_problem_impact a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem_impact a128 
on (a11.impact_src_key = a128.row_key) 
union
select 'ldb.d_problem_priority a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem_priority a129 
on (a11.priority_src_key = a129.row_key) 
union
select 'ldb.d_configuration_item_problem_service_offering_c a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_configuration_item_problem_service_offering_c a130 
on (a11.service_offering_c_key = a130.row_key) 
union
select 'ldb.d_problem_urgency a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem_urgency a131 
on (a11.urgency_src_key = a131.row_key) 
union
select 'ldb.d_internal_contact_vp_c a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_ag_manager_role_vp_dir_ad_c a12 
on (a11.problem_assignment_group_key = a12.internal_organization_key) 
join ldb.d_internal_contact_vp_c a132 
on (a12.vp_key = a132.row_key) 
union
select 'ldb.d_location_assigned_to a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_contact_assigned_to a17 
on (a11.assigned_to_key = a17.row_key) 
join ldb.d_location_assigned_to a133 
on (a17.location_key = a133.row_key) 
union
select 'ldb.dh_user_group_level1 a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_organization_group a16 
on (a11.assignment_group_key = a16.row_key) join ldb.dh_user_group_hierarchy a18 
on (a16.row_dn_key = a18.lev_0_key) 
join ldb.dh_user_group_level1 a134 
on (a18.lev_1_key = a134.row_key) 
union
select 'ldb.d_business_service_criticality a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_business_service a19 
on (a11.business_service_key = a19.row_key) 
join ldb.d_business_service_criticality a135 
on (a19.criticality_key = a135.row_key) 
union
select 'ldb.d_business_service_used_for a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_business_service a19 
on (a11.business_service_key = a19.row_key) 
join ldb.d_business_service_used_for a136 
on (a19.used_for_src_key = a136.row_key) 
union
select 'ldb.d_calendar_fiscal_year a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_calendar_date_fiscal a14 
on (a11.opened_on_key = a14.row_key) 
join ldb.d_calendar_fiscal_year a137 
on (a14.year_start_date_key = a137.row_key) 
union
select 'ldb.d_lov_problem_root_cause_code_c a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem a117 
on (a11.problem_key = a117.row_key) 
join ldb.d_lov_problem_root_cause_code_c a138 
on (a117.root_cause_code_src_c_key = a138.row_key) 
union
select 'ldb.d_problem_state a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem a117 
on (a11.problem_key = a117.row_key) 
join ldb.d_problem_state a139 
on (a117.state_src_key = a139.row_key) 
union
select 'ldb.dh_user_group_level2 a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_organization_group a16 
on (a11.assignment_group_key = a16.row_key) join ldb.dh_user_group_hierarchy a18 
on (a16.row_dn_key = a18.lev_0_key) 
join ldb.dh_user_group_level2 a140 
on (a18.lev_2_key = a140.row_key) 
union
select 'ldb.d_business_service_grand_parent_c a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_business_service a19 
on (a11.business_service_key = a19.row_key) join ldb.d_business_service_parent_c a119 
on (a19.parent_business_service_c_key = a119.row_key) 
join ldb.d_business_service_grand_parent_c a141 
on (a119.parent_business_service_c_key = a141.row_key) 
union
select 'ldb.dh_user_group_level3 a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_organization_group a16 
on (a11.assignment_group_key = a16.row_key) join ldb.dh_user_group_hierarchy a18 
on (a16.row_dn_key = a18.lev_0_key) 
join ldb.dh_user_group_level3 a142 
on (a18.lev_3_key = a142.row_key) 
union
select 'ldb.dh_user_group_level4 a143 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_organization_group a16 
on (a11.assignment_group_key = a16.row_key) join ldb.dh_user_group_hierarchy a18 
on (a16.row_dn_key = a18.lev_0_key) 
join ldb.dh_user_group_level4 a143 
on (a18.lev_4_key = a143.row_key) 

