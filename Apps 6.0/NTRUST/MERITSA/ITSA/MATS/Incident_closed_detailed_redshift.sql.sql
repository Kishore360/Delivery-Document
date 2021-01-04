select 'ldb.f_incident_closed a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
union
select 'ldb.d_internal_contact_agent_number_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_internal_contact_agent_number_c a12 
on (a11.opened_by_key = a12.row_key) 
union
select 'ldb.d_customer a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_customer a13 
on (a11.customer_key = a13.row_key) 
union
select 'ldb.d_internal_contact a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_internal_contact a14 
on (a11.employee_key = a14.row_key) 
union
select 'ldb.d_calendar_time a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_calendar_time a15 
on (a11.time_key = a15.row_key) 
union
select 'ldb.d_location a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_location a16 
on (a11.location_key = a16.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_internal_contact_assigned_to a17 
on (a11.assigned_to_key = a17.row_key) 
union
select 'ldb.d_business_service a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_business_service a18 
on (a11.business_service_key = a18.row_key) 
union
select 'ldb.d_calendar_date a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_calendar_date a19 
on (a11.date_key = a19.row_key) 
union
select 'ldb.d_calendar_month a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_calendar_date a19 
on (a11.date_key = a19.row_key) 
join ldb.d_calendar_month a110 
on (a19.month_start_date_key = a110.row_key) 
union
select 'ldb.d_calendar_quarter a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_calendar_date a19 
on (a11.date_key = a19.row_key) join ldb.d_calendar_month a110 
on (a19.month_start_date_key = a110.row_key) 
join ldb.d_calendar_quarter a111 
on (a110.quarter_start_date_key = a111.row_key) 
union
select 'ldb.d_incident a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_incident a112 
on (a11.incident_key = a112.row_key) 
union
select 'ldb.d_change_request_caused_by a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_change_request_caused_by a113 
on (a11.caused_by_change_key = a113.row_key) 
union
select 'ldb.d_configuration_item a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_configuration_item a114 
on (a11.configuration_item_key = a114.row_key) 
union
select 'ldb.d_calendar_week a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_calendar_date a19 
on (a11.date_key = a19.row_key) 
join ldb.d_calendar_week a115 
on (a19.week_start_date_key = a115.row_key) 
union
select 'ldb.d_calendar_year a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_calendar_date a19 
on (a11.date_key = a19.row_key) join ldb.d_calendar_month a110 
on (a19.month_start_date_key = a110.row_key) join ldb.d_calendar_quarter a111 
on (a110.quarter_start_date_key = a111.row_key) 
join ldb.d_calendar_year a116 
on (a111.year_start_date_key = a116.row_key) 
union
select 'ldb.d_internal_contact_created_by_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_internal_contact_created_by_c a117 
on (a11.opened_by_key = a117.row_key) 
union
select 'ldb.d_problem a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_problem a118 
on (a11.problem_key = a118.row_key) 
union
select 'ldb.d_internal_organization_group a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_internal_organization_group a119 
on (a11.assignment_group_key = a119.row_key) 
union
select 'ldb.d_incident_call_back_for_ticket_c a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_incident_call_back_for_ticket_c a120 
on (a11.call_back_for_ticket_c_key = a120.row_key) 
union
select 'ldb.d_internal_contact_caller_c a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_internal_contact_caller_c a121 
on (a11.caller_c_key = a121.row_key) 
union
select 'ldb.d_change_request a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_change_request a122 
on (a11.change_request_key = a122.row_key) 
union
select 'ldb.d_internal_contact_closed_by_c a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_internal_contact_closed_by_c a123 
on (a11.closed_by_key = a123.row_key) 
union
select 'ldb.d_internal_organization_legalentity a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_internal_organization_legalentity a124 
on (a11.company_key = a124.row_key) 
union
select 'ldb.d_customer_mdm a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_customer a13 
on (a11.customer_key = a13.row_key) 
join ldb.d_customer_mdm a125 
on (a13.customer_mdm_key = a125.row_key) 
union
select 'ldb.d_internal_organization_department a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_internal_contact a14 
on (a11.employee_key = a14.row_key) 
join ldb.d_internal_organization_department a126 
on (a14.department_key = a126.row_key) 
union
select 'ldb.d_domain a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_domain a127 
on (a11.domain_key = a127.row_key) 
union
select 'ldb.d_calendar_time_hour a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_calendar_time a15 
on (a11.time_key = a15.row_key) 
join ldb.d_calendar_time_hour a128 
on (a15.hour_key = a128.row_key) 
union
select 'ldb.d_internal_contact_closed_by_manager_c a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_internal_contact_closed_by_manager_c a129 
on (a11.closed_by_key = a129.row_key) 
union
select 'ldb.d_incident_contacttype a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_incident_contacttype a130 
on (a11.reported_type_src_key = a130.row_key) 
union
select 'ldb.d_incident_impact a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_incident_impact a131 
on (a11.impact_src_key = a131.row_key) 
union
select 'ldb.d_lov_escalation_view_c a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_lov_escalation_view_c a132 
on (a11.escalation_c_key = a132.row_key) 
union
select 'ldb.d_incident_urgency a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_incident_urgency a133 
on (a11.urgency_src_key = a133.row_key) 
union
select 'ldb.d_lov_line_of_business_c a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_lov_line_of_business_c a134 
on (a11.line_of_business_src_c_key = a134.row_key) 
union
select 'ldb.d_internal_contact_resolved_by a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_internal_contact_resolved_by a135 
on (a11.last_resolved_by_key = a135.row_key) 
union
select 'ldb.o_data_freshness a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.o_data_freshness a136 
on (a11.source_id = a136.source_id) 
union
select 'ldb.d_business_service_criticality a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_business_service a18 
on (a11.business_service_key = a18.row_key) 
join ldb.d_business_service_criticality a137 
on (a18.criticality_key = a137.row_key) 
union
select 'ldb.d_incident_category a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_incident a112 
on (a11.incident_key = a112.row_key) 
join ldb.d_incident_category a138 
on (a112.category_src_key = a138.row_key) 
union
select 'ldb.d_incident_close_code a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_incident a112 
on (a11.incident_key = a112.row_key) 
join ldb.d_incident_close_code a139 
on (a112.close_code_src_key = a139.row_key) 
union
select 'ldb.d_incident_priority a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_incident a112 
on (a11.incident_key = a112.row_key) 
join ldb.d_incident_priority a140 
on (a112.priority_src_key = a140.row_key) 
union
select 'ldb.d_incident_severity a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_incident a112 
on (a11.incident_key = a112.row_key) 
join ldb.d_incident_severity a141 
on (a112.severity_src_key = a141.row_key) 
union
select 'ldb.d_incident_state a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_incident a112 
on (a11.incident_key = a112.row_key) 
join ldb.d_incident_state a142 
on (a112.state_src_key = a142.row_key) 
union
select 'ldb.d_incident_subcategory a143 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_incident a112 
on (a11.incident_key = a112.row_key) 
join ldb.d_incident_subcategory a143 
on (a112.sub_category_src_key = a143.row_key) 
union
select 'ldb.d_internal_contact_manager_c a144 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_internal_contact_created_by_c a117 
on (a11.opened_by_key = a117.row_key) 
join ldb.d_internal_contact_manager_c a144 
on (a117.manager_c_key = a144.row_key) 
