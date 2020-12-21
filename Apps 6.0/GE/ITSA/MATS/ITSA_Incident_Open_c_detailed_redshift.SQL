
select 'ldb.f_incident a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
union
select 'ldb.d_incident_time a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident_time a12
on (a11.incident_time_key = a12.row_key)
union
select 'ldb.d_incident_employee a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident_employee a13
on (a11.incident_employee_key = a13.row_key)
union
select 'ldb.d_incident a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a14
on (a11.incident_key = a14.row_key)
union
select 'ldb.d_incident_application a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a14
on (a11.incident_key = a14.row_key)
join ldb.d_incident_application a15
on (a14.application_key = a15.row_key)
union
select 'ldb.d_incident_assigned_to a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a14
on (a11.incident_key = a14.row_key)
join ldb.d_incident_assigned_to a16
on (a14.assigned_to_key = a16.row_key)
union
select 'ldb.d_incident_assignment_group a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a14
on (a11.incident_key = a14.row_key)
join ldb.d_incident_assignment_group a17
on (a14.assignment_group_key = a17.row_key)
union
select 'ldb.d_incident_business_service a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a14
on (a11.incident_key = a14.row_key)
join ldb.d_incident_business_service a18
on (a14.business_service_key = a18.row_key)
union
select 'ldb.d_incident_date a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident_date a19
on (a11.incident_date_key = a19.row_key)
union
select 'ldb.d_incident_calendar_month a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident_date a19
on (a11.incident_date_key = a19.row_key)
join ldb.d_incident_calendar_month a110
on (a19.month_start_date_key = a110.row_key)
union
select 'ldb.d_incident_calendar_quarter a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident_date a19
on (a11.incident_date_key = a19.row_key) join ldb.d_incident_calendar_month a110
on (a19.month_start_date_key = a110.row_key)
join ldb.d_incident_calendar_quarter a111
on (a110.quarter_start_date_key = a111.row_key)
union
select 'ldb.d_incident_rfc a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a14
on (a11.incident_key = a14.row_key)
join ldb.d_incident_rfc a112
on (a14.change_request_key = a112.row_key)
union
select 'ldb.d_configuration_item_incident a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a14
on (a11.incident_key = a14.row_key)
join ldb.d_configuration_item_incident a113
on (a14.configuration_item_key = a113.row_key)
union
select 'ldb.d_incident_configuration_item_mdm a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a14
on (a11.incident_key = a14.row_key) join ldb.d_configuration_item_incident a113
on (a14.configuration_item_key = a113.row_key)
join ldb.d_incident_configuration_item_mdm a114
on (a113.mdm_key = a114.row_key)
union
select 'ldb.d_incident_customer a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a14
on (a11.incident_key = a14.row_key)
join ldb.d_incident_customer a115
on (a14.customer_key = a115.row_key)
union
select 'ldb.d_parent_incident a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a14
on (a11.incident_key = a14.row_key)
join ldb.d_parent_incident a116
on (a14.parent_incident_key = a116.row_key)
union
select 'ldb.d_incident_calendar_hour a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident_time a12
on (a11.incident_time_key = a12.row_key)
join ldb.d_incident_calendar_hour a117
on (a12.hour_key = a117.row_key)
union
select 'ldb.d_incident_caused_by_change a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident_caused_by_change a118
on (a11.incident_caused_by_change_key = a118.row_key)
union
select 'ldb.d_incident_contacttype a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident_contacttype a119
on (a11.reported_type_src_key = a119.row_key)
union
select 'ldb.d_incident_department a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident_employee a13
on (a11.incident_employee_key = a13.row_key)
join ldb.d_incident_department a120
on (a13.department_key = a120.row_key)
union
select 'ldb.d_incident_employee_mdm a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident_employee a13
on (a11.incident_employee_key = a13.row_key)
join ldb.d_incident_employee_mdm a121
on (a13.employee_mdm_key = a121.row_key)
union
select 'ldb.d_incident_impact a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident_impact a122
on (a11.impact_src_key = a122.row_key)
union
select 'ldb.d_incident_urgency a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident_urgency a123
on (a11.urgency_src_key = a123.row_key)
union
select 'ldb.d_incident_application_mdm a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a14
on (a11.incident_key = a14.row_key) join ldb.d_incident_application a15
on (a14.application_key = a15.row_key)
join ldb.d_incident_application_mdm a124
on (a15.mdm_key = a124.row_key)
union
select 'ldb.d_incident_calendar_week a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident_date a19
on (a11.incident_date_key = a19.row_key)
join ldb.d_incident_calendar_week a125
on (a19.week_start_date_key = a125.row_key)
union
select 'ldb.d_incident_category a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a14
on (a11.incident_key = a14.row_key)
join ldb.d_incident_category a126
on (a14.category_src_key = a126.row_key)
union
select 'ldb.d_incident_close_code a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a14
on (a11.incident_key = a14.row_key)
join ldb.d_incident_close_code a127
on (a14.close_code_src_key = a127.row_key)
union
select 'ldb.d_incident_company a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a14
on (a11.incident_key = a14.row_key)
join ldb.d_incident_company a128
on (a14.company_key = a128.row_key)
union
select 'ldb.d_incident_customer_mdm a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a14
on (a11.incident_key = a14.row_key) join ldb.d_incident_customer a115
on (a14.customer_key = a115.row_key)
join ldb.d_incident_customer_mdm a129
on (a115.customer_mdm_key = a129.row_key)
union
select 'ldb.d_incident_domain a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a14
on (a11.incident_key = a14.row_key)
join ldb.d_incident_domain a130
on (a14.domain_key = a130.row_key)
union
select 'ldb.d_incident_environment_c a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a14
on (a11.incident_key = a14.row_key)
join ldb.d_incident_environment_c a131
on (a14.environment_c_key = a131.row_key)
union
select 'ldb.d_incident_ge_business_c a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a14
on (a11.incident_key = a14.row_key)
join ldb.d_incident_ge_business_c a132
on (a14.ge_business_c_key = a132.row_key)
union
select 'ldb.d_incident_location a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a14
on (a11.incident_key = a14.row_key)
join ldb.d_incident_location a133
on (a14.location_key = a133.row_key)
union
select 'ldb.d_incident_on_behalf_of_c a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a14
on (a11.incident_key = a14.row_key)
join ldb.d_incident_on_behalf_of_c a134
on (a14.on_behalf_of_c_key = a134.row_key)
union
select 'ldb.d_incident_priority a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a14
on (a11.incident_key = a14.row_key)
join ldb.d_incident_priority a135
on (a14.priority_src_key = a135.row_key)
union
select 'ldb.d_task_sla_resolution_flag a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a14
on (a11.incident_key = a14.row_key)
join ldb.d_task_sla_resolution_flag a136
on (a14.met_resolution_sla_flag_key = a136.row_key)
union
select 'ldb.d_task_sla_response_flag a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a14
on (a11.incident_key = a14.row_key)
join ldb.d_task_sla_response_flag a137
on (a14.met_response_sla_flag_key = a137.row_key)
union
select 'ldb.d_incident_service_c a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a14
on (a11.incident_key = a14.row_key)
join ldb.d_incident_service_c a138
on (a14.service_c_key = a138.row_key)
union
select 'ldb.d_incident_severity a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a14
on (a11.incident_key = a14.row_key)
join ldb.d_incident_severity a139
on (a14.severity_src_key = a139.row_key)
union
select 'ldb.d_incident_state a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a14
on (a11.incident_key = a14.row_key)
join ldb.d_incident_state a140
on (a14.state_src_key = a140.row_key)
union
select 'ldb.d_incident_subcategory a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a14
on (a11.incident_key = a14.row_key)
join ldb.d_incident_subcategory a141
on (a14.sub_category_src_key = a141.row_key)
union
select 'ldb.d_incident_assignment_group_manager a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a14
on (a11.incident_key = a14.row_key) join ldb.d_incident_assignment_group a17
on (a14.assignment_group_key = a17.row_key)
join ldb.d_incident_assignment_group_manager a142
on (a17.manager_key = a142.row_key)
union
select 'ldb.d_incident_business_service_criticality a143 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a14
on (a11.incident_key = a14.row_key) join ldb.d_incident_business_service a18
on (a14.business_service_key = a18.row_key)
join ldb.d_incident_business_service_criticality a143
on (a18.criticality_key = a143.row_key)
union
select 'ldb.d_incident_business_service_used_for a144 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a14
on (a11.incident_key = a14.row_key) join ldb.d_incident_business_service a18
on (a14.business_service_key = a18.row_key)
join ldb.d_incident_business_service_used_for a144
on (a18.used_for_src_key = a144.row_key)
union
select 'ldb.d_incident_calendar_year a145 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident_date a19
on (a11.incident_date_key = a19.row_key) join ldb.d_incident_calendar_month a110
on (a19.month_start_date_key = a110.row_key) join ldb.d_incident_calendar_quarter a111
on (a110.quarter_start_date_key = a111.row_key)
join ldb.d_incident_calendar_year a145
on (a111.year_start_date_key = a145.row_key)
