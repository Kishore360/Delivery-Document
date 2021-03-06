select 'ldb.f_incident a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
union
select 'ldb.d_incident a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
union
select 'ldb.d_application_incident_subcategory_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_application_incident_subcategory_c a13
on (a11.application_subcategory_c_key = a13.row_key)
union
select 'ldb.d_internal_contact_app_support_director_c a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_application_incident_subcategory_c a13
on (a11.application_subcategory_c_key = a13.row_key)
join ldb.d_internal_contact_app_support_director_c a14
on (a13.application_support_director_c_key = a14.row_key)
union
select 'ldb.d_internal_contact_app_support_manager_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_application_incident_subcategory_c a13
on (a11.application_subcategory_c_key = a13.row_key)
join ldb.d_internal_contact_app_support_manager_c a15
on (a13.application_support_manager_c_key = a15.row_key)
union
select 'ldb.d_internal_contact_app_vp_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_application_incident_subcategory_c a13
on (a11.application_subcategory_c_key = a13.row_key)
join ldb.d_internal_contact_app_vp_c a16
on (a13.application_vp_c_key = a16.row_key)
union
select 'ldb.d_internal_contact_assigned_to a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_internal_contact_assigned_to a17
on (a11.assigned_to_key = a17.row_key)
union
select 'ldb.d_internal_organization_group a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_internal_organization_group a18
on (a11.assignment_group_key = a18.row_key)
union
select 'ldb.d_business_service a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_business_service a19
on (a11.business_service_key = a19.row_key)
union
select 'ldb.d_business_unit_assignment_group_c a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_business_unit_assignment_group_c a110
on (a11.business_unit_assignment_group_c_key = a110.row_key)
union
select 'ldb.d_assignment_group_support_group_business_unit_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_business_unit_assignment_group_c a110
on (a11.business_unit_assignment_group_c_key = a110.row_key)
join ldb.d_assignment_group_support_group_business_unit_c a111
on (a110.business_unit_c_key = a111.row_key)
union
select 'ldb.d_calendar_date a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_date a112
on (a11.date_key = a112.row_key)
union
select 'ldb.d_calendar_month a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_date a112
on (a11.date_key = a112.row_key)
join ldb.d_calendar_month a113
on (a112.month_start_date_key = a113.row_key)
union
select 'ldb.d_calendar_quarter a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_date a112
on (a11.date_key = a112.row_key) join ldb.d_calendar_month a113
on (a112.month_start_date_key = a113.row_key)
join ldb.d_calendar_quarter a114
on (a113.quarter_start_date_key = a114.row_key)
union
select 'ldb.d_change_request_caused_by a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_change_request_caused_by a115
on (a11.caused_by_change_key = a115.row_key)
union
select 'ldb.d_change_request a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_change_request a116
on (a11.change_request_key = a116.row_key)
union
select 'ldb.d_configuration_item a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_configuration_item a117
on (a11.configuration_item_key = a117.row_key)
union
select 'ldb.d_customer a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_customer a118
on (a11.customer_key = a118.row_key)
union
select 'ldb.d_internal_contact a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_internal_contact a119
on (a11.employee_key = a119.row_key)
union
select 'ldb.d_calendar_time a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_time a120
on (a11.time_key = a120.row_key)
union
select 'ldb.d_internal_contact_opened_by_c a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_internal_contact_opened_by_c a121
on (a12.opened_by_key = a121.row_key)
union
select 'ldb.d_problem a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_problem a122
on (a11.problem_key = a122.row_key)
union
select 'ldb.d_internal_organization_incident_pit_lead_c a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_problem a122
on (a11.problem_key = a122.row_key)
join ldb.d_internal_organization_incident_pit_lead_c a123
on (a122.assignment_group_for_pit_lead_c_key = a123.row_key)
union
select 'ldb.d_incident_requester_c a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_incident_requester_c a124
on (a12.row_key = a124.row_key)
union
select 'ldb.d_internal_organization_last_resolved_by_c a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_internal_organization_last_resolved_by_c a125
on (a11.resolved_by_group_key = a125.row_key)
union
select 'ldb.d_calendar_week a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_date a112
on (a11.date_key = a112.row_key)
join ldb.d_calendar_week a126
on (a112.week_start_date_key = a126.row_key)
union
select 'ldb.d_calendar_year a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_date a112
on (a11.date_key = a112.row_key) join ldb.d_calendar_month a113
on (a112.month_start_date_key = a113.row_key) join ldb.d_calendar_quarter a114
on (a113.quarter_start_date_key = a114.row_key)
join ldb.d_calendar_year a127
on (a114.year_start_date_key = a127.row_key)
union
select 'ldb.d_parent_incident a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_parent_incident a128
on (a12.parent_incident_key = a128.row_key)
union
select 'ldb.d_internal_contact_caller_id_c a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_internal_contact_caller_id_c a129
on (a12.opened_by_c_key = a129.row_key)
union
select 'ldb.d_internal_organization_legalentity a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_internal_organization_legalentity a130
on (a11.company_key = a130.row_key)
union
select 'ldb.d_domain a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_domain a131
on (a11.domain_key = a131.row_key)
union
select 'ldb.d_lov_fact_source_c a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_lov_fact_source_c a132
on (a11.fact_source_c_key = a132.row_key)
union
select 'ldb.d_incident_contacttype a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident_contacttype a133
on (a11.reported_type_src_key = a133.row_key)
union
select 'ldb.d_incident_impact a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident_impact a134
on (a11.impact_src_key = a134.row_key)
union
select 'ldb.d_incident_urgency a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident_urgency a135
on (a11.urgency_src_key = a135.row_key)
union
select 'ldb.d_location a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_location a136
on (a11.location_key = a136.row_key)
union
select 'ldb.d_lov_incident_incident_type_c a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_lov_incident_incident_type_c a137
on (a12.incident_type_src_c_key = a137.row_key)
union
select 'ldb.d_business_service_criticality a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_business_service a19
on (a11.business_service_key = a19.row_key)
join ldb.d_business_service_criticality a138
on (a19.criticality_key = a138.row_key)
union
select 'ldb.d_business_service_used_for a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_business_service a19
on (a11.business_service_key = a19.row_key)
join ldb.d_business_service_used_for a139
on (a19.used_for_src_key = a139.row_key)
union
select 'ldb.d_customer_mdm a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_customer a118
on (a11.customer_key = a118.row_key)
join ldb.d_customer_mdm a140
on (a118.customer_mdm_key = a140.row_key)
union
select 'ldb.d_internal_contact_mdm a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_internal_contact a119
on (a11.employee_key = a119.row_key)
join ldb.d_internal_contact_mdm a141
on (a119.employee_mdm_key = a141.row_key)
union
select 'ldb.d_lov_incident_event_type_c a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_lov_incident_event_type_c a142
on (a12.event_type_src_c_key = a142.row_key)
union
select 'ldb.d_calendar_time_hour a143 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_time a120
on (a11.time_key = a120.row_key)
join ldb.d_calendar_time_hour a143
on (a120.hour_key = a143.row_key)
union
select 'ldb.d_incident_category a144 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_incident_category a144
on (a12.category_src_key = a144.row_key)
union
select 'ldb.d_incident_close_code a145 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_incident_close_code a145
on (a12.close_code_src_key = a145.row_key)
union
select 'ldb.d_incident_opened_by a146 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_incident_opened_by a146
on (a12.opened_by_key = a146.row_key)
union
select 'ldb.d_incident_priority a147 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_incident_priority a147
on (a12.priority_src_key = a147.row_key)
union
select 'ldb.d_task_sla_resolution_flag a148 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_task_sla_resolution_flag a148
on (a12.met_resolution_sla_flag_key = a148.row_key)
union
select 'ldb.d_incident_resolved_by a149 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_incident_resolved_by a149
on (a12.resolved_by_key = a149.row_key)
union
select 'ldb.d_task_sla_response_flag a150 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_task_sla_response_flag a150
on (a12.met_response_sla_flag_key = a150.row_key)
union
select 'ldb.d_incident_severity a151 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_incident_severity a151
on (a12.severity_src_key = a151.row_key)
union
select 'ldb.d_incident_state a152 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_incident_state a152
on (a12.state_src_key = a152.row_key)
union
select 'ldb.d_lov_incident_sub_status_c a153 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_lov_incident_sub_status_c a153
on (a12.sub_status_src_c_key = a153.row_key)
union
select 'ldb.d_incident_subcategory a154 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_incident_subcategory a154
on (a12.sub_category_src_key = a154.row_key)
union
select 'ldb.d_problem_state a155 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_problem a122
on (a11.problem_key = a122.row_key)
join ldb.d_problem_state a155
on (a122.state_src_key = a155.row_key)
union
select 'ldb.d_internal_organization_caller_id_department_c a156 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key) join ldb.d_internal_contact_caller_id_c a129
on (a12.opened_by_c_key = a129.row_key)
join ldb.d_internal_organization_caller_id_department_c a156
on (a129.department_key = a156.row_key)
union
select 'ldb.d_lov_problem_swat_code_c a157 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_problem a122
on (a11.problem_key = a122.row_key)
join ldb.d_lov_problem_swat_code_c a157
on (a122.swat_code_src_c_key = a157.row_key)
union
select 'ldb.d_lov_problem_sub_status_c a158 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_problem a122
on (a11.problem_key = a122.row_key)
join ldb.d_lov_problem_sub_status_c a158
on (a122.sub_status_src_c_key = a158.row_key)
union
select 'ldb.d_internal_contact_opened_by_manager_c a159 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key) join ldb.d_internal_contact_opened_by_c a121
on (a12.opened_by_key = a121.row_key)
join ldb.d_internal_contact_opened_by_manager_c a159
on (a121.manager_key = a159.row_key)
