select 'ldb.f_problem a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
union
select 'ldb.d_problem a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a12
on (a11.problem_key = a12.row_key)
union
select 'ldb.d_internal_contact a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_internal_contact a13
on (a11.opened_by_key = a13.row_key)
union
select 'ldb.d_calendar_time a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_time a14
on (a11.opened_time_key = a14.row_key)
union
select 'ldb.d_incident a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_incident a15
on (a11.incident_key = a15.row_key)
union
select 'ldb.d_internal_contact_assigned_to a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_internal_contact_assigned_to a16
on (a11.assigned_to_key = a16.row_key)
union
select 'ldb.d_internal_organization_group a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_internal_organization_group a17
on (a11.assignment_group_key = a17.row_key)
union
select 'ldb.dh_user_group_hierarchy a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_internal_organization_group a17
on (a11.assignment_group_key = a17.row_key)
join ldb.dh_user_group_hierarchy a18
on (a17.row_dn_key = a18.lev_0_key)
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
select 'ldb.d_tribe_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_tribe_c a112
on (a11.tribe_c_key = a112.row_key)
union
select 'ldb.d_segment_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_tribe_c a112
on (a11.tribe_c_key = a112.row_key)
join ldb.d_segment_c a113
on (a112.segment_c_key = a113.row_key)
union
select 'ldb.d_change_request a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_change_request a114
on (a11.change_request_key = a114.row_key)
union
select 'ldb.d_internal_organization_department a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_internal_contact a13
on (a11.opened_by_key = a13.row_key)
join ldb.d_internal_organization_department a115
on (a13.department_key = a115.row_key)
union
select 'ldb.d_internal_contact_mdm a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_internal_contact a13
on (a11.opened_by_key = a13.row_key)
join ldb.d_internal_contact_mdm a116
on (a13.row_current_key = a116.row_current_key)
union
select 'ldb.d_calendar_time_hour a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_time a14
on (a11.opened_time_key = a14.row_key)
join ldb.d_calendar_time_hour a117
on (a14.hour_24_format_num = a117.hour_24_format_num)
union
select 'ldb.d_incident_priority a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_incident a15
on (a11.incident_key = a15.row_key)
join ldb.d_incident_priority a118
on (a15.priority_src_key = a118.row_key)
union
select 'ldb.d_lov_incident_status_c a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_incident a15
on (a11.incident_key = a15.row_key)
join ldb.d_lov_incident_status_c a119
on (a15.incident_status_c_key = a119.row_key)
union
select 'ldb.d_location a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_location a120
on (a11.location_key = a120.row_key)
union
select 'ldb.d_change_request_caused_by_number a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_change_request_caused_by_number a121
on (a11.u_caused_by_change_number_c_key = a121.row_key)
union
select 'ldb.d_problem_reported_type a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_reported_type a122
on (a11.reported_type_src_key = a122.row_key)
union
select 'ldb.d_problem_impact a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_impact a123
on (a11.impact_src_key = a123.row_key)
union
select 'ldb.d_problem_opened_by_c a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_opened_by_c a124
on (a11.opened_by_key = a124.row_key)
union
select 'ldb.d_problem_priority a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_priority a125
on (a11.priority_src_key = a125.row_key)
union
select 'ldb.d_problem_urgency a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_urgency a126
on (a11.urgency_src_key = a126.row_key)
union
select 'ldb.d_lov_problem_status_c a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a12
on (a11.problem_key = a12.row_key)
join ldb.d_lov_problem_status_c a127
on (a12.status_src_c_key = a127.row_key)
union
select 'ldb.d_problem_affected_activity_c a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a12
on (a11.problem_key = a12.row_key)
join ldb.d_problem_affected_activity_c a128
on (a12.affected_activity_src_c_key = a128.row_key)
union
select 'ldb.d_location_assigned_to a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_internal_contact_assigned_to a16
on (a11.assigned_to_key = a16.row_key)
join ldb.d_location_assigned_to a129
on (a16.location_key = a129.row_key)
union
select 'ldb.dh_user_group_level1 a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_internal_organization_group a17
on (a11.assignment_group_key = a17.row_key) join ldb.dh_user_group_hierarchy a18
on (a17.row_dn_key = a18.lev_0_key)
join ldb.dh_user_group_level1 a130
on (a18.lev_1_key = a130.row_key)
union
select 'ldb.d_business_service_criticality a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_business_service a19
on (a11.business_service_key = a19.row_key)
join ldb.d_business_service_criticality a131
on (a19.criticality_key = a131.row_key)
union
select 'ldb.d_business_service_used_for a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_business_service a19
on (a11.business_service_key = a19.row_key)
join ldb.d_business_service_used_for a132
on (a19.used_for_src_key = a132.row_key)
union
select 'ldb.d_calendar_month a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_date a110
on (a11.opened_on_key = a110.row_key)
join ldb.d_calendar_month a133
on (a110.month_start_date_key = a133.row_key)
union
select 'ldb.d_calendar_week a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_date a110
on (a11.opened_on_key = a110.row_key)
join ldb.d_calendar_week a134
on (a110.week_start_date_key = a134.row_key)
union
select 'ldb.d_problem_detection_source_c a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a12
on (a11.problem_key = a12.row_key)
join ldb.d_problem_detection_source_c a135
on (a12.detection_source_src_c_key = a135.row_key)
union
select 'ldb.d_problem_state a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a12
on (a11.problem_key = a12.row_key)
join ldb.d_problem_state a136
on (a12.state_src_key = a136.row_key)
union
select 'ldb.d_internal_organization_group_rca_approval_group_c a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a12
on (a11.problem_key = a12.row_key)
join ldb.d_internal_organization_group_rca_approval_group_c a137
on (a12.rca_approval_group_problem_c_key = a137.row_key)
union
select 'ldb.d_problem_root_cause_codes_c a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a12
on (a11.problem_key = a12.row_key)
join ldb.d_problem_root_cause_codes_c a138
on (a12.root_cause_codes_src_c_key = a138.row_key)
union
select 'ldb.d_lov_problem_root_cause_sub_category_c a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a12
on (a11.problem_key = a12.row_key)
join ldb.d_lov_problem_root_cause_sub_category_c a139
on (a12.root_cause_sub_category_src_c_key = a139.row_key)
union
select 'ldb.d_parent_problem_c a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a12
on (a11.problem_key = a12.row_key)
join ldb.d_parent_problem_c a140
on (a12.parent_problem_c_key = a140.row_key)
union
select 'ldb.dh_user_group_level2 a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_internal_organization_group a17
on (a11.assignment_group_key = a17.row_key) join ldb.dh_user_group_hierarchy a18
on (a17.row_dn_key = a18.lev_0_key)
join ldb.dh_user_group_level2 a141
on (a18.lev_2_key = a141.row_key)
union
select 'ldb.d_calendar_quarter a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_date a110
on (a11.opened_on_key = a110.row_key)
join ldb.d_calendar_quarter a142
on (a110.quarter_start_date_key = a142.row_key)
union
select 'ldb.d_internal_contact_general_manager_c a143 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_tribe_c a112
on (a11.tribe_c_key = a112.row_key) join ldb.d_segment_c a113
on (a112.segment_c_key = a113.row_key)
join ldb.d_internal_contact_general_manager_c a143
on (a113.general_manager_c_key = a143.row_key)
union
select 'ldb.d_lov_segment_type_c a144 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_tribe_c a112
on (a11.tribe_c_key = a112.row_key)
 join ldb.d_segment_c a113
on (a112.segment_c_key = a113.row_key)
join ldb.d_lov_segment_type_c a144
on (a113.segment_type_c_key = a144.row_key)
union
select 'ldb.dh_user_group_level3 a145 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_internal_organization_group a17
on (a11.assignment_group_key = a17.row_key) join ldb.dh_user_group_hierarchy a18
on (a17.row_dn_key = a18.lev_0_key)
join ldb.dh_user_group_level3 a145
on (a18.lev_3_key = a145.row_key)
union
select 'ldb.d_calendar_year a146 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_date a110
on (a11.opened_on_key = a110.row_key)
join ldb.d_calendar_year a146
on (a110.year_start_date_key = a146.row_key)
union
select 'ldb.dh_user_group_level4 a147 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_internal_organization_group a17
on (a11.assignment_group_key = a17.row_key) join ldb.dh_user_group_hierarchy a18
on (a17.row_dn_key = a18.lev_0_key)
join ldb.dh_user_group_level4 a147
on (a18.lev_4_key = a147.row_key)
