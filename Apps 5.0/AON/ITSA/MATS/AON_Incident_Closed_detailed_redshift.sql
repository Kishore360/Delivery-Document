select 'ldb.f_incident_closed a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
union
select 'ldb.d_internal_organization_service_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_internal_organization_service_c a12 
on (a11.assignment_group_key = a12.row_key) 
union
select 'ldb.d_internal_organization_technical_service_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_internal_organization_service_c a12 
on (a11.assignment_group_key = a12.row_key) 
join ldb.d_internal_organization_technical_service_c a13 
on (a12.technical_service_c_key = a13.row_key) 
union
select 'ldb.d_customer a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_customer a14 
on (a11.customer_key = a14.row_key) 
union
select 'ldb.d_internal_contact a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_internal_contact a15 
on (a11.closed_by_key = a15.row_key) 
union
select 'ldb.d_calendar_time a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_calendar_time a16 
on (a11.opened_time_key = a16.row_key) 
union
select 'ldb.d_incident a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_incident a17 
on (a11.incident_key = a17.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_internal_contact_assigned_to a18 
on (a11.assigned_to_key = a18.row_key) 
union
select 'ldb.d_internal_organization_group a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_internal_organization_group a19 
on (a11.assignment_group_key = a19.row_key) 
union
select 'ldb.d_business_service a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_business_service a110 
on (a11.business_service_key = a110.row_key) 
union
select 'ldb.d_configuration_item a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_configuration_item a111 
on (a11.configuration_item_key = a111.row_key) 
union
select 'ldb.d_technical_service_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_technical_service_c a112 
on (a11.technical_service_c_key = a112.row_key) 
union
select 'ldb.d_calendar_date a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_calendar_date a113 
on (a11.closed_on_key = a113.row_key) 
union
select 'ldb.d_change_request a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_change_request a114 
on (a11.change_request_key = a114.row_key) 
union
select 'ldb.d_internal_contact_requested_for_c a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_internal_contact_requested_for_c a115 
on (a11.requested_for_c_key = a115.row_key) 
union
select 'ldb.d_location_requested_for_c a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_internal_contact_requested_for_c a115 
on (a11.requested_for_c_key = a115.row_key) 
join ldb.d_location_requested_for_c a116 
on (a115.location_key = a116.row_key) 
union
select 'ldb.d_calendar_quarter a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_calendar_date a113 
on (a11.closed_on_key = a113.row_key) 
join ldb.d_calendar_quarter a117 
on (a113.quarter_start_date_key = a117.row_key) 
union
select 'ldb.d_calendar_week a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_calendar_date a113 
on (a11.closed_on_key = a113.row_key) 
join ldb.d_calendar_week a118 
on (a113.week_start_date_key = a118.row_key) 
union
select 'ldb.d_parent_incident a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_incident a17 
on (a11.incident_key = a17.row_key) 
join ldb.d_parent_incident a119 
on (a17.parent_incident_key = a119.row_key) 
union
select 'ldb.d_internal_contact a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_internal_contact a120 
on (a11.last_resolved_by_key = a120.row_key) 
union
select 'ldb.d_change_request_caused_by a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_change_request_caused_by a121 
on (a11.caused_by_change_key = a121.row_key) 
union
select 'ldb.d_internal_organization_legalentity a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_internal_organization_legalentity a122 
on (a11.company_key = a122.row_key) 
union
select 'ldb.d_customer_mdm a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_customer a14 
on (a11.customer_key = a14.row_key) 
join ldb.d_customer_mdm a123 
on (a14.row_current_key = a123.row_current_key) 
union
select 'ldb.d_internal_organization_department a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_internal_contact a15 
on (a11.closed_by_key = a15.row_key) 
join ldb.d_internal_organization_department a124 
on (a15.department_key = a124.row_key) 
union
select 'ldb.d_domain a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_domain a125 
on (a11.domain_key = a125.row_key) 
union
select 'ldb.d_internal_contact_mdm a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_internal_contact a15 
on (a11.closed_by_key = a15.row_key) 
join ldb.d_internal_contact_mdm a126 
on (a15.row_current_key = a126.row_current_key) 
union
select 'ldb.d_calendar_time_hour a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_calendar_time a16 
on (a11.opened_time_key = a16.row_key) 
join ldb.d_calendar_time_hour a127 
on (a16.hour_24_format_num = a127.hour_24_format_num) 
union
select 'ldb.d_incident_contacttype a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_incident_contacttype a128 
on (a11.reported_type_src_key = a128.row_key) 
union
select 'ldb.d_incident_impact a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_incident_impact a129 
on (a11.impact_src_key = a129.row_key) 
union
select 'ldb.d_lov_incident_inc_recovery_c a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_lov_incident_inc_recovery_c a130 
on (a11.inc_recovery_state_src_c_key = a130.row_key) 
union
select 'ldb.d_lov_incident_inc_restored_by_c a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_lov_incident_inc_restored_by_c a131 
on (a11.inc_restored_by_src_c_key = a131.row_key) 
union
select 'ldb.d_incident_urgency a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_incident_urgency a132 
on (a11.urgency_src_key = a132.row_key) 
union
select 'ldb.d_location a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_location a133 
on (a11.location_key = a133.row_key) 
union
select 'ldb.d_product_cat_item_c a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_product_cat_item_c a134 
on (a11.product_key = a134.row_key) 
union
select 'ldb.d_internal_organization_resolved_by_group_c a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_internal_organization_resolved_by_group_c a135 
on (a11.resolved_by_group_key = a135.row_key) 
union
select 'ldb.d_incident_subcategory_c a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_incident_subcategory_c a136 
on (a11.sub_category_src_c_key = a136.row_key) 
union
select 'ldb.d_lov_symptom_c a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_lov_symptom_c a137 
on (a11.symptom_src_c_key = a137.row_key) 
union
select 'ldb.d_lov_incident_tracc_managed_c a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_lov_incident_tracc_managed_c a138 
on (a11.tracc_mim_managed_src_c_key = a138.row_key) 
union
select 'ldb.d_business_service_criticality a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_business_service a110 
on (a11.business_service_key = a110.row_key) 
join ldb.d_business_service_criticality a139 
on (a110.criticality_key = a139.row_key) 
union
select 'ldb.d_business_service_used_for a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_business_service a110 
on (a11.business_service_key = a110.row_key) 
join ldb.d_business_service_used_for a140 
on (a110.used_for_src_key = a140.row_key) 
union
select 'ldb.d_calendar_month a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_calendar_date a113 
on (a11.closed_on_key = a113.row_key) 
join ldb.d_calendar_month a141 
on (a113.month_start_date_key = a141.row_key) 
union
select 'ldb.d_incident_category a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_incident a17 
on (a11.incident_key = a17.row_key) 
join ldb.d_incident_category a142 
on (a17.category_src_key = a142.row_key) 
union
select 'ldb.d_incident_close_code a143 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_incident a17 
on (a11.incident_key = a17.row_key) 
join ldb.d_incident_close_code a143 
on (a17.close_code_src_key = a143.row_key) 
union
select 'ldb.d_incident_opened_by a144 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_incident a17 
on (a11.incident_key = a17.row_key) 
join ldb.d_incident_opened_by a144 
on (a17.closed_by_key = a144.row_key) 
union
select 'ldb.d_incident_priority a145 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_incident a17 
on (a11.incident_key = a17.row_key) 
join ldb.d_incident_priority a145 
on (a17.priority_src_key = a145.row_key) 
union
select 'ldb.d_task_sla_resolution_flag a146 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_incident a17 
on (a11.incident_key = a17.row_key) 
join ldb.d_task_sla_resolution_flag a146 
on (a17.met_resolution_sla_flag_key = a146.row_key) 
union
select 'ldb.d_task_sla_response_flag a147 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_incident a17 
on (a11.incident_key = a17.row_key) 
join ldb.d_task_sla_response_flag a147 
on (a17.met_response_sla_flag_key = a147.row_key) 
union
select 'ldb.d_incident_severity a148 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_incident a17 
on (a11.incident_key = a17.row_key) 
join ldb.d_incident_severity a148 
on (a17.severity_src_key = a148.row_key) 
union
select 'ldb.d_incident_state a149 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_incident a17 
on (a11.incident_key = a17.row_key) 
join ldb.d_incident_state a149 
on (a17.state_src_key = a149.row_key) 
union
select 'ldb.d_incident_subcategory a150 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_incident a17 
on (a11.incident_key = a17.row_key) 
join ldb.d_incident_subcategory a150 
on (a17.sub_category_src_key = a150.row_key) 
union
select 'ldb.d_internal_organization_department_requested_for_c a151 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_internal_contact_requested_for_c a115 
on (a11.requested_for_c_key = a115.row_key) 
join ldb.d_internal_organization_department_requested_for_c a151 
on (a115.department_key = a151.row_key) 
union
select 'ldb.d_location_resolved_by_c a152 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_internal_contact a120 
on (a11.last_resolved_by_key = a120.row_key) 
join ldb.d_location_resolved_by_c a152 
on (a120.location_key = a152.row_key) 
union
select 'ldb.d_calendar_year a153 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_calendar_date a113 
on (a11.closed_on_key = a113.row_key) 
join ldb.d_calendar_year a153 
on (a113.year_start_date_key = a153.row_key) 
