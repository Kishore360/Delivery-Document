select 'ldb.f_problem a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
union
select 'ldb.d_configuration_item a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
union
select 'ldb.d_internal_contact a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_internal_contact a13
on (a11.employee_key = a13.row_key)
union
select 'ldb.d_calendar_time a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_time a14
on (a11.time_key = a14.row_key)
union
select 'ldb.d_incident a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_incident a15
on (a11.incident_key = a15.row_key)
union
select 'ldb.d_problem_time a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_time a16
on (a11.problem_time_key = a16.row_key)
union
select 'ldb.d_problem_employee a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_employee a17
on (a11.problem_employee_key = a17.row_key)
union
select 'ldb.d_problem a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a18
on (a11.problem_key = a18.row_key)
union
select 'ldb.d_internal_contact_assigned_to a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_internal_contact_assigned_to a19
on (a11.assigned_to_key = a19.row_key)
union
select 'ldb.d_internal_organization_group a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_internal_organization_group a110
on (a11.assignment_group_key = a110.row_key)
union
select 'ldb.d_business_service a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_business_service a111
on (a11.business_service_key = a111.row_key)
union
select 'ldb.d_calendar_date a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_date a112
on (a11.date_key = a112.row_key)
union
select 'ldb.d_calendar_month a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_date a112
on (a11.date_key = a112.row_key)
join ldb.d_calendar_month a113
on (a112.month_start_date_key = a113.row_key)
union
select 'ldb.d_calendar_quarter a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_date a112
on (a11.date_key = a112.row_key) join ldb.d_calendar_month a113
on (a112.month_start_date_key = a113.row_key)
join ldb.d_calendar_quarter a114
on (a113.quarter_start_date_key = a114.row_key)
union
select 'ldb.d_configuration_item_mdm a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_configuration_item_mdm a115
on (a12.mdm_key = a115.row_key)
union
select 'ldb.d_problem_internal_contact_assigned_to a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a18
on (a11.problem_key = a18.row_key)
join ldb.d_problem_internal_contact_assigned_to a116
on (a18.assigned_to_key = a116.row_key)
union
select 'ldb.d_problem_assignment_group a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a18
on (a11.problem_key = a18.row_key)
join ldb.d_problem_assignment_group a117
on (a18.assignment_group_key = a117.row_key)
union
select 'ldb.d_problem_business_service a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a18
on (a11.problem_key = a18.row_key)
join ldb.d_problem_business_service a118
on (a18.business_service_key = a118.row_key)
union
select 'ldb.d_problem_date a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_date a119
on (a11.problem_date_key = a119.row_key)
union
select 'ldb.d_problem_calendar_month a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_date a119
on (a11.problem_date_key = a119.row_key)
join ldb.d_problem_calendar_month a120
on (a119.month_start_date_key = a120.row_key)
union
select 'ldb.d_problem_calendar_quarter a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_date a119
on (a11.problem_date_key = a119.row_key) join ldb.d_problem_calendar_month a120
on (a119.month_start_date_key = a120.row_key)
join ldb.d_problem_calendar_quarter a121
on (a120.quarter_start_date_key = a121.row_key)
union
select 'ldb.d_problem_configuration_item a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a18
on (a11.problem_key = a18.row_key)
join ldb.d_problem_configuration_item a122
on (a18.configuration_item_key = a122.row_key)
union
select 'ldb.d_problem_configuration_item_mdm a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a18
on (a11.problem_key = a18.row_key) join ldb.d_problem_configuration_item a122
on (a18.configuration_item_key = a122.row_key)
join ldb.d_problem_configuration_item_mdm a123
on (a122.mdm_key = a123.row_key)
union
select 'ldb.d_rca_incident_c a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a18
on (a11.problem_key = a18.row_key)
join ldb.d_rca_incident_c a124
on (a18.rca_incident_c1_key = a124.row_key)
union
select 'ldb.d_segment_c a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_segment_c a125
on (a11.segment_c_key = a125.row_key)
union
select 'ldb.d_change_request a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_change_request a126
on (a11.change_request_key = a126.row_key)
union
select 'ldb.d_internal_organization_department a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_internal_contact a13
on (a11.employee_key = a13.row_key)
join ldb.d_internal_organization_department a127
on (a13.department_key = a127.row_key)
union
select 'ldb.d_internal_contact_mdm a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_internal_contact a13
on (a11.employee_key = a13.row_key)
join ldb.d_internal_contact_mdm a128
on (a13.employee_mdm_key = a128.row_key)
union
select 'ldb.d_calendar_time_hour a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_time a14
on (a11.time_key = a14.row_key)
join ldb.d_calendar_time_hour a129
on (a14.hour_key = a129.row_key)
union
select 'ldb.d_incident_priority a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_incident a15
on (a11.incident_key = a15.row_key)
join ldb.d_incident_priority a130
on (a15.priority_src_key = a130.row_key)
union
select 'ldb.d_lov_incident_status_c a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_incident a15
on (a11.incident_key = a15.row_key)
join ldb.d_lov_incident_status_c a131
on (a15.incident_status_c_key = a131.row_key)
union
select 'ldb.d_location a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_location a132
on (a11.location_key = a132.row_key)
union
select 'ldb.d_problem_calendar_hour a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_time a16
on (a11.problem_time_key = a16.row_key)
join ldb.d_problem_calendar_hour a133
on (a16.hour_key = a133.row_key)
union
select 'ldb.d_problem_reported_type a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_reported_type a134
on (a11.reported_type_src_key = a134.row_key)
union
select 'ldb.d_problem_department a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_employee a17
on (a11.problem_employee_key = a17.row_key)
join ldb.d_problem_department a135
on (a17.department_key = a135.row_key)
union
select 'ldb.d_problem_employee_mdm a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_employee a17
on (a11.problem_employee_key = a17.row_key)
join ldb.d_problem_employee_mdm a136
on (a17.employee_mdm_key = a136.row_key)
union
select 'ldb.d_problem_impact a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_impact a137
on (a11.impact_src_key = a137.row_key)
union
select 'ldb.d_problem_opened_by_c a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_opened_by_c a138
on (a11.opened_by_key = a138.row_key)
union
select 'ldb.d_problem_priority a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_priority a139
on (a11.priority_src_key = a139.row_key)
union
select 'ldb.d_problem_urgency a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_urgency a140
on (a11.urgency_src_key = a140.row_key)
union
select 'ldb.d_problem_affected_activity_c a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a18
on (a11.problem_key = a18.row_key)
join ldb.d_problem_affected_activity_c a141
on (a18.affected_activity_src_c_key = a141.row_key)
union
select 'ldb.d_location_assigned_to a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_internal_contact_assigned_to a19
on (a11.assigned_to_key = a19.row_key)
join ldb.d_location_assigned_to a142
on (a19.location_key = a142.row_key)
union
select 'ldb.d_business_service_criticality a143 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_business_service a111
on (a11.business_service_key = a111.row_key)
join ldb.d_business_service_criticality a143
on (a111.criticality_key = a143.row_key)
union
select 'ldb.d_business_service_used_for a144 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_business_service a111
on (a11.business_service_key = a111.row_key)
join ldb.d_business_service_used_for a144
on (a111.used_for_src_key = a144.row_key)
union
select 'ldb.d_calendar_week a145 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_date a112
on (a11.date_key = a112.row_key)
join ldb.d_calendar_week a145
on (a112.week_start_date_key = a145.row_key)
union
select 'ldb.d_lov_problem_detection_source_c a146 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a18
on (a11.problem_key = a18.row_key)
join ldb.d_lov_problem_detection_source_c a146
on (a18.detection_source_src_c_key = a146.row_key)
union
select 'ldb.d_problem_calendar_week a147 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_date a119
on (a11.problem_date_key = a119.row_key)
join ldb.d_problem_calendar_week a147
on (a119.week_start_date_key = a147.row_key)
union
select 'ldb.d_change_request_caused_by_number a148 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a18
on (a11.problem_key = a18.row_key)
join ldb.d_change_request_caused_by_number a148
on (a18.u_caused_by_change_number_c_key = a148.row_key)
union
select 'ldb.d_problem_location a149 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a18
on (a11.problem_key = a18.row_key)
join ldb.d_problem_location a149
on (a18.location_key = a149.row_key)
union
select 'ldb.d_problem_state a150 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a18
on (a11.problem_key = a18.row_key)
join ldb.d_problem_state a150
on (a18.state_src_key = a150.row_key)
union
select 'ldb.d_lov_problem_status_c a151 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a18
on (a11.problem_key = a18.row_key)
join ldb.d_lov_problem_status_c a151
on (a18.status_src_c_key = a151.row_key)
union
select 'ldb.d_internal_organization_group_rca_approval_group_c a152 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a18
on (a11.problem_key = a18.row_key)
join ldb.d_internal_organization_group_rca_approval_group_c a152
on (a18.rca_approval_group_problem_c_key = a152.row_key)
union
select 'ldb.d_problem_root_cause_codes_c a153 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a18
on (a11.problem_key = a18.row_key)
join ldb.d_problem_root_cause_codes_c a153
on (a18.root_cause_codes_src_c_key = a153.row_key)
union
select 'ldb.d_lov_problem_root_cause_sub_category_c a154 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a18
on (a11.problem_key = a18.row_key)
join ldb.d_lov_problem_root_cause_sub_category_c a154
on (a18.root_cause_sub_category_src_c_key = a154.row_key)
union
select 'ldb.d_internal_contact_general_manager_c a155 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_segment_c a125
on (a11.segment_c_key = a125.row_key)
join ldb.d_internal_contact_general_manager_c a155
on (a125.general_manager_c_key = a155.row_key)
union
select 'ldb.d_lov_segment_type_c a156 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_segment_c a125
on (a11.segment_c_key = a125.row_key)
join ldb.d_lov_segment_type_c a156
on (a125.segment_type_c_key = a156.row_key)
union
select 'ldb.d_parent_problem_c a157 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a18
on (a11.problem_key = a18.row_key)
join ldb.d_parent_problem_c a157
on (a18.parent_problem_c_key = a157.row_key)
union
select 'ldb.d_problem_assigned_to_location a158 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a18
on (a11.problem_key = a18.row_key) join ldb.d_problem_internal_contact_assigned_to a116
on (a18.assigned_to_key = a116.row_key)
join ldb.d_problem_assigned_to_location a158
on (a116.location_key = a158.row_key)
union
select 'ldb.d_problem_business_service_criticality a159 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a18
on (a11.problem_key = a18.row_key) join ldb.d_problem_business_service a118
on (a18.business_service_key = a118.row_key)
join ldb.d_problem_business_service_criticality a159
on (a118.criticality_key = a159.row_key)
union
select 'ldb.d_problem_business_service_used_for a160 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a18
on (a11.problem_key = a18.row_key) join ldb.d_problem_business_service a118
on (a18.business_service_key = a118.row_key)
join ldb.d_problem_business_service_used_for a160
on (a118.used_for_src_key = a160.row_key)
union
select 'ldb.d_problem_tribe_c a161 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a18
on (a11.problem_key = a18.row_key) join ldb.d_problem_configuration_item a122
on (a18.configuration_item_key = a122.row_key)
join ldb.d_problem_tribe_c a161
on (a122.problem_tribe_c_key = a161.row_key)
union
select 'ldb.d_lov_rca_incident_priority_c a162 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a18
on (a11.problem_key = a18.row_key) join ldb.d_rca_incident_c a124
on (a18.rca_incident_c1_key = a124.row_key)
join ldb.d_lov_rca_incident_priority_c a162
on (a124.priority_src_key = a162.row_key)
union
select 'ldb.d_lov_rca_incident_status_c a163 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a18
on (a11.problem_key = a18.row_key) join ldb.d_rca_incident_c a124
on (a18.rca_incident_c1_key = a124.row_key)
join ldb.d_lov_rca_incident_status_c a163
on (a124.incident_status_c_key = a163.row_key)
union
select 'ldb.d_calendar_year a164 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_date a112
on (a11.date_key = a112.row_key) join ldb.d_calendar_month a113
on (a112.month_start_date_key = a113.row_key) join ldb.d_calendar_quarter a114
on (a113.quarter_start_date_key = a114.row_key)
join ldb.d_calendar_year a164
on (a114.year_start_date_key = a164.row_key)
union
select 'ldb.d_problem_calendar_year a165 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem_date a119
on (a11.problem_date_key = a119.row_key) join ldb.d_problem_calendar_month a120
on (a119.month_start_date_key = a120.row_key) join ldb.d_problem_calendar_quarter a121
on (a120.quarter_start_date_key = a121.row_key)
join ldb.d_problem_calendar_year a165
on (a121.year_start_date_key = a165.row_key)
