select 'ldb.f_incident a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
union
select 'ldb.d_archer_application_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_archer_application_c a12
on (a11.application_archer_c_key = a12.row_key)
union
select 'ldb.d_customer a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_customer a13
on (a11.customer_key = a13.row_key)
union
select 'ldb.d_internal_contact a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_internal_contact a14
on (a11.opened_by_key = a14.row_key)
union
select 'ldb.d_calendar_time a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_time a15
on (a11.opened_time_key = a15.row_key)
union
select 'ldb.d_software_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_software_c a16
on (a11.archer_id_c_key = a16.row_key)
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
select 'ldb.d_calendar_date a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_date a110
on (a11.opened_on_key = a110.row_key)
union
select 'ldb.d_incident a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a111
on (a11.incident_key = a111.row_key)
union
select 'ldb.d_change_request a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_change_request a112
on (a11.change_request_key = a112.row_key)
union
select 'ldb.d_configuration_item a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_configuration_item a113
on (a11.configuration_item_key = a113.row_key)
union
select 'ldb.d_incident_opened_by a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident_opened_by a114
on (a11.opened_by_key = a114.row_key)
union
select 'ldb.d_incident_priority a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a111
on (a11.incident_key = a111.row_key)
join ldb.d_incident_priority a115
on (a111.priority_src_key = a115.row_key)
union
select 'ldb.d_calendar_month a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_date a110
on (a11.opened_on_key = a110.row_key)
join ldb.d_calendar_month a116
on (a110.month_start_date_key = a116.row_key)
union
select 'ldb.d_change_request_caused_by a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_change_request_caused_by a117
on (a11.caused_by_change_key = a117.row_key)
union
select 'ldb.d_internal_organization_legalentity a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_internal_organization_legalentity a118
on (a11.company_key = a118.row_key)
union
select 'ldb.d_customer_mdm a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_customer a13
on (a11.customer_key = a13.row_key)
join ldb.d_customer_mdm a119
on (a13.row_current_key = a119.row_current_key)
union
select 'ldb.d_internal_organization_department a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_internal_contact a14
on (a11.opened_by_key = a14.row_key)
join ldb.d_internal_organization_department a120
on (a14.department_key = a120.row_key)
union
select 'ldb.d_domain a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_domain a121
on (a11.domain_key = a121.row_key)
union
select 'ldb.d_internal_contact_mdm a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_internal_contact a14
on (a11.opened_by_key = a14.row_key)
join ldb.d_internal_contact_mdm a122
on (a14.row_current_key = a122.row_current_key)
union
select 'ldb.d_calendar_time_hour a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_time a15
on (a11.opened_time_key = a15.row_key)
join ldb.d_calendar_time_hour a123
on (a15.hour_24_format_num = a123.hour_24_format_num)
union
select 'ldb.d_incident_contacttype a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident_contacttype a124
on (a11.reported_type_src_key = a124.row_key)
union
select 'ldb.d_incident_impact a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident_impact a125
on (a11.impact_src_key = a125.row_key)
union
select 'ldb.d_incident_urgency a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident_urgency a126
on (a11.urgency_src_key = a126.row_key)
union
select 'ldb.d_location a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_location a127
on (a11.location_key = a127.row_key)
union
select 'ldb.d_problem a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_problem a128
on (a11.problem_key = a128.row_key)
union
select 'ldb.d_incident_resolution_ci_c a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident_resolution_ci_c a129
on (a11.resolution_ci_detail_key = a129.row_key)
union
select 'ldb.d_internal_contact a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_internal_contact a130
on (a11.last_resolved_by_key = a130.row_key)
union
select 'ldb.d_cost_center a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_internal_contact_assigned_to a17
on (a11.assigned_to_key = a17.row_key)
join ldb.d_cost_center a131
on (a17.cost_center_key = a131.row_key)
union
select 'ldb.d_assignment_group_manager_c a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_internal_organization_group a18
on (a11.assignment_group_key = a18.row_key)
join ldb.d_assignment_group_manager_c a132
on (a18.manager_c_key = a132.row_key)
union
select 'ldb.d_business_service_criticality a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_business_service a19
on (a11.business_service_key = a19.row_key)
join ldb.d_business_service_criticality a133
on (a19.criticality_key = a133.row_key)
union
select 'ldb.d_business_service_used_for a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_business_service a19
on (a11.business_service_key = a19.row_key)
join ldb.d_business_service_used_for a134
on (a19.used_for_src_key = a134.row_key)
union
select 'ldb.d_calendar_week a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_date a110
on (a11.opened_on_key = a110.row_key)
join ldb.d_calendar_week a135
on (a110.week_start_date_key = a135.row_key)
union
select 'ldb.d_lov_incident_cause_code_c a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a111
on (a11.incident_key = a111.row_key)
join ldb.d_lov_incident_cause_code_c a136
on (a111.cause_code_c_key = a136.row_key)
union
select 'ldb.d_incident_category a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a111
on (a11.incident_key = a111.row_key)
join ldb.d_incident_category a137
on (a111.category_src_key = a137.row_key)
union
select 'ldb.d_incident_close_code a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a111
on (a11.incident_key = a111.row_key)
join ldb.d_incident_close_code a138
on (a111.close_code_src_key = a138.row_key)
union
select 'ldb.d_task_sla_resolution_flag a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a111
on (a11.incident_key = a111.row_key)
join ldb.d_task_sla_resolution_flag a139
on (a111.met_resolution_sla_flag_key = a139.row_key)
union
select 'ldb.d_task_sla_response_flag a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a111
on (a11.incident_key = a111.row_key)
join ldb.d_task_sla_response_flag a140
on (a111.met_response_sla_flag_key = a140.row_key)
union
select 'ldb.d_incident_severity a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a111
on (a11.incident_key = a111.row_key)
join ldb.d_incident_severity a141
on (a111.severity_src_key = a141.row_key)
union
select 'ldb.d_incident_state a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a111
on (a11.incident_key = a111.row_key)
join ldb.d_incident_state a142
on (a111.state_src_key = a142.row_key)
union
select 'ldb.d_incident_subcategory a143 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a111
on (a11.incident_key = a111.row_key)
join ldb.d_incident_subcategory a143
on (a111.sub_category_src_key = a143.row_key)
union
select 'ldb.d_lov_incident_resolution_code_c a144 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a111
on (a11.incident_key = a111.row_key)
join ldb.d_lov_incident_resolution_code_c a144
on (a111.resolution_code_c_key = a144.row_key)
union
select 'ldb.d_calendar_quarter a145 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_date a110
on (a11.opened_on_key = a110.row_key)
join ldb.d_calendar_quarter a145
on (a110.quarter_start_date_key = a145.row_key)
union
select 'ldb.d_calendar_year a146 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_date a110
on (a11.opened_on_key = a110.row_key)
join ldb.d_calendar_year a146
on (a110.year_start_date_key = a146.row_key)