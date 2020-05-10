select 'ldb.f_problem a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
union
select 'ldb.d_archer_application_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_archer_application_c a12
on (a11.application_archer_c_key = a12.row_key)
union
select 'ldb.d_software_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_software_c a13
on (a11.archer_id_c_key = a13.row_key)
union
select 'ldb.d_internal_contact a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_internal_contact a14
on (a11.opened_by_key = a14.row_key)
union
select 'ldb.d_calendar_time a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_time a15
on (a11.opened_time_key = a15.row_key)
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
select 'ldb.d_problem a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a111
on (a11.problem_key = a111.row_key)
union
select 'ldb.d_configuration_item a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_configuration_item a112
on (a11.configuration_item_key = a112.row_key)
union
select 'ldb.d_calendar_month a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_date a110
on (a11.opened_on_key = a110.row_key)
join ldb.d_calendar_month a113
on (a110.month_start_date_key = a113.row_key)
union
select 'ldb.d_problem_caused_by_change_c a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_caused_by_change_c a114
on (a11.caused_by_change_c_key = a114.row_key)
union
select 'ldb.d_change_request a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_change_request a115
on (a11.change_request_key = a115.row_key)
union
select 'ldb.d_internal_organization_department a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_internal_contact a14
on (a11.opened_by_key = a14.row_key)
join ldb.d_internal_organization_department a116
on (a14.department_key = a116.row_key)
union
select 'ldb.d_internal_contact_mdm a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_internal_contact a14
on (a11.opened_by_key = a14.row_key)
join ldb.d_internal_contact_mdm a117
on (a14.row_current_key = a117.row_current_key)
union
select 'ldb.d_calendar_time_hour a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_time a15
on (a11.opened_time_key = a15.row_key)
join ldb.d_calendar_time_hour a118
on (a15.hour_24_format_num = a118.hour_24_format_num)
union
select 'ldb.d_location a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_location a119
on (a11.location_key = a119.row_key)
union
select 'ldb.d_lov_problem_category_c a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_lov_problem_category_c a120
on (a11.category_src_key = a120.row_key)
union
select 'ldb.d_problem_reported_type a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_reported_type a121
on (a11.reported_type_src_key = a121.row_key)
union
select 'ldb.d_problem_impact a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_impact a122
on (a11.impact_src_key = a122.row_key)
union
select 'ldb.d_problem_impacted_channel_c a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_impacted_channel_c a123
on (a11.impacted_channel_c_key = a123.row_key)
union
select 'ldb.d_problem_priority a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_priority a124
on (a11.priority_src_key = a124.row_key)
union
select 'ldb.d_problem_urgency a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_urgency a125
on (a11.urgency_src_key = a125.row_key)
union
select 'ldb.d_problem_vendor_reference_c a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_vendor_reference_c a126
on (a11.vendor_reference_c_key = a126.row_key)
union
select 'ldb.d_location_assigned_to a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_internal_contact_assigned_to a16
on (a11.assigned_to_key = a16.row_key)
join ldb.d_location_assigned_to a127
on (a16.location_key = a127.row_key)
union
select 'ldb.dh_user_group_level1 a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_internal_organization_group a17
on (a11.assignment_group_key = a17.row_key) join ldb.dh_user_group_hierarchy a18
on (a17.row_dn_key = a18.lev_0_key)
join ldb.dh_user_group_level1 a128
on (a18.lev_1_key = a128.row_key)
union
select 'ldb.d_business_service_criticality a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_business_service a19
on (a11.business_service_key = a19.row_key)
join ldb.d_business_service_criticality a129
on (a19.criticality_key = a129.row_key)
union
select 'ldb.d_business_service_used_for a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_business_service a19
on (a11.business_service_key = a19.row_key)
join ldb.d_business_service_used_for a130
on (a19.used_for_src_key = a130.row_key)
union
select 'ldb.d_calendar_week a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_date a110
on (a11.opened_on_key = a110.row_key)
join ldb.d_calendar_week a131
on (a110.week_start_date_key = a131.row_key)
union
select 'ldb.d_lov_problem_cause_code_c a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a111
on (a11.problem_key = a111.row_key)
join ldb.d_lov_problem_cause_code_c a132
on (a111.cause_code_c_key = a132.row_key)
union
select 'ldb.d_lov_problem_close_code_c a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a111
on (a11.problem_key = a111.row_key)
join ldb.d_lov_problem_close_code_c a133
on (a111.close_code_c_key = a133.row_key)
union
select 'ldb.d_lov_problem_itlc_poc_c a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a111
on (a11.problem_key = a111.row_key)
join ldb.d_lov_problem_itlc_poc_c a134
on (a111.itlc_poc_c_key = a134.row_key)
union
select 'ldb.d_lov_problem_osi_layer_c a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a111
on (a11.problem_key = a111.row_key)
join ldb.d_lov_problem_osi_layer_c a135
on (a111.osi_layer_c_key = a135.row_key)
union
select 'ldb.d_problem_state a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a111
on (a11.problem_key = a111.row_key)
join ldb.d_problem_state a136
on (a111.state_src_key = a136.row_key)
union
select 'ldb.d_lov_problem_resolution_code_c a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a111
on (a11.problem_key = a111.row_key)
join ldb.d_lov_problem_resolution_code_c a137
on (a111.resolution_code_c_key = a137.row_key)
union
select 'ldb.d_lov_problem_sub_cause_code_c a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a111
on (a11.problem_key = a111.row_key)
join ldb.d_lov_problem_sub_cause_code_c a138
on (a111.sub_cause_code_c_key = a138.row_key)
union
select 'ldb.d_lov_problem_tertiary_cause_code_c a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a111
on (a11.problem_key = a111.row_key)
join ldb.d_lov_problem_tertiary_cause_code_c a139
on (a111.tertiary_cause_code_c_key = a139.row_key)
union
select 'ldb.dh_user_group_level2 a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_internal_organization_group a17
on (a11.assignment_group_key = a17.row_key) join ldb.dh_user_group_hierarchy a18
on (a17.row_dn_key = a18.lev_0_key)
join ldb.dh_user_group_level2 a140
on (a18.lev_2_key = a140.row_key)
union
select 'ldb.d_calendar_quarter a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_date a110
on (a11.opened_on_key = a110.row_key)
join ldb.d_calendar_quarter a141
on (a110.quarter_start_date_key = a141.row_key)
union
select 'ldb.dh_user_group_level3 a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_internal_organization_group a17
on (a11.assignment_group_key = a17.row_key) join ldb.dh_user_group_hierarchy a18
on (a17.row_dn_key = a18.lev_0_key)
join ldb.dh_user_group_level3 a142
on (a18.lev_3_key = a142.row_key)
union
select 'ldb.d_calendar_year a143 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_date a110
on (a11.opened_on_key = a110.row_key)
join ldb.d_calendar_year a143
on (a110.year_start_date_key = a143.row_key)
union
select 'ldb.dh_user_group_level4 a144 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_internal_organization_group a17
on (a11.assignment_group_key = a17.row_key) join ldb.dh_user_group_hierarchy a18
on (a17.row_dn_key = a18.lev_0_key)
join ldb.dh_user_group_level4 a144
on (a18.lev_4_key = a144.row_key)