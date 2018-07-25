select 'ldb.f_problem a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
union
select 'ldb.d_calendar_time a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_calendar_time a13 
on (a11.opened_time_key = a13.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_contact_assigned_to a14 
on (a11.assigned_to_key = a14.row_key) 
union
select 'ldb.d_internal_organization_group a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) 
union
select 'ldb.dh_user_group_hierarchy a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) 
join ldb.dh_user_group_hierarchy a16 
on (a15.row_dn_key = a16.lev_0_key) 
union
select 'ldb.d_business_service a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_business_service a17 
on (a11.business_service_key = a17.row_key) 
union
select 'ldb.d_calendar_date a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_calendar_date a18 
on (a11.opened_on_key = a18.row_key) 
union
select 'ldb.d_configuration_item a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_configuration_item a19 
on (a11.configuration_item_key = a19.row_key) 
union
select 'ldb.d_problem a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem a110 
on (a11.problem_key = a110.row_key) 
union
select 'ldb.d_problem_parent_task_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem_parent_task_c a111 
on (a11.parent_task_c_key = a111.row_key) 
union
select 'ldb.d_internal_contact_root_cause_owner_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_contact_root_cause_owner_c a112 
on (a11.root_cause_owner_c_key = a112.row_key) 
union
select 'ldb.d_change_request a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_change_request a113 
on (a11.change_request_key = a113.row_key) 
union
select 'ldb.d_internal_organization_department a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_organization_department a114 
on (a11.opened_by_department_key = a114.row_key) 
union
select 'ldb.d_internal_contact_mdm a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
join ldb.d_internal_contact_mdm a115 
on (a12.row_current_key = a115.row_current_key) 
union
select 'ldb.d_calendar_time_hour a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_calendar_time a13 
on (a11.opened_time_key = a13.row_key) 
join ldb.d_calendar_time_hour a116 
on (a13.hour_24_format_num = a116.hour_24_format_num) 
union
select 'ldb.d_lov_problem_category_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_lov_problem_category_c a117 
on (a11.problem_category_src_c_key = a117.row_key) 
union
select 'ldb.d_problem_impact a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem_impact a118 
on (a11.impact_src_key = a118.row_key) 
union
select 'ldb.d_internal_contact_problem_opened_by_c a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_contact_problem_opened_by_c a119 
on (a11.opened_by_key = a119.row_key) 
union
select 'ldb.d_problem_priority a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem_priority a120 
on (a11.priority_src_key = a120.row_key) 
union
select 'ldb.d_problem_reported_type a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem_reported_type a121 
on (a11.reported_type_src_key = a121.row_key) 
union
select 'ldb.d_lov_problem_source_c a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_lov_problem_source_c a122 
on (a11.problem_source_src_c_key = a122.row_key) 
union
select 'ldb.d_problem_state a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem_state a123 
on (a11.state_src_key = a123.row_key) 
union
select 'ldb.d_problem_urgency a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem_urgency a124 
on (a11.urgency_src_key = a124.row_key) 
union
select 'ldb.d_internal_contact_validated_by_c a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_contact_validated_by_c a125 
on (a11.validated_by_c_key = a125.row_key) 
union
select 'ldb.d_location a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_location a126 
on (a11.location_key = a126.row_key) 
union
select 'ldb.d_location_assigned_to a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_contact_assigned_to a14 
on (a11.assigned_to_key = a14.row_key) 
join ldb.d_location_assigned_to a127 
on (a14.location_key = a127.row_key) 
union
select 'ldb.dh_user_group_level1 a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) join ldb.dh_user_group_hierarchy a16 
on (a15.row_dn_key = a16.lev_0_key) 
join ldb.dh_user_group_level1 a128 
on (a16.lev_1_key = a128.row_key) 
union
select 'ldb.d_business_service_criticality a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_business_service a17 
on (a11.business_service_key = a17.row_key) 
join ldb.d_business_service_criticality a129 
on (a17.criticality_key = a129.row_key) 
union
select 'ldb.d_business_service_used_for a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_business_service a17 
on (a11.business_service_key = a17.row_key) 
join ldb.d_business_service_used_for a130 
on (a17.used_for_src_key = a130.row_key) 
union
select 'ldb.d_lov_problem_root_cause_category_c a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem a110 
on (a11.problem_key = a110.row_key) 
join ldb.d_lov_problem_root_cause_category_c a131 
on (a110.root_cause_category_src_c_key = a131.row_key) 
union
select 'ldb.d_internal_contact_executive_c a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_contact_root_cause_owner_c a112 
on (a11.root_cause_owner_c_key = a112.row_key) 
join ldb.d_internal_contact_executive_c a132 
on (a112.executive_c_key = a132.row_key) 
union
select 'ldb.d_internal_contact_manager_c a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_contact_root_cause_owner_c a112 
on (a11.root_cause_owner_c_key = a112.row_key) 
join ldb.d_internal_contact_manager_c a133 
on (a112.manager_c_key = a133.row_key) 
union
select 'ldb.dh_user_group_level2 a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) join ldb.dh_user_group_hierarchy a16 
on (a15.row_dn_key = a16.lev_0_key) 
join ldb.dh_user_group_level2 a134 
on (a16.lev_2_key = a134.row_key) 
union
select 'ldb.d_calendar_month a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_calendar_date a18 
on (a11.opened_on_key = a18.row_key) 
join ldb.d_calendar_month a135 
on (a18.month_start_date_key = a135.row_key) 
union
select 'ldb.d_calendar_week a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_calendar_date a18 
on (a11.opened_on_key = a18.row_key) 
join ldb.d_calendar_week a136 
on (a18.week_start_date_key = a136.row_key) 
union
select 'ldb.dh_user_group_level3 a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) join ldb.dh_user_group_hierarchy a16 
on (a15.row_dn_key = a16.lev_0_key) 
join ldb.dh_user_group_level3 a137 
on (a16.lev_3_key = a137.row_key) 
union
select 'ldb.dh_user_group_level4 a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) join ldb.dh_user_group_hierarchy a16 
on (a15.row_dn_key = a16.lev_0_key) 
join ldb.dh_user_group_level4 a138 
on (a16.lev_4_key = a138.row_key) 
union
select 'ldb.dh_user_group_level5 a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_organization_group a15 
on (a11.assignment_group_key = a15.row_key) join ldb.dh_user_group_hierarchy a16 
on (a15.row_dn_key = a16.lev_0_key) 
join ldb.dh_user_group_level5 a139 
on (a16.lev_5_key = a139.row_key) 
union
select 'ldb.d_calendar_quarter a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_calendar_date a18 
on (a11.opened_on_key = a18.row_key) 
join ldb.d_calendar_quarter a140 
on (a18.quarter_start_date_key = a140.row_key) 
union
select 'ldb.d_calendar_year a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_calendar_date a18 
on (a11.opened_on_key = a18.row_key) 
join ldb.d_calendar_year a141 
on (a18.year_start_date_key = a141.row_key) 
