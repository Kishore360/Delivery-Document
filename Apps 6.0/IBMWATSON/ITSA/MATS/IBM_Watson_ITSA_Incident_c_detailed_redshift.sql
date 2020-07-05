select 'ldb.f_incident a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
union
select 'ldb.d_configuration_item a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
union
select 'ldb.d_internal_contact_assigned_to a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_internal_contact_assigned_to a13
on (a11.assigned_to_key = a13.row_key)
union
select 'ldb.d_internal_organization_group a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_internal_organization_group a14
on (a11.assignment_group_key = a14.row_key)
union
select 'ldb.d_business_service a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_business_service a15
on (a11.business_service_key = a15.row_key)
union
select 'ldb.d_incident a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a16
on (a11.incident_key = a16.row_key)
union
select 'ldb.d_calendar_date a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_date a17
on (a11.date_key = a17.row_key)
union
select 'ldb.d_calendar_month a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_date a17
on (a11.date_key = a17.row_key)
join ldb.d_calendar_month a18
on (a17.month_start_date_key = a18.row_key)
union
select 'ldb.d_calendar_quarter a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_date a17
on (a11.date_key = a17.row_key) join ldb.d_calendar_month a18
on (a17.month_start_date_key = a18.row_key)
join ldb.d_calendar_quarter a19
on (a18.quarter_start_date_key = a19.row_key)
union
select 'ldb.d_change_request_caused_by a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_change_request_caused_by a110
on (a11.caused_by_change_key = a110.row_key)
union
select 'ldb.d_configuration_item_mdm a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
join ldb.d_configuration_item_mdm a111
on (a12.mdm_key = a111.row_key)
union
select 'ldb.d_customer a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_customer a112
on (a11.customer_key = a112.row_key)
union
select 'ldb.d_internal_contact a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_internal_contact a113
on (a11.employee_key = a113.row_key)
union
select 'ldb.d_calendar_time a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_time a114
on (a11.time_key = a114.row_key)
union
select 'ldb.d_incident_assigned_to a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a16
on (a11.incident_key = a16.row_key)
join ldb.d_incident_assigned_to a115
on (a16.assigned_to_key = a115.row_key)
union
select 'ldb.d_incident_assignment_group a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a16
on (a11.incident_key = a16.row_key)
join ldb.d_incident_assignment_group a116
on (a16.assignment_group_key = a116.row_key)
union
select 'ldb.d_incident_business_service a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a16
on (a11.incident_key = a16.row_key)
join ldb.d_incident_business_service a117
on (a16.business_service_key = a117.row_key)
union
select 'ldb.d_incident_date a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident_date a118
on (a11.incident_date_key = a118.row_key)
union
select 'ldb.d_incident_time a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident_time a119
on (a11.incident_time_key = a119.row_key)
union
select 'ldb.d_incident_calendar_month a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident_date a118
on (a11.incident_date_key = a118.row_key)
join ldb.d_incident_calendar_month a120
on (a118.month_start_date_key = a120.row_key)
union
select 'ldb.d_incident_calendar_quarter a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident_date a118
on (a11.incident_date_key = a118.row_key) join ldb.d_incident_calendar_month a120
on (a118.month_start_date_key = a120.row_key)
join ldb.d_incident_calendar_quarter a121
on (a120.quarter_start_date_key = a121.row_key)
union
select 'ldb.d_configuration_item_incident a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a16
on (a11.incident_key = a16.row_key)
join ldb.d_configuration_item_incident a122
on (a16.configuration_item_key = a122.row_key)
union
select 'ldb.d_incident_configuration_item_mdm a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a16
on (a11.incident_key = a16.row_key) join ldb.d_configuration_item_incident a122
on (a16.configuration_item_key = a122.row_key)
join ldb.d_incident_configuration_item_mdm a123
on (a122.mdm_key = a123.row_key)
union
select 'ldb.d_incident_customer a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a16
on (a11.incident_key = a16.row_key)
join ldb.d_incident_customer a124
on (a16.customer_key = a124.row_key)
union
select 'ldb.d_incident_employee a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident_employee a125
on (a11.incident_employee_key = a125.row_key)
union
select 'ldb.d_incident_problem a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a16
on (a11.incident_key = a16.row_key)
join ldb.d_incident_problem a126
on (a16.problem_key = a126.row_key)
union
select 'ldb.d_parent_incident a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a16
on (a11.incident_key = a16.row_key)
join ldb.d_parent_incident a127
on (a16.parent_incident_key = a127.row_key)
union
select 'ldb.d_task_parent_task_c a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a16
on (a11.incident_key = a16.row_key)
join ldb.d_task_parent_task_c a128
on (a16.parent_task_c_key = a128.row_key)
union
select 'ldb.d_problem a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_problem a129
on (a11.problem_key = a129.row_key)
union
select 'ldb.d_segment_c a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_segment_c a130
on (a11.segment_c_key = a130.row_key)
union
select 'ldb.d_internal_organization_legalentity a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_internal_organization_legalentity a131
on (a11.company_key = a131.row_key)
union
select 'ldb.d_domain a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_domain a132
on (a11.domain_key = a132.row_key)
union
select 'ldb.d_incident_caused_by_change a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident_caused_by_change a133
on (a11.incident_caused_by_change_key = a133.row_key)
union
select 'ldb.d_incident_contacttype a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident_contacttype a134
on (a11.reported_type_src_key = a134.row_key)
union
select 'ldb.d_incident_impact a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident_impact a135
on (a11.impact_src_key = a135.row_key)
union
select 'ldb.d_incident_urgency a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident_urgency a136
on (a11.urgency_src_key = a136.row_key)
union
select 'ldb.d_location a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_location a137
on (a11.location_key = a137.row_key)
union
select 'ldb.d_business_service_criticality a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_business_service a15
on (a11.business_service_key = a15.row_key)
join ldb.d_business_service_criticality a138
on (a15.criticality_key = a138.row_key)
union
select 'ldb.d_business_service_used_for a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_business_service a15
on (a11.business_service_key = a15.row_key)
join ldb.d_business_service_used_for a139
on (a15.used_for_src_key = a139.row_key)
union
select 'ldb.d_calendar_week a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_date a17
on (a11.date_key = a17.row_key)
join ldb.d_calendar_week a140
on (a17.week_start_date_key = a140.row_key)
union
select 'ldb.d_customer_mdm a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_customer a112
on (a11.customer_key = a112.row_key)
join ldb.d_customer_mdm a141
on (a112.customer_mdm_key = a141.row_key)
union
select 'ldb.d_internal_organization_department a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_internal_contact a113
on (a11.employee_key = a113.row_key)
join ldb.d_internal_organization_department a142
on (a113.department_key = a142.row_key)
union
select 'ldb.d_calendar_time_hour a143 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_time a114
on (a11.time_key = a114.row_key)
join ldb.d_calendar_time_hour a143
on (a114.hour_key = a143.row_key)
union
select 'ldb.d_incident_calendar_hour a144 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident_time a119
on (a11.incident_time_key = a119.row_key)
join ldb.d_incident_calendar_hour a144
on (a119.hour_key = a144.row_key)
union
select 'ldb.d_incident_calendar_week a145 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident_date a118
on (a11.incident_date_key = a118.row_key)
join ldb.d_incident_calendar_week a145
on (a118.week_start_date_key = a145.row_key)
union
select 'ldb.d_incident_caller a146 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a16
on (a11.incident_key = a16.row_key)
join ldb.d_incident_caller a146
on (a16.caller_key = a146.row_key)
union
select 'ldb.d_incident_category a147 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a16
on (a11.incident_key = a16.row_key)
join ldb.d_incident_category a147
on (a16.category_src_key = a147.row_key)
union
select 'ldb.d_incident_close_code a148 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a16
on (a11.incident_key = a16.row_key)
join ldb.d_incident_close_code a148
on (a16.close_code_src_key = a148.row_key)
union
select 'ldb.d_incident_company a149 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a16
on (a11.incident_key = a16.row_key)
join ldb.d_incident_company a149
on (a16.company_key = a149.row_key)
union
select 'ldb.d_incident_department a150 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident_employee a125
on (a11.incident_employee_key = a125.row_key)
join ldb.d_incident_department a150
on (a125.department_key = a150.row_key)
union
select 'ldb.d_incident_domain a151 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a16
on (a11.incident_key = a16.row_key)
join ldb.d_incident_domain a151
on (a16.domain_key = a151.row_key)
union
select 'ldb.d_incident_location a152 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a16
on (a11.incident_key = a16.row_key)
join ldb.d_incident_location a152
on (a16.location_key = a152.row_key)
union
select 'ldb.d_incident_opened_by a153 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a16
on (a11.incident_key = a16.row_key)
join ldb.d_incident_opened_by a153
on (a16.opened_by_key = a153.row_key)
union
select 'ldb.d_incident_priority a154 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a16
on (a11.incident_key = a16.row_key)
join ldb.d_incident_priority a154
on (a16.priority_src_key = a154.row_key)
union
select 'ldb.d_task_sla_resolution_flag a155 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a16
on (a11.incident_key = a16.row_key)
join ldb.d_task_sla_resolution_flag a155
on (a16.met_resolution_sla_flag_key = a155.row_key)
union
select 'ldb.d_task_sla_response_flag a156 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a16
on (a11.incident_key = a16.row_key)
join ldb.d_task_sla_response_flag a156
on (a16.met_response_sla_flag_key = a156.row_key)
union
select 'ldb.d_incident_severity a157 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a16
on (a11.incident_key = a16.row_key)
join ldb.d_incident_severity a157
on (a16.severity_src_key = a157.row_key)
union
select 'ldb.d_incident_state a158 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a16
on (a11.incident_key = a16.row_key)
join ldb.d_incident_state a158
on (a16.state_src_key = a158.row_key)
union
select 'ldb.d_lov_incident_status_c a159 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a16
on (a11.incident_key = a16.row_key)
join ldb.d_lov_incident_status_c a159
on (a16.incident_status_c_key = a159.row_key)
union
select 'ldb.d_incident_subcategory a160 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a16
on (a11.incident_key = a16.row_key)
join ldb.d_incident_subcategory a160
on (a16.sub_category_src_key = a160.row_key)
union
select 'ldb.d_internal_contact_general_manager_c a161 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_segment_c a130
on (a11.segment_c_key = a130.row_key)
join ldb.d_internal_contact_general_manager_c a161
on (a130.general_manager_c_key = a161.row_key)
union
select 'ldb.d_lov_segment_type_c a162 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_segment_c a130
on (a11.segment_c_key = a130.row_key)
join ldb.d_lov_segment_type_c a162
on (a130.segment_type_c_key = a162.row_key)
union
select 'ldb.d_incident_business_service_criticality a163 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a16
on (a11.incident_key = a16.row_key) join ldb.d_incident_business_service a117
on (a16.business_service_key = a117.row_key)
join ldb.d_incident_business_service_criticality a163
on (a117.criticality_key = a163.row_key)
union
select 'ldb.d_incident_business_service_used_for a164 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a16
on (a11.incident_key = a16.row_key) join ldb.d_incident_business_service a117
on (a16.business_service_key = a117.row_key)
join ldb.d_incident_business_service_used_for a164
on (a117.used_for_src_key = a164.row_key)
union
select 'ldb.d_incident_customer_mdm a165 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a16
on (a11.incident_key = a16.row_key) join ldb.d_incident_customer a124
on (a16.customer_key = a124.row_key)
join ldb.d_incident_customer_mdm a165
on (a124.customer_mdm_key = a165.row_key)
union
select 'ldb.d_incident_tribe_c a166 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a16
on (a11.incident_key = a16.row_key) join ldb.d_configuration_item_incident a122
on (a16.configuration_item_key = a122.row_key) join ldb.d_incident_configuration_item_mdm a123
on (a122.mdm_key = a123.row_key)
join ldb.d_incident_tribe_c a166
on (a123.incident_tribe_c_key = a166.row_key)
union
select 'ldb.d_configuration_item_parent_c a167 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a16
on (a11.incident_key = a16.row_key) join ldb.d_parent_incident a127
on (a16.parent_incident_key = a127.row_key)
join ldb.d_configuration_item_parent_c a167
on (a127.configuration_item_key = a167.row_key)
union
select 'ldb.d_calendar_year a168 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_date a17
on (a11.date_key = a17.row_key) join ldb.d_calendar_month a18
on (a17.month_start_date_key = a18.row_key) join ldb.d_calendar_quarter a19
on (a18.quarter_start_date_key = a19.row_key)
join ldb.d_calendar_year a168
on (a19.year_start_date_key = a168.row_key)
union
select 'ldb.d_incident_calendar_year a169 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident_date a118
on (a11.incident_date_key = a118.row_key) join ldb.d_incident_calendar_month a120
on (a118.month_start_date_key = a120.row_key) join ldb.d_incident_calendar_quarter a121
on (a120.quarter_start_date_key = a121.row_key)
join ldb.d_incident_calendar_year a169
on (a121.year_start_date_key = a169.row_key)
