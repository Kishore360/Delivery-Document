select 'ldb.f_incident_resolved a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
union
select 'ldb.d_archer_application_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_archer_application_c a12
on (a11.application_archer_c_key = a12.row_key)
union
select 'ldb.d_configuration_item a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_configuration_item a13
on (a11.configuration_item_key = a13.row_key)
union
select 'ldb.d_customer a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_customer a14
on (a11.customer_key = a14.row_key)
union
select 'ldb.d_internal_contact a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_internal_contact a15
on (a11.employee_key = a15.row_key)
union
select 'ldb.d_calendar_time a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_calendar_time a16
on (a11.time_key = a16.row_key)
union
select 'ldb.d_archer_software_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_archer_software_c a17
on (a11.archer_id_c_key = a17.row_key)
union
select 'ldb.d_internal_contact_assigned_to a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_internal_contact_assigned_to a18
on (a11.assigned_to_key = a18.row_key)
union
select 'ldb.d_internal_organization_group a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_internal_organization_group a19
on (a11.assignment_group_key = a19.row_key)
union
select 'ldb.d_business_service a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_business_service a110
on (a11.business_service_key = a110.row_key)
union
select 'ldb.d_calendar_date a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_calendar_date a111
on (a11.date_key = a111.row_key)
union
select 'ldb.d_calendar_month a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_calendar_date a111
on (a11.date_key = a111.row_key)
join ldb.d_calendar_month a112
on (a111.month_start_date_key = a112.row_key)
union
select 'ldb.d_calendar_quarter a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_calendar_date a111
on (a11.date_key = a111.row_key) join ldb.d_calendar_month a112
on (a111.month_start_date_key = a112.row_key)
join ldb.d_calendar_quarter a113
on (a112.quarter_start_date_key = a113.row_key)
union
select 'ldb.d_incident a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_incident a114
on (a11.incident_key = a114.row_key)
union
select 'ldb.d_change_request a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_change_request a115
on (a11.change_request_key = a115.row_key)
union
select 'ldb.d_configuration_item_mdm a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_configuration_item a13
on (a11.configuration_item_key = a13.row_key)
join ldb.d_configuration_item_mdm a116
on (a13.mdm_key = a116.row_key)
union
select 'ldb.d_incident_opened_by a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_incident_opened_by a117
on (a11.opened_by_key = a117.row_key)
union
select 'ldb.d_incident_priority a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_incident a114
on (a11.incident_key = a114.row_key)
join ldb.d_incident_priority a118
on (a114.priority_src_key = a118.row_key)
union
select 'ldb.d_calendar_year a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_calendar_date a111
on (a11.date_key = a111.row_key) join ldb.d_calendar_month a112
on (a111.month_start_date_key = a112.row_key) join ldb.d_calendar_quarter a113
on (a112.quarter_start_date_key = a113.row_key)
join ldb.d_calendar_year a119
on (a113.year_start_date_key = a119.row_key)
union
select 'ldb.d_change_request_caused_by a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_change_request_caused_by a120
on (a11.caused_by_change_key = a120.row_key)
union
select 'ldb.d_internal_organization_legalentity a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_internal_organization_legalentity a121
on (a11.company_key = a121.row_key)
union
select 'ldb.d_customer_mdm a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_customer a14
on (a11.customer_key = a14.row_key)
join ldb.d_customer_mdm a122
on (a14.customer_mdm_key = a122.row_key)
union
select 'ldb.d_internal_organization_department a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_internal_contact a15
on (a11.employee_key = a15.row_key)
join ldb.d_internal_organization_department a123
on (a15.department_key = a123.row_key)
union
select 'ldb.d_domain a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_domain a124
on (a11.domain_key = a124.row_key)
union
select 'ldb.d_internal_contact_mdm a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_internal_contact a15
on (a11.employee_key = a15.row_key)
join ldb.d_internal_contact_mdm a125
on (a15.employee_mdm_key = a125.row_key)
union
select 'ldb.d_calendar_time_hour a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_calendar_time a16
on (a11.time_key = a16.row_key)
join ldb.d_calendar_time_hour a126
on (a16.hour_key = a126.row_key)
union
select 'ldb.d_incident_contacttype a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_incident_contacttype a127
on (a11.reported_type_src_key = a127.row_key)
union
select 'ldb.d_incident_impact a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_incident_impact a128
on (a11.impact_src_key = a128.row_key)
union
select 'ldb.d_incident_urgency a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_incident_urgency a129
on (a11.urgency_src_key = a129.row_key)
union
select 'ldb.d_location a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_location a130
on (a11.location_key = a130.row_key)
union
select 'ldb.d_problem a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_problem a131
on (a11.problem_key = a131.row_key)
union
select 'ldb.d_incident_resolution_ci_c a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_incident_resolution_ci_c a132
on (a11.resolution_ci_detail_key = a132.row_key)
union
select 'ldb.d_internal_contact_resolved_by a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_internal_contact_resolved_by a133
on (a11.last_resolved_by_key = a133.row_key)
union
select 'ldb.d_cost_center a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_internal_contact_assigned_to a18
on (a11.assigned_to_key = a18.row_key)
join ldb.d_cost_center a134
on (a18.cost_center_key = a134.row_key)
union
select 'ldb.d_assignment_group_manager_c a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_internal_organization_group a19
on (a11.assignment_group_key = a19.row_key)
join ldb.d_assignment_group_manager_c a135
on (a19.manager_c_key = a135.row_key)
union
select 'ldb.d_business_service_criticality a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_business_service a110
on (a11.business_service_key = a110.row_key)
join ldb.d_business_service_criticality a136
on (a110.criticality_key = a136.row_key)
union
select 'ldb.d_business_service_used_for a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_business_service a110
on (a11.business_service_key = a110.row_key)
join ldb.d_business_service_used_for a137
on (a110.used_for_src_key = a137.row_key)
union
select 'ldb.d_calendar_week a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_calendar_date a111
on (a11.date_key = a111.row_key)
join ldb.d_calendar_week a138
on (a111.week_start_date_key = a138.row_key)
union
select 'ldb.d_lov_incident_cause_code_c a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_incident a114
on (a11.incident_key = a114.row_key)
join ldb.d_lov_incident_cause_code_c a139
on (a114.cause_code_c_key = a139.row_key)
union
select 'ldb.d_incident_category a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_incident a114
on (a11.incident_key = a114.row_key)
join ldb.d_incident_category a140
on (a114.category_src_key = a140.row_key)
union
select 'ldb.d_incident_close_code a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_incident a114
on (a11.incident_key = a114.row_key)
join ldb.d_incident_close_code a141
on (a114.close_code_src_key = a141.row_key)
union
select 'ldb.d_task_sla_resolution_flag a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_incident a114
on (a11.incident_key = a114.row_key)
join ldb.d_task_sla_resolution_flag a142
on (a114.met_resolution_sla_flag_key = a142.row_key)
union
select 'ldb.d_task_sla_response_flag a143 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_incident a114
on (a11.incident_key = a114.row_key)
join ldb.d_task_sla_response_flag a143
on (a114.met_response_sla_flag_key = a143.row_key)
union
select 'ldb.d_incident_severity a144 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_incident a114
on (a11.incident_key = a114.row_key)
join ldb.d_incident_severity a144
on (a114.severity_src_key = a144.row_key)
union
select 'ldb.d_incident_state a145 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_incident a114
on (a11.incident_key = a114.row_key)
join ldb.d_incident_state a145
on (a114.state_src_key = a145.row_key)
union
select 'ldb.d_incident_subcategory a146 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_incident a114
on (a11.incident_key = a114.row_key)
join ldb.d_incident_subcategory a146
on (a114.sub_category_src_key = a146.row_key)
union
select 'ldb.d_lov_incident_resolution_code_c a147 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11
join ldb.d_incident a114
on (a11.incident_key = a114.row_key)
join ldb.d_lov_incident_resolution_code_c a147
on (a114.resolution_code_c_key = a147.row_key)