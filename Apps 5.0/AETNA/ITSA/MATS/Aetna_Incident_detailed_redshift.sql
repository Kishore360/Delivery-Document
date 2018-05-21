select 'ldb.f_incident a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
union
select 'ldb.d_customer a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_customer a12 
on (a11.customer_key = a12.row_key) 
union
select 'ldb.d_internal_contact a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) 
union
select 'ldb.d_calendar_time a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_time a14 
on (a11.opened_time_key = a14.row_key) 
union
select 'ldb.d_problem a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_problem a15 
on (a11.problem_key = a15.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_assigned_to a16 
on (a11.assigned_to_key = a16.row_key) 
union
select 'ldb.d_internal_organization_group a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a17 
on (a11.assignment_group_key = a17.row_key) 
union
select 'ldb.d_business_service a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_business_service a18 
on (a11.business_service_key = a18.row_key) 
union
select 'ldb.d_calendar_date a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a19 
on (a11.opened_on_key = a19.row_key) 
union
select 'ldb.d_change_request_caused_by a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_change_request_caused_by a110 
on (a11.caused_by_change_key = a110.row_key) 
union
select 'ldb.d_change_request a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_change_request a111 
on (a11.change_request_key = a111.row_key) 
union
select 'ldb.d_incident a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a112 
on (a11.incident_key = a112.row_key) 
union
select 'ldb.d_configuration_item a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_configuration_item a113 
on (a11.configuration_item_key = a113.row_key) 
union
select 'ldb.d_calendar_date_closed_c a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date_closed_c a114 
on (a11.closed_on_key = a114.row_key) 
union
select 'ldb.d_calendar_date_opened_c a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date_opened_c a115 
on (a11.opened_on_key = a115.row_key) 
union
select 'ldb.d_calendar_month a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a19 
on (a11.opened_on_key = a19.row_key) 
join ldb.d_calendar_month a116 
on (a19.month_start_date_key = a116.row_key) 
union
select 'ldb.d_calendar_quarter a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a19 
on (a11.opened_on_key = a19.row_key) 
join ldb.d_calendar_quarter a117 
on (a19.quarter_start_date_key = a117.row_key) 
union
select 'ldb.d_calendar_week a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a19 
on (a11.opened_on_key = a19.row_key) 
join ldb.d_calendar_week a118 
on (a19.week_start_date_key = a118.row_key) 
union
select 'ldb.d_calendar_year a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a19 
on (a11.opened_on_key = a19.row_key) 
join ldb.d_calendar_year a119 
on (a19.year_start_date_key = a119.row_key) 
union
select 'ldb.d_parent_incident a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a112 
on (a11.incident_key = a112.row_key) 
join ldb.d_parent_incident a120 
on (a112.parent_incident_key = a120.row_key) 
union
select 'ldb.d_intenal_contact_caller_c a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a112 
on (a11.incident_key = a112.row_key) 
join ldb.d_intenal_contact_caller_c a121 
on (a112.caller_key = a121.row_key) 
union
select 'ldb.d_internal_organization_legalentity a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_legalentity a122 
on (a11.company_key = a122.row_key) 
union
select 'ldb.d_customer_mdm a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_customer a12 
on (a11.customer_key = a12.row_key) 
join ldb.d_customer_mdm a123 
on (a12.row_current_key = a123.row_current_key) 
union
select 'ldb.d_internal_organization_department a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) 
join ldb.d_internal_organization_department a124 
on (a13.department_key = a124.row_key) 
union
select 'ldb.d_domain a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_domain a125 
on (a11.domain_key = a125.row_key) 
union
select 'ldb.d_internal_contact_mdm a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) 
join ldb.d_internal_contact_mdm a126 
on (a13.row_current_key = a126.row_current_key) 
union
select 'ldb.d_calendar_time_hour a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_time a14 
on (a11.opened_time_key = a14.row_key) 
join ldb.d_calendar_time_hour a127 
on (a14.hour_24_format_num = a127.hour_24_format_num) 
union
select 'ldb.d_incident_contacttype a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_contacttype a128 
on (a11.reported_type_src_key = a128.row_key) 
union
select 'ldb.d_incident_impact a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_impact a129 
on (a11.impact_src_key = a129.row_key) 
union
select 'ldb.d_incident_urgency a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_urgency a130 
on (a11.urgency_src_key = a130.row_key) 
union
select 'ldb.d_location a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_location a131 
on (a11.location_key = a131.row_key) 
union
select 'ldb.d_internal_organization_primary_technical_team_c a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_primary_technical_team_c a132 
on (a11.primary_technical_team_c_key = a132.row_key) 
union
select 'ldb.d_business_service_criticality a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_business_service a18 
on (a11.business_service_key = a18.row_key) 
join ldb.d_business_service_criticality a133 
on (a18.criticality_key = a133.row_key) 
union
select 'ldb.d_business_service_used_for a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_business_service a18 
on (a11.business_service_key = a18.row_key) 
join ldb.d_business_service_used_for a134 
on (a18.used_for_src_key = a134.row_key) 
union
select 'ldb.d_location_configuration_item_c a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_configuration_item a113 
on (a11.configuration_item_key = a113.row_key) 
join ldb.d_location_configuration_item_c a135 
on (a113.location_key = a135.row_key) 
union
select 'ldb.d_incident_category a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a112 
on (a11.incident_key = a112.row_key) 
join ldb.d_incident_category a136 
on (a112.category_src_key = a136.row_key) 
union
select 'ldb.d_incident_close_code a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a112 
on (a11.incident_key = a112.row_key) 
join ldb.d_incident_close_code a137 
on (a112.close_code_src_key = a137.row_key) 
union
select 'ldb.d_incident_priority a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a112 
on (a11.incident_key = a112.row_key) 
join ldb.d_incident_priority a138 
on (a112.priority_src_key = a138.row_key) 
union
select 'ldb.d_task_sla_resolution_flag a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a112 
on (a11.incident_key = a112.row_key) 
join ldb.d_task_sla_resolution_flag a139 
on (a112.met_resolution_sla_flag_key = a139.row_key) 
union
select 'ldb.d_task_sla_response_flag a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a112 
on (a11.incident_key = a112.row_key) 
join ldb.d_task_sla_response_flag a140 
on (a112.met_response_sla_flag_key = a140.row_key) 
union
select 'ldb.d_incident_severity a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a112 
on (a11.incident_key = a112.row_key) 
join ldb.d_incident_severity a141 
on (a112.severity_src_key = a141.row_key) 
union
select 'ldb.d_incident_state a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a112 
on (a11.incident_key = a112.row_key) 
join ldb.d_incident_state a142 
on (a112.state_src_key = a142.row_key) 
union
select 'ldb.d_incident_subcategory a143 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a112 
on (a11.incident_key = a112.row_key) 
join ldb.d_incident_subcategory a143 
on (a112.sub_category_src_key = a143.row_key) 
union
select 'ldb.d_location_caller_c a144 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a112 
on (a11.incident_key = a112.row_key) join ldb.d_intenal_contact_caller_c a121 
on (a112.caller_key = a121.row_key) 
join ldb.d_location_caller_c a144 
on (a121.location_key = a144.row_key) 
