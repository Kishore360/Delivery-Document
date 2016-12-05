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
select 'ldb.d_incident_variable_potential_brg_violation_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_variable_potential_brg_violation_c a15 
on (a11.incident_key = a15.row_key) 
union
select 'ldb.d_location a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_location a16 
on (a11.location_key = a16.row_key) 
union
select 'ldb.d_incident a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a17 
on (a11.incident_key = a17.row_key) 
union
select 'ldb.d_internal_organization_group a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a18 
on (a11.assignment_group_key = a18.row_key) 
union
select 'ldb.d_configuration_item a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_configuration_item a19 
on (a11.configuration_item_key = a19.row_key) 
union
select 'ldb.d_calendar_date a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a110 
on (a11.opened_on_key = a110.row_key) 
union
select 'ldb.d_incident_variable_data_impacted_c a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_variable_data_impacted_c a111 
on (a11.incident_key = a111.row_key) 
union
select 'ldb.d_incident_variable_spg_hot_escapes_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_variable_spg_hot_escapes_c a112 
on (a11.incident_key = a112.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_assigned_to a113 
on (a11.assigned_to_key = a113.row_key) 
union
select 'ldb.d_business_service_c a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_business_service_c a114 
on (a11.business_service_c_key = a114.row_key) 
union
select 'ldb.d_internal_organization_legalentity a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_legalentity a115 
on (a11.company_key = a115.row_key) 
union
select 'ldb.d_customer_mdm a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_customer a12 
on (a11.customer_key = a12.row_key) 
join ldb.d_customer_mdm a116 
on (a12.row_current_key = a116.row_current_key) 
union
select 'ldb.d_internal_organization_department a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_department a117 
on (a11.opened_by_department_key = a117.row_key) 
union
select 'ldb.d_domain a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_domain a118 
on (a11.domain_key = a118.row_key) 
union
select 'ldb.d_internal_contact_mdm a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) 
join ldb.d_internal_contact_mdm a119 
on (a13.row_current_key = a119.row_current_key) 
union
select 'ldb.d_hold_reason_c a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_hold_reason_c a120 
on (a11.hold_reason_c_key = a120.row_key) 
union
select 'ldb.d_calendar_time_hour a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_time a14 
on (a11.opened_time_key = a14.row_key) 
join ldb.d_calendar_time_hour a121 
on (a14.hour_24_format_num = a121.hour_24_format_num) 
union
select 'ldb.d_incident_category a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_category a122 
on (a11.category_src_key = a122.row_key) 
union
select 'ldb.d_incident_close_code a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_close_code a123 
on (a11.close_code_src_key = a123.row_key) 
union
select 'ldb.d_incident_severity a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_severity a124 
on (a11.severity_src_key = a124.row_key) 
union
select 'ldb.d_incident_state a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_state a125 
on (a11.state_src_key = a125.row_key) 
union
select 'ldb.d_incident_subcategory a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_subcategory a126 
on (a11.sub_category_src_key = a126.row_key) 
union
select 'ldb.d_knowledge_created_c a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_knowledge_created_c a127 
on (a11.knowledge_created_c_key = a127.row_key) 
union
select 'ldb.d_incident_met_sla_c a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_met_sla_c a128 
on (a11.incident_met_sla_c_key = a128.row_key) 
union
select 'ldb.d_variable_lov_open_closed_c a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_variable_lov_open_closed_c a129 
on (a11.open_closed_c_key = a129.row_key) 
union
select 'ldb.d_property_restricted_gp_c a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_property_restricted_gp_c a130 
on (a11.property_restricted_gp_c_key = a130.row_key) 
union
select 'ldb.d_type_c a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_type_c a131 
on (a11.type_c_key = a131.row_key) 
union
select 'ldb.d_variable_lov_status_c a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_variable_lov_status_c a132 
on (a11.status_c_key = a132.row_key) 
union
select 'ldb.d_symptom_c a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_symptom_c a133 
on (a11.symptom_c_key = a133.row_key) 
union
select 'ldb.d_task_impact a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_task_impact a134 
on (a11.impact_src_key = a134.row_key) 
union
select 'ldb.d_task_priority a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_task_priority a135 
on (a11.priority_src_key = a135.row_key) 
union
select 'ldb.d_task_contacttype a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_task_contacttype a136 
on (a11.reported_type_src_key = a136.row_key) 
union
select 'ldb.d_service_c a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_service_c a137 
on (a11.service_c_key = a137.row_key) 
union
select 'ldb.d_task_urgency a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_task_urgency a138 
on (a11.urgency_src_key = a138.row_key) 
union
select 'ldb.d_transferred_reason_c a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_transferred_reason_c a139 
on (a11.transferred_reason_c_key = a139.row_key) 
union
select 'ldb.d_type_of_impact_c a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_type_of_impact_c a140 
on (a11.type_of_impact_c_key = a140.row_key) 
union
select 'ldb.d_whos_impacted_c a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_whos_impacted_c a141 
on (a11.whos_impacted_c_key = a141.row_key) 
union
select 'ldb.d_brand_c a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_location a16 
on (a11.location_key = a16.row_key) 
join ldb.d_brand_c a142 
on (a16.brand_c_key = a142.row_key) 
union
select 'ldb.d_calendar_month a143 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a110 
on (a11.opened_on_key = a110.row_key) 
join ldb.d_calendar_month a143 
on (a110.month_start_date_key = a143.row_key) 
union
select 'ldb.d_calendar_week a144 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a110 
on (a11.opened_on_key = a110.row_key) 
join ldb.d_calendar_week a144 
on (a110.week_start_date_key = a144.row_key) 
union
select 'ldb.d_calendar_quarter a145 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a110 
on (a11.opened_on_key = a110.row_key) 
join ldb.d_calendar_quarter a145 
on (a110.quarter_start_date_key = a145.row_key) 
union
select 'ldb.d_calendar_year a146 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a110 
on (a11.opened_on_key = a110.row_key) 
join ldb.d_calendar_year a146 
on (a110.year_start_date_key = a146.row_key) 
