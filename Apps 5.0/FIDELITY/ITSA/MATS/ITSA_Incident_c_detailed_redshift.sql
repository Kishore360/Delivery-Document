select 'ldb.f_incident a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
union
select 'ldb.d_incident a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a12 
on (a11.incident_key = a12.row_key) 
union
select 'ldb.d_lov_incident_impacted_audience_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a12 
on (a11.incident_key = a12.row_key) 
join ldb.d_lov_incident_impacted_audience_c a13 
on (a12.impacted_audience_src_c_key = a13.row_key) 
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
on (a11.opened_on_key = a110.row_key) 
union
select 'ldb.d_change_request a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_change_request a111 
on (a11.change_request_key = a111.row_key) 
union
select 'ldb.d_configuration_item a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_configuration_item a112 
on (a11.configuration_item_key = a112.row_key) 
union
select 'ldb.d_parent_incident a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a12 
on (a11.incident_key = a12.row_key) 
join ldb.d_parent_incident a113 
on (a12.parent_incident_key = a113.row_key) 
union
select 'ldb.d_change_request_caused_by a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_change_request_caused_by a114 
on (a11.caused_by_change_key = a114.row_key) 
union
select 'ldb.d_internal_organization_legalentity a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_legalentity a115 
on (a11.company_key = a115.row_key) 
union
select 'ldb.d_customer_mdm a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_customer a14 
on (a11.customer_key = a14.row_key) 
join ldb.d_customer_mdm a116 
on (a14.row_current_key = a116.row_current_key) 
union
select 'ldb.d_internal_organization_department a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a15 
on (a11.opened_by_key = a15.row_key) 
join ldb.d_internal_organization_department a117 
on (a15.department_key = a117.row_key) 
union
select 'ldb.d_lov_incident_discovery_method_c a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a12 
on (a11.incident_key = a12.row_key) 
join ldb.d_lov_incident_discovery_method_c a118 
on (a12.discovery_method_src_c_key = a118.row_key) 
union
select 'ldb.d_domain a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_domain a119 
on (a11.domain_key = a119.row_key) 
union
select 'ldb.d_internal_contact_mdm a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a15 
on (a11.opened_by_key = a15.row_key) 
join ldb.d_internal_contact_mdm a120 
on (a15.row_current_key = a120.row_current_key) 
union
select 'ldb.d_lov_incident_environment_c a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a12 
on (a11.incident_key = a12.row_key) 
join ldb.d_lov_incident_environment_c a121 
on (a12.environment_src_c_key = a121.row_key) 
union
select 'ldb.d_calendar_time_hour a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_time a16 
on (a11.opened_time_key = a16.row_key) 
join ldb.d_calendar_time_hour a122 
on (a16.hour_24_format_num = a122.hour_24_format_num) 
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
select 'ldb.d_internal_contact_major_incident_manager_c a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_major_incident_manager_c a125 
on (a11.major_incident_manager_c_key = a125.row_key) 
union
select 'ldb.d_incident_urgency a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_urgency a126 
on (a11.urgency_src_key = a126.row_key) 
union
select 'ldb.d_location a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_location a127 
on (a11.location_key = a127.row_key) 
union
select 'ldb.d_lov_incident_loss_of_service_c a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a12 
on (a11.incident_key = a12.row_key) 
join ldb.d_lov_incident_loss_of_service_c a128 
on (a12.loss_of_service_src_c_key = a128.row_key) 
union
select 'ldb.d_internal_contact_on_behalf_of_c a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_on_behalf_of_c a129 
on (a11.on_behalf_of_c_key = a129.row_key) 
union
select 'ldb.d_internal_organization_originating_group_c a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a12 
on (a11.incident_key = a12.row_key) 
join ldb.d_internal_organization_originating_group_c a130 
on (a12.originating_group_c_key = a130.row_key) 
union
select 'ldb.d_business_service_criticality a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_business_service a19 
on (a11.business_service_key = a19.row_key) 
join ldb.d_business_service_criticality a131 
on (a19.criticality_key = a131.row_key) 
union
select 'ldb.d_business_service_used_for a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_business_service a19 
on (a11.business_service_key = a19.row_key) 
join ldb.d_business_service_used_for a132 
on (a19.used_for_src_key = a132.row_key) 
union
select 'ldb.d_calendar_month a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a110 
on (a11.opened_on_key = a110.row_key) 
join ldb.d_calendar_month a133 
on (a110.month_start_date_key = a133.row_key) 
union
select 'ldb.d_calendar_week a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a110 
on (a11.opened_on_key = a110.row_key) 
join ldb.d_calendar_week a134 
on (a110.week_start_date_key = a134.row_key) 
union
select 'ldb.d_incident_category a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a12 
on (a11.incident_key = a12.row_key) 
join ldb.d_incident_category a135 
on (a12.category_src_key = a135.row_key) 
union
select 'ldb.d_incident_close_code a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a12 
on (a11.incident_key = a12.row_key) 
join ldb.d_incident_close_code a136 
on (a12.close_code_src_key = a136.row_key) 
union
select 'ldb.d_incident_priority a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a12 
on (a11.incident_key = a12.row_key) 
join ldb.d_incident_priority a137 
on (a12.priority_src_key = a137.row_key) 
union
select 'ldb.d_task_sla_resolution_flag a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a12 
on (a11.incident_key = a12.row_key) 
join ldb.d_task_sla_resolution_flag a138 
on (a12.met_resolution_sla_flag_key = a138.row_key) 
union
select 'ldb.d_task_sla_response_flag a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a12 
on (a11.incident_key = a12.row_key) 
join ldb.d_task_sla_response_flag a139 
on (a12.met_response_sla_flag_key = a139.row_key) 
union
select 'ldb.d_incident_severity a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a12 
on (a11.incident_key = a12.row_key) 
join ldb.d_incident_severity a140 
on (a12.severity_src_key = a140.row_key) 
union
select 'ldb.d_incident_state a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a12 
on (a11.incident_key = a12.row_key) 
join ldb.d_incident_state a141 
on (a12.state_src_key = a141.row_key) 
union
select 'ldb.d_incident_subcategory a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a12 
on (a11.incident_key = a12.row_key) 
join ldb.d_incident_subcategory a142 
on (a12.sub_category_src_key = a142.row_key) 
union
select 'ldb.d_calendar_quarter a143 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a110 
on (a11.opened_on_key = a110.row_key) 
join ldb.d_calendar_quarter a143 
on (a110.quarter_start_date_key = a143.row_key) 
union
select 'ldb.d_calendar_year a144 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a110 
on (a11.opened_on_key = a110.row_key) 
join ldb.d_calendar_year a144 
on (a110.year_start_date_key = a144.row_key) 
