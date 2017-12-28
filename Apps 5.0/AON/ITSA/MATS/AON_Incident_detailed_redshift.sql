select 'ldb.f_incident a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
union
select 'ldb.d_internal_organization_service_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_service_c a12 
on (a11.assignment_group_key = a12.row_key) 
union
select 'ldb.d_internal_organization_technical_service_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_service_c a12 
on (a11.assignment_group_key = a12.row_key) 
join ldb.d_internal_organization_technical_service_c a13 
on (a12.technical_service_c_key = a13.row_key) 
union
select 'ldb.d_customer a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_customer a14 
on (a11.customer_key = a14.row_key) 
union
select 'ldb.d_internal_contact a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a15 
on (a11.opened_by_key = a15.row_key) 
union
select 'ldb.d_calendar_time a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_time a16 
on (a11.opened_time_key = a16.row_key) 
union
select 'ldb.d_incident a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a17 
on (a11.incident_key = a17.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_assigned_to a18 
on (a11.assigned_to_key = a18.row_key) 
union
select 'ldb.d_internal_organization_group a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a19 
on (a11.assignment_group_key = a19.row_key) 
union
select 'ldb.d_business_service a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_business_service a110 
on (a11.business_service_key = a110.row_key) 
union
select 'ldb.d_cmdb_ci_application_service_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_cmdb_ci_application_service_c a111 
on (a11.cmdb_ci_application_service_c_key = a111.row_key) 
union
select 'ldb.d_calendar_date a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a112 
on (a11.opened_on_key = a112.row_key) 
union
select 'ldb.d_change_request a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_change_request a113 
on (a11.change_request_key = a113.row_key) 
union
select 'ldb.d_configuration_item a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_configuration_item a114 
on (a11.configuration_item_key = a114.row_key) 
union
select 'ldb.d_technical_service_c a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_technical_service_c a115 
on (a11.technical_service_c_key = a115.row_key) 
union
select 'ldb.d_parent_incident a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a17 
on (a11.incident_key = a17.row_key) 
join ldb.d_parent_incident a116 
on (a17.parent_incident_key = a116.row_key) 
union
select 'ldb.d_internal_contact_requested_for_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_requested_for_c a117 
on (a11.requested_for_c_key = a117.row_key) 
union
select 'ldb.d_internal_contact a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a118 
on (a11.last_resolved_by_key = a118.row_key) 
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
select 'ldb.d_customer_mdm a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_customer a14 
on (a11.customer_key = a14.row_key) 
join ldb.d_customer_mdm a121 
on (a14.row_current_key = a121.row_current_key) 
union
select 'ldb.d_internal_organization_department a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a15 
on (a11.opened_by_key = a15.row_key) 
join ldb.d_internal_organization_department a122 
on (a15.department_key = a122.row_key) 
union
select 'ldb.d_domain a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_domain a123 
on (a11.domain_key = a123.row_key) 
union
select 'ldb.d_internal_contact_mdm a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a15 
on (a11.opened_by_key = a15.row_key) 
join ldb.d_internal_contact_mdm a124 
on (a15.row_current_key = a124.row_current_key) 
union
select 'ldb.d_calendar_time_hour a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_time a16 
on (a11.opened_time_key = a16.row_key) 
join ldb.d_calendar_time_hour a125 
on (a16.hour_24_format_num = a125.hour_24_format_num) 
union
select 'ldb.d_incident_contacttype a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_contacttype a126 
on (a11.reported_type_src_key = a126.row_key) 
union
select 'ldb.d_incident_impact a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_impact a127 
on (a11.impact_src_key = a127.row_key) 
union
select 'ldb.d_lov_incident_inc_recovery_c a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_lov_incident_inc_recovery_c a128 
on (a11.inc_recovery_state_src_c_key = a128.row_key) 
union
select 'ldb.d_lov_incident_inc_restored_by_c a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_lov_incident_inc_restored_by_c a129 
on (a11.inc_restored_by_src_c_key = a129.row_key) 
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
select 'ldb.d_product_cat_item_c a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_product_cat_item_c a132 
on (a11.product_key = a132.row_key) 
union
select 'ldb.d_internal_organization_resolved_by_group_c a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_resolved_by_group_c a133 
on (a11.resolved_by_group_key = a133.row_key) 
union
select 'ldb.d_lov_symptom_c a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_lov_symptom_c a134 
on (a11.symptom_src_c_key = a134.row_key) 
union
select 'ldb.d_lov_incident_tracc_managed_c a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_lov_incident_tracc_managed_c a135 
on (a11.tracc_mim_managed_src_c_key = a135.row_key) 
union
select 'ldb.d_business_service_criticality a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_business_service a110 
on (a11.business_service_key = a110.row_key) 
join ldb.d_business_service_criticality a136 
on (a110.criticality_key = a136.row_key) 
union
select 'ldb.d_business_service_used_for a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_business_service a110 
on (a11.business_service_key = a110.row_key) 
join ldb.d_business_service_used_for a137 
on (a110.used_for_src_key = a137.row_key) 
union
select 'ldb.d_calendar_month a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a112 
on (a11.opened_on_key = a112.row_key) 
join ldb.d_calendar_month a138 
on (a112.month_start_date_key = a138.row_key) 
union
select 'ldb.d_calendar_week a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a112 
on (a11.opened_on_key = a112.row_key) 
join ldb.d_calendar_week a139 
on (a112.week_start_date_key = a139.row_key) 
union
select 'ldb.d_incident_category a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a17 
on (a11.incident_key = a17.row_key) 
join ldb.d_incident_category a140 
on (a17.category_src_key = a140.row_key) 
union
select 'ldb.d_incident_close_code a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a17 
on (a11.incident_key = a17.row_key) 
join ldb.d_incident_close_code a141 
on (a17.close_code_src_key = a141.row_key) 
union
select 'ldb.d_incident_priority a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a17 
on (a11.incident_key = a17.row_key) 
join ldb.d_incident_priority a142 
on (a17.priority_src_key = a142.row_key) 
union
select 'ldb.d_task_sla_resolution_flag a143 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a17 
on (a11.incident_key = a17.row_key) 
join ldb.d_task_sla_resolution_flag a143 
on (a17.met_resolution_sla_flag_key = a143.row_key) 
union
select 'ldb.d_task_sla_response_flag a144 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a17 
on (a11.incident_key = a17.row_key) 
join ldb.d_task_sla_response_flag a144 
on (a17.met_response_sla_flag_key = a144.row_key) 
union
select 'ldb.d_incident_severity a145 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a17 
on (a11.incident_key = a17.row_key) 
join ldb.d_incident_severity a145 
on (a17.severity_src_key = a145.row_key) 
union
select 'ldb.d_incident_state a146 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a17 
on (a11.incident_key = a17.row_key) 
join ldb.d_incident_state a146 
on (a17.state_src_key = a146.row_key) 
union
select 'ldb.d_incident_subcategory a147 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a17 
on (a11.incident_key = a17.row_key) 
join ldb.d_incident_subcategory a147 
on (a17.sub_category_src_key = a147.row_key) 
union
select 'ldb.d_internal_organization_department_requested_for_c a148 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_requested_for_c a117 
on (a11.requested_for_c_key = a117.row_key) 
join ldb.d_internal_organization_department_requested_for_c a148 
on (a117.department_key = a148.row_key) 
union
select 'ldb.d_location_requested_for_c a149 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_requested_for_c a117 
on (a11.requested_for_c_key = a117.row_key) 
join ldb.d_location_requested_for_c a149 
on (a117.location_key = a149.row_key) 
union
select 'ldb.d_location_resolved_by_c a150 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a118 
on (a11.last_resolved_by_key = a118.row_key) 
join ldb.d_location_resolved_by_c a150 
on (a118.location_key = a150.row_key) 
union
select 'ldb.d_calendar_quarter a151 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a112 
on (a11.opened_on_key = a112.row_key) 
join ldb.d_calendar_quarter a151 
on (a112.quarter_start_date_key = a151.row_key) 
union
select 'ldb.d_calendar_year a152 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a112 
on (a11.opened_on_key = a112.row_key) 
join ldb.d_calendar_year a152 
on (a112.year_start_date_key = a152.row_key) 
