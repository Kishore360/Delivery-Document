select 'ldb.f_incident a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
union
select 'ldb.d_incident a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
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
on (a11.opened_on_key = a16.row_key)
union
select 'ldb.d_change_request_caused_by a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_change_request_caused_by a17
on (a11.caused_by_change_key = a17.row_key)
union
select 'ldb.d_configuration_item a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_configuration_item a18
on (a11.configuration_item_key = a18.row_key)
union
select 'ldb.d_customer a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_customer a19
on (a11.customer_key = a19.row_key)
union
select 'ldb.d_internal_contact a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_internal_contact a110
on (a11.opened_by_key = a110.row_key)
union
select 'ldb.d_calendar_time a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_time a111
on (a11.opened_time_key = a111.row_key)
union
select 'ldb.d_parent_incident a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_parent_incident a112
on (a12.parent_incident_key = a112.row_key)
union
select 'ldb.d_task_parent_task_c a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_task_parent_task_c a113
on (a12.parent_task_c_key = a113.row_key)
union
select 'ldb.d_problem a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_problem a114
on (a11.problem_key = a114.row_key)
union
select 'ldb.d_tribe_c a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_tribe_c a115
on (a11.tribe_c_key = a115.row_key)
union
select 'ldb.d_segment_c a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_tribe_c a115
on (a11.tribe_c_key = a115.row_key)
join ldb.d_segment_c a116
on (a115.segment_c_key = a116.row_key)
union
select 'ldb.d_case a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_case a117
on (a11.case_key = a117.row_key)
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
select 'ldb.d_incident_impact a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident_impact a121
on (a11.impact_src_key = a121.row_key)
union
select 'ldb.d_incident_urgency a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident_urgency a122
on (a11.urgency_src_key = a122.row_key)
union
select 'ldb.d_location a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_location a123
on (a11.location_key = a123.row_key)
union
select 'ldb.d_business_service_criticality a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_business_service a15
on (a11.business_service_key = a15.row_key)
join ldb.d_business_service_criticality a124
on (a15.criticality_key = a124.row_key)
union
select 'ldb.d_business_service_used_for a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_business_service a15
on (a11.business_service_key = a15.row_key)
join ldb.d_business_service_used_for a125
on (a15.used_for_src_key = a125.row_key)
union
select 'ldb.d_calendar_month a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_date a16
on (a11.opened_on_key = a16.row_key)
join ldb.d_calendar_month a126
on (a16.month_start_date_key = a126.row_key)
union
select 'ldb.d_calendar_week a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_date a16
on (a11.opened_on_key = a16.row_key)
join ldb.d_calendar_week a127
on (a16.week_start_date_key = a127.row_key)
union
select 'ldb.d_customer_mdm a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_customer a19
on (a11.customer_key = a19.row_key)
join ldb.d_customer_mdm a128
on (a19.row_current_key = a128.row_current_key)
union
select 'ldb.d_internal_organization_department a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_internal_contact a110
on (a11.opened_by_key = a110.row_key)
join ldb.d_internal_organization_department a129
on (a110.department_key = a129.row_key)
union
select 'ldb.d_calendar_time_hour a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_time a111
on (a11.opened_time_key = a111.row_key)
join ldb.d_calendar_time_hour a130
on (a111.hour_24_format_num = a130.hour_24_format_num)
union
select 'ldb.d_incident_caller a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_incident_caller a131
on (a12.caller_key = a131.row_key)
union
select 'ldb.d_incident_category a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_incident_category a132
on (a12.category_src_key = a132.row_key)
union
select 'ldb.d_incident_close_code a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_incident_close_code a133
on (a12.close_code_src_key = a133.row_key)
union
select 'ldb.d_incident_opened_by a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_incident_opened_by a134
on (a12.opened_by_key = a134.row_key)
union
select 'ldb.d_incident_priority a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_incident_priority a135
on (a12.priority_src_key = a135.row_key)
union
select 'ldb.d_task_sla_resolution_flag a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_task_sla_resolution_flag a136
on (a12.met_resolution_sla_flag_key = a136.row_key)
union
select 'ldb.d_task_sla_response_flag a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_task_sla_response_flag a137
on (a12.met_response_sla_flag_key = a137.row_key)
union
select 'ldb.d_incident_severity a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_incident_severity a138
on (a12.severity_src_key = a138.row_key)
union
select 'ldb.d_incident_state a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_incident_state a139
on (a12.state_src_key = a139.row_key)
union
select 'ldb.d_incident_subcategory a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_incident_subcategory a140
on (a12.sub_category_src_key = a140.row_key)
union
select 'ldb.d_parent_problem_c a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_problem a114
on (a11.problem_key = a114.row_key)
join ldb.d_parent_problem_c a141
on (a114.parent_problem_c_key = a141.row_key)
union
select 'ldb.d_calendar_quarter a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_date a16
on (a11.opened_on_key = a16.row_key)
join ldb.d_calendar_quarter a142
on (a16.quarter_start_date_key = a142.row_key)
union
select 'ldb.d_lov_incident_status_c a143 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_lov_incident_status_c a143
on (a12.incident_status_c_key = a143.row_key)
union
select 'ldb.d_configuration_item_parent_c a144 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key) join ldb.d_parent_incident a112
on (a12.parent_incident_key = a112.row_key)
join ldb.d_configuration_item_parent_c a144
on (a112.configuration_item_key = a144.row_key)
union
select 'ldb.d_internal_contact_general_manager_c a145 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_tribe_c a115
on (a11.tribe_c_key = a115.row_key) join ldb.d_segment_c a116
on (a115.segment_c_key = a116.row_key)
join ldb.d_internal_contact_general_manager_c a145
on (a116.general_manager_c_key = a145.row_key)
union
select 'ldb.d_lov_segment_type_c a146 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_tribe_c a115
on (a11.tribe_c_key = a115.row_key) join ldb.d_segment_c a116
on (a115.segment_c_key = a116.row_key)
join ldb.d_lov_segment_type_c a146
on (a116.segment_type_c_key = a146.row_key)
union
select 'ldb.d_calendar_year a147 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11
join ldb.d_calendar_date a16
on (a11.opened_on_key = a16.row_key)
join ldb.d_calendar_year a147
on (a16.year_start_date_key = a147.row_key)
