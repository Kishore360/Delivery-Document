select 'ldb.f_incident a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
union
select 'ldb.d_incident a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
union
select 'ldb.d_application a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_application a13
on (a11.application_key = a13.row_key)
union
select 'ldb.d_internal_contact_assigned_to a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_internal_contact_assigned_to a14
on (a11.assigned_to_key = a14.row_key)
union
select 'ldb.d_internal_organization_group a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_internal_organization_group a15
on (a11.assignment_group_key = a15.row_key)
union
select 'ldb.d_business_service a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_business_service a16
on (a11.business_service_key = a16.row_key)
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
select 'ldb.d_change_request a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_change_request a110
on (a11.change_request_key = a110.row_key)
union
select 'ldb.d_configuration_item a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_configuration_item a111
on (a11.configuration_item_key = a111.row_key)
union
select 'ldb.d_configuration_item_mdm a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_configuration_item a111
on (a11.configuration_item_key = a111.row_key)
join ldb.d_configuration_item_mdm a112
on (a111.mdm_key = a112.row_key)
union
select 'ldb.d_customer a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_customer a113
on (a11.customer_key = a113.row_key)
union
select 'ldb.d_internal_contact a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_internal_contact a114
on (a11.employee_key = a114.row_key)
union
select 'ldb.d_calendar_time a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_time a115
on (a11.time_key = a115.row_key)
union
select 'ldb.d_parent_incident a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_parent_incident a116
on (a12.parent_incident_key = a116.row_key)
union
select 'ldb.d_acknowledge_by_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_acknowledge_by_c a117
on (a11.u_acknowledge_by_c_key = a117.row_key)
union
select 'ldb.d_csd_tracker_c a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_csd_tracker_c a118
on (a11.u_csd_tracker_c_key = a118.row_key)
union
select 'ldb.d_change_request_caused_by a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_change_request_caused_by a119
on (a11.caused_by_change_key = a119.row_key)
union
select 'ldb.d_internal_organization_legalentity a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_internal_organization_legalentity a120
on (a11.company_key = a120.row_key)
union
select 'ldb.d_customer_location_c a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_customer_location_c a121
on (a11.u_customer_location_c_key = a121.row_key)
union
select 'ldb.d_domain a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_domain a122
on (a11.domain_key = a122.row_key)
union
select 'ldb.d_incident_contacttype a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident_contacttype a123
on (a11.reported_type_src_key = a123.row_key)
union
select 'ldb.d_incident_impact a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident_impact a124
on (a11.impact_src_key = a124.row_key)
union
select 'ldb.d_incident_urgency a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident_urgency a125
on (a11.urgency_src_key = a125.row_key)
union
select 'ldb.d_location a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_location a126
on (a11.location_key = a126.row_key)
union
select 'ldb.d_application_mdm a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_application a13
on (a11.application_key = a13.row_key)
join ldb.d_application_mdm a127
on (a13.mdm_key = a127.row_key)
union
select 'ldb.d_business_service_criticality a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_business_service a16
on (a11.business_service_key = a16.row_key)
join ldb.d_business_service_criticality a128
on (a16.criticality_key = a128.row_key)
union
select 'ldb.d_business_service_used_for a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_business_service a16
on (a11.business_service_key = a16.row_key)
join ldb.d_business_service_used_for a129
on (a16.used_for_src_key = a129.row_key)
union
select 'ldb.d_calendar_week a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_date a17
on (a11.date_key = a17.row_key)
join ldb.d_calendar_week a130
on (a17.week_start_date_key = a130.row_key)
union
select 'ldb.d_changes_before_the_issue_c a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_changes_before_the_issue_c a131
on (a12.u_changes_before_the_issue_c_key = a131.row_key)
union
select 'ldb.d_closure_code_c a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_closure_code_c a132
on (a12.u_closure_code_c_key = a132.row_key)
union
select 'ldb.d_customer_mdm a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_customer a113
on (a11.customer_key = a113.row_key)
join ldb.d_customer_mdm a133
on (a113.customer_mdm_key = a133.row_key)
union
select 'ldb.d_customer_experience_c a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_customer_experience_c a134
on (a12.u_customer_experience_c_key = a134.row_key)
union
select 'ldb.d_internal_organization_department a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_internal_contact a114
on (a11.employee_key = a114.row_key)
join ldb.d_internal_organization_department a135
on (a114.department_key = a135.row_key)
union
select 'ldb.d_internal_contact_mdm a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_internal_contact a114
on (a11.employee_key = a114.row_key)
join ldb.d_internal_contact_mdm a136
on (a114.employee_mdm_key = a136.row_key)
union
select 'ldb.d_calendar_time_hour a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_time a115
on (a11.time_key = a115.row_key)
join ldb.d_calendar_time_hour a137
on (a115.hour_key = a137.row_key)
union
select 'ldb.d_incident_category a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_incident_category a138
on (a12.category_src_key = a138.row_key)
union
select 'ldb.d_incident_close_code a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_incident_close_code a139
on (a12.close_code_src_key = a139.row_key)
union
select 'ldb.d_incident_priority a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_incident_priority a140
on (a12.priority_src_key = a140.row_key)
union
select 'ldb.d_task_sla_resolution_flag a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_task_sla_resolution_flag a141
on (a12.met_resolution_sla_flag_key = a141.row_key)
union
select 'ldb.d_task_sla_response_flag a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_task_sla_response_flag a142
on (a12.met_response_sla_flag_key = a142.row_key)
union
select 'ldb.d_incident_severity a143 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_incident_severity a143
on (a12.severity_src_key = a143.row_key)
union
select 'ldb.d_incident_state a144 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_incident_state a144
on (a12.state_src_key = a144.row_key)
union
select 'ldb.d_incident_subcategory a145 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_incident_subcategory a145
on (a12.sub_category_src_key = a145.row_key)
union
select 'ldb.d_troubleshooting_performed_c a146 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_troubleshooting_performed_c a146
on (a12.u_troubleshooting_performed_c_key = a146.row_key)
union
select 'ldb.d_calendar_year a147 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_date a17
on (a11.date_key = a17.row_key) join ldb.d_calendar_month a18
on (a17.month_start_date_key = a18.row_key) join ldb.d_calendar_quarter a19
on (a18.quarter_start_date_key = a19.row_key)
join ldb.d_calendar_year a147
on (a19.year_start_date_key = a147.row_key)