select 'ldb.f_incident a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
union
select 'ldb.d_configuration_item a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_configuration_item a12
on (a11.configuration_item_key = a12.row_key)
union
select 'ldb.d_incident a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a13
on (a11.incident_key = a13.row_key)
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
select 'ldb.d_parent_incident a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a13
on (a11.incident_key = a13.row_key)
join ldb.d_parent_incident a115
on (a13.parent_incident_key = a115.row_key)
union
select 'ldb.d_task_parent_task_c a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a13
on (a11.incident_key = a13.row_key)
join ldb.d_task_parent_task_c a116
on (a13.parent_task_c_key = a116.row_key)
union
select 'ldb.d_problem a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_problem a117
on (a11.problem_key = a117.row_key)
union
select 'ldb.d_segment_c a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_segment_c a118
on (a11.segment_c_key = a118.row_key)
union
select 'ldb.d_internal_organization_legalentity a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_internal_organization_legalentity a119
on (a11.company_key = a119.row_key)
union
select 'ldb.d_domain a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_domain a120
on (a11.domain_key = a120.row_key)
union
select 'ldb.d_incident_contacttype a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident_contacttype a121
on (a11.reported_type_src_key = a121.row_key)
union
select 'ldb.d_incident_impact a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident_impact a122
on (a11.impact_src_key = a122.row_key)
union
select 'ldb.d_incident_tribe_c a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident_tribe_c a123
on (a11.tribe_c_key = a123.row_key)
union
select 'ldb.d_incident_urgency a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident_urgency a124
on (a11.urgency_src_key = a124.row_key)
union
select 'ldb.d_location a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_location a125
on (a11.location_key = a125.row_key)
union
select 'ldb.d_business_service_criticality a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_business_service a16
on (a11.business_service_key = a16.row_key)
join ldb.d_business_service_criticality a126
on (a16.criticality_key = a126.row_key)
union
select 'ldb.d_business_service_used_for a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_business_service a16
on (a11.business_service_key = a16.row_key)
join ldb.d_business_service_used_for a127
on (a16.used_for_src_key = a127.row_key)
union
select 'ldb.d_calendar_week a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_date a17
on (a11.date_key = a17.row_key)
join ldb.d_calendar_week a128
on (a17.week_start_date_key = a128.row_key)
union
select 'ldb.d_customer_mdm a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_customer a112
on (a11.customer_key = a112.row_key)
join ldb.d_customer_mdm a129
on (a112.customer_mdm_key = a129.row_key)
union
select 'ldb.d_internal_organization_department a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_internal_contact a113
on (a11.employee_key = a113.row_key)
join ldb.d_internal_organization_department a130
on (a113.department_key = a130.row_key)
union
select 'ldb.d_calendar_time_hour a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_time a114
on (a11.time_key = a114.row_key)
join ldb.d_calendar_time_hour a131
on (a114.hour_key = a131.row_key)
union
select 'ldb.d_incident_caller a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a13
on (a11.incident_key = a13.row_key)
join ldb.d_incident_caller a132
on (a13.caller_key = a132.row_key)
union
select 'ldb.d_incident_category a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a13
on (a11.incident_key = a13.row_key)
join ldb.d_incident_category a133
on (a13.category_src_key = a133.row_key)
union
select 'ldb.d_incident_close_code a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a13
on (a11.incident_key = a13.row_key)
join ldb.d_incident_close_code a134
on (a13.close_code_src_key = a134.row_key)
union
select 'ldb.d_incident_opened_by a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a13
on (a11.incident_key = a13.row_key)
join ldb.d_incident_opened_by a135
on (a13.opened_by_key = a135.row_key)
union
select 'ldb.d_incident_priority a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a13
on (a11.incident_key = a13.row_key)
join ldb.d_incident_priority a136
on (a13.priority_src_key = a136.row_key)
union
select 'ldb.d_task_sla_resolution_flag a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a13
on (a11.incident_key = a13.row_key)
join ldb.d_task_sla_resolution_flag a137
on (a13.met_resolution_sla_flag_key = a137.row_key)
union
select 'ldb.d_task_sla_response_flag a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a13
on (a11.incident_key = a13.row_key)
join ldb.d_task_sla_response_flag a138
on (a13.met_response_sla_flag_key = a138.row_key)
union
select 'ldb.d_incident_severity a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a13
on (a11.incident_key = a13.row_key)
join ldb.d_incident_severity a139
on (a13.severity_src_key = a139.row_key)
union
select 'ldb.d_incident_state a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a13
on (a11.incident_key = a13.row_key)
join ldb.d_incident_state a140
on (a13.state_src_key = a140.row_key)
union
select 'ldb.d_incident_subcategory a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a13
on (a11.incident_key = a13.row_key)
join ldb.d_incident_subcategory a141
on (a13.sub_category_src_key = a141.row_key)
union
select 'ldb.d_internal_contact_general_manager_c a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_segment_c a118
on (a11.segment_c_key = a118.row_key)
join ldb.d_internal_contact_general_manager_c a142
on (a118.general_manager_c_key = a142.row_key)
union
select 'ldb.d_lov_segment_type_c a143 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_segment_c a118
on (a11.segment_c_key = a118.row_key)
join ldb.d_lov_segment_type_c a143
on (a118.segment_type_c_key = a143.row_key)
union
select 'ldb.d_parent_problem_c a144 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_problem a117
on (a11.problem_key = a117.row_key)
join ldb.d_parent_problem_c a144
on (a117.parent_problem_c_key = a144.row_key)
union
select 'ldb.d_lov_incident_status_c a145 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a13
on (a11.incident_key = a13.row_key)
join ldb.d_lov_incident_status_c a145
on (a13.incident_status_c_key = a145.row_key)
union
select 'ldb.d_configuration_item_parent_c a146 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a13
on (a11.incident_key = a13.row_key) join ldb.d_parent_incident a115
on (a13.parent_incident_key = a115.row_key)
join ldb.d_configuration_item_parent_c a146
on (a115.configuration_item_key = a146.row_key)
union
select 'ldb.d_calendar_year a147 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_date a17
on (a11.date_key = a17.row_key) join ldb.d_calendar_month a18
on (a17.month_start_date_key = a18.row_key) join ldb.d_calendar_quarter a19
on (a18.quarter_start_date_key = a19.row_key)
join ldb.d_calendar_year a147
on (a19.year_start_date_key = a147.row_key)
