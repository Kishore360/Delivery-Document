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
select 'ldb.d_problem a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a16
on (a11.problem_key = a16.row_key)
union
select 'ldb.d_internal_contact_assigned_to a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_internal_contact_assigned_to a17
on (a11.assigned_to_key = a17.row_key)
union
select 'ldb.d_internal_organization_group a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_internal_organization_group a18
on (a11.assignment_group_key = a18.row_key)
union
select 'ldb.d_business_service a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_business_service a19
on (a11.business_service_key = a19.row_key)
union
select 'ldb.d_calendar_date a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_date a110
on (a11.date_key = a110.row_key)
union
select 'ldb.d_calendar_month a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_date a110
on (a11.date_key = a110.row_key)
join ldb.d_calendar_month a111
on (a110.month_start_date_key = a111.row_key)
union
select 'ldb.d_calendar_quarter a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_date a110
on (a11.date_key = a110.row_key) join ldb.d_calendar_month a111
on (a110.month_start_date_key = a111.row_key)
join ldb.d_calendar_quarter a112
on (a111.quarter_start_date_key = a112.row_key)
union
select 'ldb.d_configuration_item_mdm a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_configuration_item a13
on (a11.configuration_item_key = a13.row_key)
join ldb.d_configuration_item_mdm a113
on (a13.mdm_key = a113.row_key)
union
select 'ldb.d_calendar_week a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_date a110
on (a11.date_key = a110.row_key)
join ldb.d_calendar_week a114
on (a110.week_start_date_key = a114.row_key)
union
select 'ldb.d_calendar_year a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_date a110
on (a11.date_key = a110.row_key) join ldb.d_calendar_month a111
on (a110.month_start_date_key = a111.row_key) join ldb.d_calendar_quarter a112
on (a111.quarter_start_date_key = a112.row_key)
join ldb.d_calendar_year a115
on (a112.year_start_date_key = a115.row_key)
union
select 'ldb.d_problem_assignment_group_c a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a16
on (a11.problem_key = a16.row_key)
join ldb.d_problem_assignment_group_c a116
on (a16.assignment_group_c_key = a116.row_key)
union
select 'ldb.d_problem_configuration_item_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a16
on (a11.problem_key = a16.row_key)
join ldb.d_problem_configuration_item_c a117
on (a16.configuration_item_c_key = a117.row_key)
union
select 'ldb.d_application_mdm a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_application a12
on (a11.application_key = a12.row_key)
join ldb.d_application_mdm a118
on (a12.mdm_key = a118.row_key)
union
select 'ldb.d_change_request a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_change_request a119
on (a11.change_request_key = a119.row_key)
union
select 'ldb.d_internal_organization_department a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_internal_contact a14
on (a11.employee_key = a14.row_key)
join ldb.d_internal_organization_department a120
on (a14.department_key = a120.row_key)
union
select 'ldb.d_internal_contact_mdm a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_internal_contact a14
on (a11.employee_key = a14.row_key)
join ldb.d_internal_contact_mdm a121
on (a14.employee_mdm_key = a121.row_key)
union
select 'ldb.d_calendar_time_hour a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_time a15
on (a11.time_key = a15.row_key)
join ldb.d_calendar_time_hour a122
on (a15.hour_key = a122.row_key)
union
select 'ldb.d_location a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_location a123
on (a11.location_key = a123.row_key)
union
select 'ldb.d_problem_reported_type a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_reported_type a124
on (a11.reported_type_src_key = a124.row_key)
union
select 'ldb.d_problem_impact a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_impact a125
on (a11.impact_src_key = a125.row_key)
union
select 'ldb.d_problem_oversight_contact_c a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_oversight_contact_c a126
on (a11.problem_oversight_contact_c_key = a126.row_key)
union
select 'ldb.d_problem_oversight_group_c a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_oversight_group_c a127
on (a11.problem_oversight_group_c_key = a127.row_key)
union
select 'ldb.d_problem_priority a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_priority a128
on (a11.priority_src_key = a128.row_key)
union
select 'ldb.d_problem_urgency a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_urgency a129
on (a11.urgency_src_key = a129.row_key)
union
select 'ldb.d_lov_problem_activity_flag_c a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a16
on (a11.problem_key = a16.row_key)
join ldb.d_lov_problem_activity_flag_c a130
on (a16.problem_activity_flag_c_key = a130.row_key)
union
select 'ldb.d_location_assigned_to a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_internal_contact_assigned_to a17
on (a11.assigned_to_key = a17.row_key)
join ldb.d_location_assigned_to a131
on (a17.location_key = a131.row_key)
union
select 'ldb.d_business_service_criticality a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_business_service a19
on (a11.business_service_key = a19.row_key)
join ldb.d_business_service_criticality a132
on (a19.criticality_key = a132.row_key)
union
select 'ldb.d_business_service_used_for a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_business_service a19
on (a11.business_service_key = a19.row_key)
join ldb.d_business_service_used_for a133
on (a19.used_for_src_key = a133.row_key)
union
select 'ldb.d_lov_problem_meeting_status_c a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a16
on (a11.problem_key = a16.row_key)
join ldb.d_lov_problem_meeting_status_c a134
on (a16.problem_meeting_status_c_key = a134.row_key)
union
select 'ldb.d_lov_problem_oversight_action_c a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a16
on (a11.problem_key = a16.row_key)
join ldb.d_lov_problem_oversight_action_c a135
on (a16.problem_oversight_action_c_key = a135.row_key)
union
select 'ldb.d_lov_problem_phase_c a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a16
on (a11.problem_key = a16.row_key)
join ldb.d_lov_problem_phase_c a136
on (a16.problem_phase_c_key = a136.row_key)
union
select 'ldb.d_problem_state a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a16
on (a11.problem_key = a16.row_key)
join ldb.d_problem_state a137
on (a16.state_src_key = a137.row_key)
union
select 'ldb.d_lov_problem_root_cause_c a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a16
on (a11.problem_key = a16.row_key)
join ldb.d_lov_problem_root_cause_c a138
on (a16.problem_root_cause_code_c_key = a138.row_key)
union
select 'ldb.d_lov_problem_secondary_root_cause_c a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a16
on (a11.problem_key = a16.row_key)
join ldb.d_lov_problem_secondary_root_cause_c a139
on (a16.problem_secondary_root_cause_c_key = a139.row_key)