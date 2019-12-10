select 'ldb.f_problem a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
union
select 'ldb.d_application a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_application a12
on (a11.application_key = a12.row_key)
union
select 'ldb.d_configuration_item a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_configuration_item a13
on (a11.configuration_item_key = a13.row_key)
union
select 'ldb.d_internal_contact a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_internal_contact a14
on (a11.employee_key = a14.row_key)
union
select 'ldb.d_calendar_time a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_time a15
on (a11.time_key = a15.row_key)
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
select 'ldb.d_business_service a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_business_service a18
on (a11.business_service_key = a18.row_key)
union
select 'ldb.d_calendar_date a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_date a19
on (a11.date_key = a19.row_key)
union
select 'ldb.d_calendar_month a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_date a19
on (a11.date_key = a19.row_key)
join ldb.d_calendar_month a110
on (a19.month_start_date_key = a110.row_key)
union
select 'ldb.d_calendar_quarter a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_date a19
on (a11.date_key = a19.row_key) join ldb.d_calendar_month a110
on (a19.month_start_date_key = a110.row_key)
join ldb.d_calendar_quarter a111
on (a110.quarter_start_date_key = a111.row_key)
union
select 'ldb.d_configuration_item_mdm a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_configuration_item a13
on (a11.configuration_item_key = a13.row_key)
join ldb.d_configuration_item_mdm a112
on (a13.mdm_key = a112.row_key)
union
select 'ldb.d_problem a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a113
on (a11.problem_key = a113.row_key)
union
select 'ldb.d_application_mdm a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_application a12
on (a11.application_key = a12.row_key)
join ldb.d_application_mdm a114
on (a12.mdm_key = a114.row_key)
union
select 'ldb.d_change_request a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_change_request a115
on (a11.change_request_key = a115.row_key)
union
select 'ldb.d_internal_organization_department a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_internal_contact a14
on (a11.employee_key = a14.row_key)
join ldb.d_internal_organization_department a116
on (a14.department_key = a116.row_key)
union
select 'ldb.d_internal_contact_mdm a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_internal_contact a14
on (a11.employee_key = a14.row_key)
join ldb.d_internal_contact_mdm a117
on (a14.employee_mdm_key = a117.row_key)
union
select 'ldb.d_calendar_time_hour a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_time a15
on (a11.time_key = a15.row_key)
join ldb.d_calendar_time_hour a118
on (a15.hour_key = a118.row_key)
union
select 'ldb.d_location a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_location a119
on (a11.location_key = a119.row_key)
union
select 'ldb.d_problem_reported_type a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_reported_type a120
on (a11.reported_type_src_key = a120.row_key)
union
select 'ldb.d_problem_impact a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_impact a121
on (a11.impact_src_key = a121.row_key)
union
select 'ldb.d_problem_owner_c a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_owner_c a122
on (a11.u_problem_owner_c_key = a122.row_key)
union
select 'ldb.d_problem_owner_group_c a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_owner_group_c a123
on (a11.problem_owner_group_c_key = a123.row_key)
union
select 'ldb.d_problem_priority a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_priority a124
on (a11.priority_src_key = a124.row_key)
union
select 'ldb.d_problem_rca_accepted_by_c a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_rca_accepted_by_c a125
on (a11.u_rca_accepted_by_c_key = a125.row_key)
union
select 'ldb.d_problem_rca_completed_by_c a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_rca_completed_by_c a126
on (a11.u_rca_completed_by_c_key = a126.row_key)
union
select 'ldb.d_problem_solved_by_c a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_solved_by_c a127
on (a11.u_solved_by_c_key = a127.row_key)
union
select 'ldb.d_problem_urgency a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_urgency a128
on (a11.urgency_src_key = a128.row_key)
union
select 'ldb.d_problem_vendor_c a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_vendor_c a129
on (a11.u_vendor_c_key = a129.row_key)
union
select 'ldb.d_problem_incident_c a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_incident_c a130
on (a11.problem_incident_c_key = a130.row_key)
union
select 'ldb.d_problem_manager_c a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_manager_c a131
on (a11.u_problem_manager_c_key = a131.row_key)
union
select 'ldb.d_problem_manager_group_c a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_manager_group_c a132
on (a11.problem_manager_group_c_key = a132.row_key)
union
select 'ldb.d_location_assigned_to a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_internal_contact_assigned_to a16
on (a11.assigned_to_key = a16.row_key)
join ldb.d_location_assigned_to a133
on (a16.location_key = a133.row_key)
union
select 'ldb.d_business_service_criticality a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_business_service a18
on (a11.business_service_key = a18.row_key)
join ldb.d_business_service_criticality a134
on (a18.criticality_key = a134.row_key)
union
select 'ldb.d_business_service_used_for a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_business_service a18
on (a11.business_service_key = a18.row_key)
join ldb.d_business_service_used_for a135
on (a18.used_for_src_key = a135.row_key)
union
select 'ldb.d_calendar_week a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_date a19
on (a11.date_key = a19.row_key)
join ldb.d_calendar_week a136
on (a19.week_start_date_key = a136.row_key)
union
select 'ldb.d_lov_problem_category_c a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a113
on (a11.problem_key = a113.row_key)
join ldb.d_lov_problem_category_c a137
on (a113.problem_category_c_key = a137.row_key)
union
select 'ldb.d_lov_problem_close_code_c a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a113
on (a11.problem_key = a113.row_key)
join ldb.d_lov_problem_close_code_c a138
on (a113.problem_close_code_c_key = a138.row_key)
union
select 'ldb.d_lov_problem_root_cause_code_level1_c a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a113
on (a11.problem_key = a113.row_key)
join ldb.d_lov_problem_root_cause_code_level1_c a139
on (a113.problem_root_cause_code_level_1_c_key = a139.row_key)
union
select 'ldb.d_lov_problem_root_cause_code_level2_c a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a113
on (a11.problem_key = a113.row_key)
join ldb.d_lov_problem_root_cause_code_level2_c a140
on (a113.problem_root_cause_code_level_2_c_key = a140.row_key)
union
select 'ldb.d_problem_state a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a113
on (a11.problem_key = a113.row_key)
join ldb.d_problem_state a141
on (a113.state_src_key = a141.row_key)
union
select 'ldb.d_lov_problem_subcategory_c a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a113
on (a11.problem_key = a113.row_key)
join ldb.d_lov_problem_subcategory_c a142
on (a113.problem_subcategory_src_c_key = a142.row_key)
union
select 'ldb.d_lov_problem_type_c a143 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a113
on (a11.problem_key = a113.row_key)
join ldb.d_lov_problem_type_c a143
on (a113.problem_type_c_key = a143.row_key)
union
select 'ldb.d_service_prb_owner_group_c a144 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_business_service a18
on (a11.business_service_key = a18.row_key)
join ldb.d_service_prb_owner_group_c a144
on (a18.service_prb_owner_group_c_key = a144.row_key)
union
select 'ldb.d_calendar_year a145 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_date a19
on (a11.date_key = a19.row_key) join ldb.d_calendar_month a110
on (a19.month_start_date_key = a110.row_key) join ldb.d_calendar_quarter a111
on (a110.quarter_start_date_key = a111.row_key)
join ldb.d_calendar_year a145
on (a111.year_start_date_key = a145.row_key)