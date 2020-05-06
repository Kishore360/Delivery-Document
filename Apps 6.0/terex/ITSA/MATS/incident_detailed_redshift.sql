select 'ldb.f_incident a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
union
select 'ldb.d_application a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_application a12
on (a11.application_key = a12.row_key)
union
select 'ldb.d_configuration_item a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_configuration_item a13
on (a11.configuration_item_key = a13.row_key)
union
select 'ldb.d_customer a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_customer a14
on (a11.customer_key = a14.row_key)
union
select 'ldb.d_internal_contact a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_internal_contact a15
on (a11.employee_key = a15.row_key)
union
select 'ldb.d_calendar_time a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_time a16
on (a11.time_key = a16.row_key)
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
on (a11.date_key = a110.row_key)
union
select 'ldb.d_calendar_month a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_date a110
on (a11.date_key = a110.row_key)
join ldb.d_calendar_month a111
on (a110.month_start_date_key = a111.row_key)
union
select 'ldb.d_calendar_quarter a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_date a110
on (a11.date_key = a110.row_key) join ldb.d_calendar_month a111
on (a110.month_start_date_key = a111.row_key)
join ldb.d_calendar_quarter a112
on (a111.quarter_start_date_key = a112.row_key)
union
select 'ldb.d_change_request a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_change_request a113
on (a11.change_request_key = a113.row_key)
union
select 'ldb.d_configuration_item_mdm a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_configuration_item a13
on (a11.configuration_item_key = a13.row_key)
join ldb.d_configuration_item_mdm a114
on (a13.mdm_key = a114.row_key)
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
select 'ldb.d_application_mdm a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_application a12
on (a11.application_key = a12.row_key)
join ldb.d_application_mdm a117
on (a12.mdm_key = a117.row_key)
union
select 'ldb.d_change_request_caused_by a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_change_request_caused_by a118
on (a11.caused_by_change_key = a118.row_key)
union
select 'ldb.d_internal_organization_legalentity a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_internal_organization_legalentity a119
on (a11.company_key = a119.row_key)
union
select 'ldb.d_customer_mdm a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_customer a14
on (a11.customer_key = a14.row_key)
join ldb.d_customer_mdm a120
on (a14.customer_mdm_key = a120.row_key)
union
select 'ldb.d_internal_organization_department a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_internal_contact a15
on (a11.employee_key = a15.row_key)
join ldb.d_internal_organization_department a121
on (a15.department_key = a121.row_key)
union
select 'ldb.d_domain a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_domain a122
on (a11.domain_key = a122.row_key)
union
select 'ldb.d_internal_contact_mdm a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_internal_contact a15
on (a11.employee_key = a15.row_key)
join ldb.d_internal_contact_mdm a123
on (a15.employee_mdm_key = a123.row_key)
union
select 'ldb.d_calendar_time_hour a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_time a16
on (a11.time_key = a16.row_key)
join ldb.d_calendar_time_hour a124
on (a16.hour_key = a124.row_key)
union
select 'ldb.d_incident_contacttype a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident_contacttype a125
on (a11.reported_type_src_key = a125.row_key)
union
select 'ldb.d_incident_impact a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident_impact a126
on (a11.impact_src_key = a126.row_key)
union
select 'ldb.d_incident_urgency a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident_urgency a127
on (a11.urgency_src_key = a127.row_key)
union
select 'ldb.d_location a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_location a128
on (a11.location_key = a128.row_key)
union
select 'ldb.d_business_service_criticality a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_business_service a19
on (a11.business_service_key = a19.row_key)
join ldb.d_business_service_criticality a129
on (a19.criticality_key = a129.row_key)
union
select 'ldb.d_business_service_used_for a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_business_service a19
on (a11.business_service_key = a19.row_key)
join ldb.d_business_service_used_for a130
on (a19.used_for_src_key = a130.row_key)
union
select 'ldb.d_calendar_week a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_date a110
on (a11.date_key = a110.row_key)
join ldb.d_calendar_week a131
on (a110.week_start_date_key = a131.row_key)
union
select 'ldb.d_incident_category a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a115
on (a11.incident_key = a115.row_key)
join ldb.d_incident_category a132
on (a115.category_src_key = a132.row_key)
union
select 'ldb.d_incident_close_code a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a115
on (a11.incident_key = a115.row_key)
join ldb.d_incident_close_code a133
on (a115.close_code_src_key = a133.row_key)
union
select 'ldb.d_incident_priority a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a115
on (a11.incident_key = a115.row_key)
join ldb.d_incident_priority a134
on (a115.priority_src_key = a134.row_key)
union
select 'ldb.d_task_sla_resolution_flag a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a115
on (a11.incident_key = a115.row_key)
join ldb.d_task_sla_resolution_flag a135
on (a115.met_resolution_sla_flag_key = a135.row_key)
union
select 'ldb.d_task_sla_response_flag a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a115
on (a11.incident_key = a115.row_key)
join ldb.d_task_sla_response_flag a136
on (a115.met_response_sla_flag_key = a136.row_key)
union
select 'ldb.d_incident_severity a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a115
on (a11.incident_key = a115.row_key)
join ldb.d_incident_severity a137
on (a115.severity_src_key = a137.row_key)
union
select 'ldb.d_incident_state a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a115
on (a11.incident_key = a115.row_key)
join ldb.d_incident_state a138
on (a115.state_src_key = a138.row_key)
union
select 'ldb.d_incident_subcategory a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a115
on (a11.incident_key = a115.row_key)
join ldb.d_incident_subcategory a139
on (a115.sub_category_src_key = a139.row_key)
union
select 'ldb.d_calendar_year a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_date a110
on (a11.date_key = a110.row_key) join ldb.d_calendar_month a111
on (a110.month_start_date_key = a111.row_key) join ldb.d_calendar_quarter a112
on (a111.quarter_start_date_key = a112.row_key)
join ldb.d_calendar_year a140
on (a112.year_start_date_key = a140.row_key)