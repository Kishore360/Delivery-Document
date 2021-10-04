select 'ldb.f_incident_resolved a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11 
union
select 'ldb.d_customer a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11 
join ldb.d_customer a12 
on (a11.customer_key = a12.row_key) 
union
select 'ldb.d_internal_contact a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) 
union
select 'ldb.d_calendar_time a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11 
join ldb.d_calendar_time a14 
on (a11.opened_time_key = a14.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11 
join ldb.d_internal_contact_assigned_to a15 
on (a11.assigned_to_key = a15.row_key) 
union
select 'ldb.d_internal_organization_group a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11 
join ldb.d_internal_organization_group a16 
on (a11.assignment_group_key = a16.row_key) 
union
select 'ldb.d_business_service a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11 
join ldb.d_business_service a17 
on (a11.business_service_key = a17.row_key) 
union
select 'ldb.d_incident a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11 
join ldb.d_incident a18 
on (a11.incident_key = a18.row_key) 
union
select 'ldb.d_calendar_date a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11 
join ldb.d_calendar_date a19 
on (a11.last_resolved_on_key = a19.row_key) 
union
select 'ldb.d_configuration_item a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11 
join ldb.d_configuration_item a110 
on (a11.configuration_item_key = a110.row_key) 
union
select 'ldb.d_incident_priority a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11 
join ldb.d_incident a18 
on (a11.incident_key = a18.row_key) 
join ldb.d_incident_priority a111 
on (a18.priority_src_key = a111.row_key) 
union
select 'ldb.d_calendar_week a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11 
join ldb.d_calendar_date a19 
on (a11.last_resolved_on_key = a19.row_key) 
join ldb.d_calendar_week a112 
on (a19.week_start_date_key = a112.row_key) 
union
select 'ldb.d_calendar_year a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11 
join ldb.d_calendar_date a19 
on (a11.last_resolved_on_key = a19.row_key) 
join ldb.d_calendar_year a113 
on (a19.year_start_date_key = a113.row_key) 
union
select 'ldb.d_calendar_month a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11 
join ldb.d_calendar_date a19 
on (a11.last_resolved_on_key = a19.row_key) 
join ldb.d_calendar_month a114 
on (a19.month_start_date_key = a114.row_key) 
union
select 'ldb.d_internal_contact_incident_reported_by_c a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11 
join ldb.d_internal_contact_incident_reported_by_c a115 
on (a11.opened_by_key = a115.row_key) 
union
select 'ldb.d_change_request_caused_by a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11 
join ldb.d_change_request_caused_by a116 
on (a11.caused_by_change_key = a116.row_key) 
union
select 'ldb.d_change_request a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11 
join ldb.d_change_request a117 
on (a11.change_request_key = a117.row_key) 
union
select 'ldb.d_internal_organization_legalentity a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11 
join ldb.d_internal_organization_legalentity a118 
on (a11.company_key = a118.row_key) 
union
select 'ldb.d_customer_mdm a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11 
join ldb.d_customer a12 
on (a11.customer_key = a12.row_key) 
join ldb.d_customer_mdm a119 
on (a12.row_current_key = a119.row_current_key) 
union
select 'ldb.d_internal_organization_department a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) 
join ldb.d_internal_organization_department a120 
on (a13.department_key = a120.row_key) 
union
select 'ldb.d_domain a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11 
join ldb.d_domain a121 
on (a11.domain_key = a121.row_key) 
union
select 'ldb.d_internal_contact_mdm a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) 
join ldb.d_internal_contact_mdm a122 
on (a13.row_current_key = a122.row_current_key) 
union
select 'ldb.d_calendar_time_hour a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11 
join ldb.d_calendar_time a14 
on (a11.opened_time_key = a14.row_key) 
join ldb.d_calendar_time_hour a123 
on (a14.hour_24_format_num = a123.hour_24_format_num) 
union
select 'ldb.d_internal_contact_incident_closed_by_c a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11 
join ldb.d_internal_contact_incident_closed_by_c a124 
on (a11.closed_by_key = a124.row_key) 
union
select 'ldb.d_incident_contacttype a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11 
join ldb.d_incident_contacttype a125 
on (a11.reported_type_src_key = a125.row_key) 
union
select 'ldb.d_incident_impact a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11 
join ldb.d_incident_impact a126 
on (a11.impact_src_key = a126.row_key) 
union
select 'ldb.d_internal_contact_opened_by_c a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11 
join ldb.d_internal_contact_opened_by_c a127 
on (a11.opened_by_c_key = a127.row_key) 
union
select 'ldb.d_incident_urgency a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11 
join ldb.d_incident_urgency a128 
on (a11.urgency_src_key = a128.row_key) 
union
select 'ldb.d_request_item_original_c a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11 
join ldb.d_request_item_original_c a129 
on (a11.original_request_item_c_key = a129.row_key) 
union
select 'ldb.d_problem a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11 
join ldb.d_problem a130 
on (a11.problem_key = a130.row_key) 
union
select 'ldb.d_scafe_core_realm_c a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11 
join ldb.d_scafe_core_realm_c a131 
on (a11.scafe_core_realm_c_key = a131.row_key) 
union
select 'ldb.d_internal_contact a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11 
join ldb.d_internal_contact a132 
on (a11.last_resolved_by_key = a132.row_key) 
union
select 'ldb.d_lov_incident_u_subcategory_c a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11 
join ldb.d_lov_incident_u_subcategory_c a133 
on (a11.subcategory_lov_c_key = a133.row_key) 
union
select 'ldb.d_location a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11 
join ldb.d_location a134 
on (a11.location_key = a134.row_key) 
union
select 'ldb.d_internal_contact_assignment_group_manager_c a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11 
join ldb.d_internal_organization_group a16 
on (a11.assignment_group_key = a16.row_key) 
join ldb.d_internal_contact_assignment_group_manager_c a135 
on (a16.manager_c_key = a135.row_key) 
union
select 'ldb.d_lov_service_access_c a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11 
join ldb.d_business_service a17 
on (a11.business_service_key = a17.row_key) 
join ldb.d_lov_service_access_c a136 
on (a17.access_c_key = a136.row_key) 
union
select 'ldb.d_business_service_criticality a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11 
join ldb.d_business_service a17 
on (a11.business_service_key = a17.row_key) 
join ldb.d_business_service_criticality a137 
on (a17.criticality_key = a137.row_key) 
union
select 'ldb.d_business_service_used_for a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11 
join ldb.d_business_service a17 
on (a11.business_service_key = a17.row_key) 
join ldb.d_business_service_used_for a138 
on (a17.used_for_src_key = a138.row_key) 
union
select 'ldb.d_incident_category a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11 
join ldb.d_incident a18 
on (a11.incident_key = a18.row_key) 
join ldb.d_incident_category a139 
on (a18.category_src_key = a139.row_key) 
union
select 'ldb.d_incident_close_code a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11 
join ldb.d_incident a18 
on (a11.incident_key = a18.row_key) 
join ldb.d_incident_close_code a140 
on (a18.close_code_src_key = a140.row_key) 
union
select 'ldb.d_lov_incident_legacy_ci_name_c a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11 
join ldb.d_incident a18 
on (a11.incident_key = a18.row_key) 
join ldb.d_lov_incident_legacy_ci_name_c a141 
on (a18.legacy_ci_name_c_key = a141.row_key) 
union
select 'ldb.d_lov_incident_pending_reason_c a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11 
join ldb.d_incident a18 
on (a11.incident_key = a18.row_key) 
join ldb.d_lov_incident_pending_reason_c a142 
on (a18.pending_reason_c_key = a142.row_key) 
union
select 'ldb.d_task_sla_resolution_flag a143 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11 
join ldb.d_incident a18 
on (a11.incident_key = a18.row_key) 
join ldb.d_task_sla_resolution_flag a143 
on (a18.met_resolution_sla_flag_key = a143.row_key) 
union
select 'ldb.d_task_sla_response_flag a144 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11 
join ldb.d_incident a18 
on (a11.incident_key = a18.row_key) 
join ldb.d_task_sla_response_flag a144 
on (a18.met_response_sla_flag_key = a144.row_key) 
union
select 'ldb.d_incident_severity a145 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11 
join ldb.d_incident a18 
on (a11.incident_key = a18.row_key) 
join ldb.d_incident_severity a145 
on (a18.severity_src_key = a145.row_key) 
union
select 'ldb.d_incident_state a146 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11 
join ldb.d_incident a18 
on (a11.incident_key = a18.row_key) 
join ldb.d_incident_state a146 
on (a18.state_src_key = a146.row_key) 
union
select 'ldb.d_lov_incident_type_c a147 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11 
join ldb.d_incident a18 
on (a11.incident_key = a18.row_key) 
join ldb.d_lov_incident_type_c a147 
on (a18.incident_type_c_key = a147.row_key) 
union
select 'ldb.d_lov_incident_workplace_location_c a148 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11 
join ldb.d_incident a18 
on (a11.incident_key = a18.row_key) 
join ldb.d_lov_incident_workplace_location_c a148 
on (a18.workplace_location_c_key = a148.row_key) 
union
select 'ldb.d_lov_incident_situation_c a149 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11 
join ldb.d_incident a18 
on (a11.incident_key = a18.row_key) 
join ldb.d_lov_incident_situation_c a149 
on (a18.situation_c_key = a149.row_key) 
union
select 'ldb.d_calendar_quarter a150 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_resolved a11 
join ldb.d_calendar_date a19 
on (a11.last_resolved_on_key = a19.row_key) 
join ldb.d_calendar_quarter a150 
on (a19.quarter_start_date_key = a150.row_key) 