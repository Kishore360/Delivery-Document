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
select 'ldb.d_problem a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem a14 
on (a11.problem_key = a14.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_contact_assigned_to a15 
on (a11.assigned_to_key = a15.row_key) 
union
select 'ldb.d_internal_organization_group a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_organization_group a16 
on (a11.assignment_group_key = a16.row_key) 
union
select 'ldb.dh_user_group_hierarchy a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_organization_group a16 
on (a11.assignment_group_key = a16.row_key) 
join ldb.dh_user_group_hierarchy a17 
on (a16.row_dn_key = a17.lev_0_key) 
union
select 'ldb.d_business_service a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_business_service a18 
on (a11.business_service_key = a18.row_key) 
union
select 'ldb.d_calendar_date a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_calendar_date a19 
on (a11.opened_on_key = a19.row_key) 
union
select 'ldb.d_configuration_item a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_configuration_item a110 
on (a11.configuration_item_key = a110.row_key) 
union
select 'ldb.d_tribe_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_tribe_c a111 
on (a11.tribe_c_key = a111.row_key) 
union
select 'ldb.d_segment_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_tribe_c a111 
on (a11.tribe_c_key = a111.row_key) 
join ldb.d_segment_c a112 
on (a111.segment_c_key = a112.row_key) 
union
select 'ldb.d_change_request a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_change_request a113 
on (a11.change_request_key = a113.row_key) 
union
select 'ldb.d_internal_organization_department a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
join ldb.d_internal_organization_department a114 
on (a12.department_key = a114.row_key) 
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
select 'ldb.d_location a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_location a117 
on (a11.location_key = a117.row_key) 
union
select 'ldb.d_problem_reported_type a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem_reported_type a118 
on (a11.reported_type_src_key = a118.row_key) 
union
select 'ldb.d_problem_impact a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem_impact a119 
on (a11.impact_src_key = a119.row_key) 
union
select 'ldb.d_problem_priority a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem_priority a120 
on (a11.priority_src_key = a120.row_key) 
union
select 'ldb.d_problem_urgency a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem_urgency a121 
on (a11.urgency_src_key = a121.row_key) 
union
select 'ldb.d_incident a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_incident a122 
on (a11.incident_key = a122.row_key) 
union
select 'ldb.d_problem_affected_activity_c a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem a14 
on (a11.problem_key = a14.row_key) 
join ldb.d_problem_affected_activity_c a123 
on (a14.affected_activity_src_c_key = a123.row_key) 
union
select 'ldb.d_location_assigned_to a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_contact_assigned_to a15 
on (a11.assigned_to_key = a15.row_key) 
join ldb.d_location_assigned_to a124 
on (a15.location_key = a124.row_key) 
union
select 'ldb.dh_user_group_level1 a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_organization_group a16 
on (a11.assignment_group_key = a16.row_key) join ldb.dh_user_group_hierarchy a17 
on (a16.row_dn_key = a17.lev_0_key) 
join ldb.dh_user_group_level1 a125 
on (a17.lev_1_key = a125.row_key) 
union
select 'ldb.d_business_service_criticality a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_business_service a18 
on (a11.business_service_key = a18.row_key) 
join ldb.d_business_service_criticality a126 
on (a18.criticality_key = a126.row_key) 
union
select 'ldb.d_business_service_used_for a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_business_service a18 
on (a11.business_service_key = a18.row_key) 
join ldb.d_business_service_used_for a127 
on (a18.used_for_src_key = a127.row_key) 
union
select 'ldb.d_calendar_month a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_calendar_date a19 
on (a11.opened_on_key = a19.row_key) 
join ldb.d_calendar_month a128 
on (a19.month_start_date_key = a128.row_key) 
union
select 'ldb.d_calendar_week a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_calendar_date a19 
on (a11.opened_on_key = a19.row_key) 
join ldb.d_calendar_week a129 
on (a19.week_start_date_key = a129.row_key) 
union
select 'ldb.d_problem_detection_source_c a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem a14 
on (a11.problem_key = a14.row_key) 
join ldb.d_problem_detection_source_c a130 
on (a14.detection_source_src_c_key = a130.row_key) 
union
select 'ldb.d_problem_state a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem a14 
on (a11.problem_key = a14.row_key) 
join ldb.d_problem_state a131 
on (a14.state_src_key = a131.row_key) 
union
select 'ldb.d_problem_root_cause_codes_c a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_problem a14 
on (a11.problem_key = a14.row_key) 
join ldb.d_problem_root_cause_codes_c a132 
on (a14.root_cause_codes_src_c_key = a132.row_key) 
union
select 'ldb.dh_user_group_level2 a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_organization_group a16 
on (a11.assignment_group_key = a16.row_key) join ldb.dh_user_group_hierarchy a17 
on (a16.row_dn_key = a17.lev_0_key) 
join ldb.dh_user_group_level2 a133 
on (a17.lev_2_key = a133.row_key) 
union
select 'ldb.d_calendar_quarter a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_calendar_date a19 
on (a11.opened_on_key = a19.row_key) 
join ldb.d_calendar_quarter a134 
on (a19.quarter_start_date_key = a134.row_key) 
union
select 'ldb.d_internal_contact_general_manager_c a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_tribe_c a111 
on (a11.tribe_c_key = a111.row_key) join ldb.d_segment_c a112 
on (a111.segment_c_key = a112.row_key) 
join ldb.d_internal_contact_general_manager_c a135 
on (a112.general_manager_c_key = a135.row_key) 
union
select 'ldb.dh_user_group_level3 a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_organization_group a16 
on (a11.assignment_group_key = a16.row_key) join ldb.dh_user_group_hierarchy a17 
on (a16.row_dn_key = a17.lev_0_key) 
join ldb.dh_user_group_level3 a136 
on (a17.lev_3_key = a136.row_key) 
union
select 'ldb.d_calendar_year a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_calendar_date a19 
on (a11.opened_on_key = a19.row_key) 
join ldb.d_calendar_year a137 
on (a19.year_start_date_key = a137.row_key) 
union
select 'ldb.dh_user_group_level4 a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_internal_organization_group a16 
on (a11.assignment_group_key = a16.row_key) join ldb.dh_user_group_hierarchy a17 
on (a16.row_dn_key = a17.lev_0_key) 
join ldb.dh_user_group_level4 a138 
on (a17.lev_4_key = a138.row_key) 


