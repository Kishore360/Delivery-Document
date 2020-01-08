select 'ldb.f_incident a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
union
select 'ldb.d_application a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_application a12
on (a11.application_key = a12.row_key)
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
select 'ldb.d_calendar_date a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_date a16
on (a11.date_key = a16.row_key)
union
select 'ldb.d_calendar_month a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_date a16
on (a11.date_key = a16.row_key)
join ldb.d_calendar_month a17
on (a16.month_start_date_key = a17.row_key)
union
select 'ldb.d_calendar_quarter a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_date a16
on (a11.date_key = a16.row_key) join ldb.d_calendar_month a17
on (a16.month_start_date_key = a17.row_key)
join ldb.d_calendar_quarter a18
on (a17.quarter_start_date_key = a18.row_key)
union
select 'ldb.d_change_request a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_change_request a19
on (a11.change_request_key = a19.row_key)
union
select 'ldb.d_configuration_item a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_configuration_item a110
on (a11.configuration_item_key = a110.row_key)
union
select 'ldb.d_configuration_item_mdm a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_configuration_item a110
on (a11.configuration_item_key = a110.row_key)
join ldb.d_configuration_item_mdm a111
on (a110.mdm_key = a111.row_key)
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
select 'ldb.d_incident a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a115
on (a11.incident_key = a115.row_key)
union
select 'ldb.d_parent_incident a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a115
on (a11.incident_key = a115.row_key)
join ldb.d_parent_incident a116
on (a115.parent_incident_key = a116.row_key)
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
select 'ldb.d_domain a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_domain a119
on (a11.domain_key = a119.row_key)
union
select 'ldb.d_incident_contacttype a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident_contacttype a120
on (a11.reported_type_src_key = a120.row_key)
union
select 'ldb.d_incident_current_location_c a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident_current_location_c a121
on (a11.incident_current_location_c_key = a121.row_key)
union
select 'ldb.d_incident_engaged_by_c a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident_engaged_by_c a122
on (a11.incident_engaged_by_c_key = a122.row_key)
union
select 'ldb.d_incident_event_class_c a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident_event_class_c a123
on (a11.incident_event_class_c_key = a123.row_key)
union
select 'ldb.d_incident_impact a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident_impact a124
on (a11.impact_src_key = a124.row_key)
union
select 'ldb.d_incident_kb_knowledge_c a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident_kb_knowledge_c a125
on (a11.incident_kb_knowledge_c_key = a125.row_key)
union
select 'ldb.d_incident_resolver_group_c a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident_resolver_group_c a126
on (a11.resolver_group_c_key = a126.row_key)
union
select 'ldb.d_incident_template_c a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident_template_c a127
on (a11.incident_template_c_key = a127.row_key)
union
select 'ldb.d_incident_urgency a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident_urgency a128
on (a11.urgency_src_key = a128.row_key)
union
select 'ldb.d_location a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_location a129
on (a11.location_key = a129.row_key)
union
select 'ldb.d_application_mdm a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_application a12
on (a11.application_key = a12.row_key)
join ldb.d_application_mdm a130
on (a12.mdm_key = a130.row_key)
union
select 'ldb.d_business_service_criticality a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_business_service a15
on (a11.business_service_key = a15.row_key)
join ldb.d_business_service_criticality a131
on (a15.criticality_key = a131.row_key)
union
select 'ldb.d_business_service_used_for a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_business_service a15
on (a11.business_service_key = a15.row_key)
join ldb.d_business_service_used_for a132
on (a15.used_for_src_key = a132.row_key)
union
select 'ldb.d_calendar_week a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_date a16
on (a11.date_key = a16.row_key)
join ldb.d_calendar_week a133
on (a16.week_start_date_key = a133.row_key)
union
select 'ldb.d_customer_mdm a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_customer a112
on (a11.customer_key = a112.row_key)
join ldb.d_customer_mdm a134
on (a112.customer_mdm_key = a134.row_key)
union
select 'ldb.d_internal_organization_department a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_internal_contact a113
on (a11.employee_key = a113.row_key)
join ldb.d_internal_organization_department a135
on (a113.department_key = a135.row_key)
union
select 'ldb.d_internal_contact_mdm a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_internal_contact a113
on (a11.employee_key = a113.row_key)
join ldb.d_internal_contact_mdm a136
on (a113.employee_mdm_key = a136.row_key)
union
select 'ldb.d_lov_employee_type_c a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_internal_contact_assigned_to a13
on (a11.assigned_to_key = a13.row_key)
join ldb.d_lov_employee_type_c a137
on (a13.employee_type_c_key = a137.row_key)
union
select 'ldb.d_calendar_time_hour a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_time a114
on (a11.time_key = a114.row_key)
join ldb.d_calendar_time_hour a138
on (a114.hour_key = a138.row_key)
union
select 'ldb.d_incident_category a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a115
on (a11.incident_key = a115.row_key)
join ldb.d_incident_category a139
on (a115.category_src_key = a139.row_key)
union
select 'ldb.d_incident_close_code a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a115
on (a11.incident_key = a115.row_key)
join ldb.d_incident_close_code a140
on (a115.close_code_src_key = a140.row_key)
union
select 'ldb.d_incident_engaged_state_c a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a115
on (a11.incident_key = a115.row_key)
join ldb.d_incident_engaged_state_c a141
on (a115.u_engaged_state_c_key = a141.row_key)
union
select 'ldb.d_lov_incident_potential_preventable_stage_c a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a115
on (a11.incident_key = a115.row_key)
join ldb.d_lov_incident_potential_preventable_stage_c a142
on (a115.u_potential_preventable_stage_c_key = a142.row_key)
union
select 'ldb.d_incident_priority a143 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a115
on (a11.incident_key = a115.row_key)
join ldb.d_incident_priority a143
on (a115.priority_src_key = a143.row_key)
union
select 'ldb.d_task_sla_resolution_flag a144 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a115
on (a11.incident_key = a115.row_key)
join ldb.d_task_sla_resolution_flag a144
on (a115.met_resolution_sla_flag_key = a144.row_key)
union
select 'ldb.d_task_sla_response_flag a145 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a115
on (a11.incident_key = a115.row_key)
join ldb.d_task_sla_response_flag a145
on (a115.met_response_sla_flag_key = a145.row_key)
union
select 'ldb.d_incident_root_cause_c a146 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a115
on (a11.incident_key = a115.row_key)
join ldb.d_incident_root_cause_c a146
on (a115.u_root_cause_c_key = a146.row_key)
union
select 'ldb.d_incident_severity a147 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a115
on (a11.incident_key = a115.row_key)
join ldb.d_incident_severity a147
on (a115.severity_src_key = a147.row_key)
union
select 'ldb.d_incident_state a148 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a115
on (a11.incident_key = a115.row_key)
join ldb.d_incident_state a148
on (a115.state_src_key = a148.row_key)
union
select 'ldb.d_incident_subcategory a149 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a115
on (a11.incident_key = a115.row_key)
join ldb.d_incident_subcategory a149
on (a115.sub_category_src_key = a149.row_key)
union
select 'ldb.d_lov_incident_type_c a150 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a115
on (a11.incident_key = a115.row_key)
join ldb.d_lov_incident_type_c a150
on (a115.u_incident_type_c_key = a150.row_key)
union
select 'ldb.d_ci_support_group a151 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_configuration_item a110
on (a11.configuration_item_key = a110.row_key)
join ldb.d_ci_support_group a151
on (a110.support_group_key = a151.row_key)
union
select 'ldb.d_calendar_year a152 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_date a16
on (a11.date_key = a16.row_key) join ldb.d_calendar_month a17
on (a16.month_start_date_key = a17.row_key) join ldb.d_calendar_quarter a18
on (a17.quarter_start_date_key = a18.row_key)
join ldb.d_calendar_year a152
on (a18.year_start_date_key = a152.row_key)