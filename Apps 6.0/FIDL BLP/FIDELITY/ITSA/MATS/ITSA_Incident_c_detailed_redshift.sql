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
on (a11.employee_key = a15.row_key) 
union
select 'ldb.d_calendar_time a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_time a16 
on (a11.time_key = a16.row_key) 
union
select 'ldb.d_application a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_application a17 
on (a11.application_key = a17.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_assigned_to a18 
on (a11.assigned_to_key = a18.row_key) 
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
select 'ldb.d_configuration_item a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_configuration_item a114 
on (a11.configuration_item_key = a114.row_key) 
union
select 'ldb.d_internal_contact_mdm a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a15 
on (a11.employee_key = a15.row_key) 
join ldb.d_internal_contact_mdm a115 
on (a15.employee_mdm_key = a115.row_key) 
union
select 'ldb.d_fmr_product_c a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_application a17 
on (a11.application_key = a17.row_key) 
join ldb.d_fmr_product_c a116 
on (a17.fmr_product_c_key = a116.row_key) 
union
select 'ldb.d_fmr_product_line_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_application a17 
on (a11.application_key = a17.row_key) join ldb.d_fmr_product_c a116 
on (a17.fmr_product_c_key = a116.row_key) 
join ldb.d_fmr_product_line_c a117 
on (a116.fmr_product_line_c_key = a117.row_key) 
union
select 'ldb.d_parent_incident a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a12 
on (a11.incident_key = a12.row_key) 
join ldb.d_parent_incident a118 
on (a12.parent_incident_key = a118.row_key) 
union
select 'ldb.d_internal_organization_group a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a119 
on (a11.assignment_group_key = a119.row_key) 
union
select 'ldb.d_change_request_caused_by a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_change_request_caused_by a120 
on (a11.caused_by_change_key = a120.row_key) 
union
select 'ldb.d_internal_organization_legalentity a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_legalentity a121 
on (a11.company_key = a121.row_key) 
union
select 'ldb.d_customer_mdm a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_customer a14 
on (a11.customer_key = a14.row_key) 
join ldb.d_customer_mdm a122 
on (a14.customer_mdm_key = a122.row_key) 
union
select 'ldb.d_internal_organization_department a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a15 
on (a11.employee_key = a15.row_key) 
join ldb.d_internal_organization_department a123 
on (a15.department_key = a123.row_key) 
union
select 'ldb.d_lov_incident_discovery_method_c a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a12 
on (a11.incident_key = a12.row_key) 
join ldb.d_lov_incident_discovery_method_c a124 
on (a12.discovery_method_src_c_key = a124.row_key) 
union
select 'ldb.d_domain a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_domain a125 
on (a11.domain_key = a125.row_key) 
union
select 'ldb.d_lov_incident_environment_c a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a12 
on (a11.incident_key = a12.row_key) 
join ldb.d_lov_incident_environment_c a126 
on (a12.environment_src_c_key = a126.row_key) 
union
select 'ldb.d_calendar_time_hour a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_time a16 
on (a11.time_key = a16.row_key) 
join ldb.d_calendar_time_hour a127 
on (a16.hour_key = a127.row_key) 
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
select 'ldb.d_internal_contact_major_incident_manager_c a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_major_incident_manager_c a130 
on (a11.major_incident_manager_c_key = a130.row_key) 
union
select 'ldb.d_incident_urgency a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_urgency a131 
on (a11.urgency_src_key = a131.row_key) 
union
select 'ldb.d_location a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_location a132 
on (a11.location_key = a132.row_key) 
union
select 'ldb.d_lov_incident_loss_of_service_c a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a12 
on (a11.incident_key = a12.row_key) 
join ldb.d_lov_incident_loss_of_service_c a133 
on (a12.loss_of_service_src_c_key = a133.row_key) 
union
select 'ldb.d_internal_contact_on_behalf_of_c a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_on_behalf_of_c a134 
on (a11.on_behalf_of_c_key = a134.row_key) 
union
select 'ldb.d_internal_organization_originating_group_c a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a12 
on (a11.incident_key = a12.row_key) 
join ldb.d_internal_organization_originating_group_c a135 
on (a12.originating_group_c_key = a135.row_key) 
union
select 'ldb.d_business_service_criticality a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_business_service a19 
on (a11.business_service_key = a19.row_key) 
join ldb.d_business_service_criticality a136 
on (a19.criticality_key = a136.row_key) 
union
select 'ldb.d_business_service_used_for a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_business_service a19 
on (a11.business_service_key = a19.row_key) 
join ldb.d_business_service_used_for a137 
on (a19.used_for_src_key = a137.row_key) 
union
select 'ldb.d_calendar_week a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a110 
on (a11.date_key = a110.row_key) 
join ldb.d_calendar_week a138 
on (a110.week_start_date_key = a138.row_key) 
union
select 'ldb.d_incident_caller a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a12 
on (a11.incident_key = a12.row_key) 
join ldb.d_incident_caller a139 
on (a12.caller_key = a139.row_key) 
union
select 'ldb.d_incident_category a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a12 
on (a11.incident_key = a12.row_key) 
join ldb.d_incident_category a140 
on (a12.category_src_key = a140.row_key) 
union
select 'ldb.d_incident_close_code a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a12 
on (a11.incident_key = a12.row_key) 
join ldb.d_incident_close_code a141 
on (a12.close_code_src_key = a141.row_key) 
union
select 'ldb.d_incident_priority a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a12 
on (a11.incident_key = a12.row_key) 
join ldb.d_incident_priority a142 
on (a12.priority_src_key = a142.row_key) 
union
select 'ldb.d_task_sla_resolution_flag a143 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a12 
on (a11.incident_key = a12.row_key) 
join ldb.d_task_sla_resolution_flag a143 
on (a12.met_resolution_sla_flag_key = a143.row_key) 
union
select 'ldb.d_task_sla_response_flag a144 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a12 
on (a11.incident_key = a12.row_key) 
join ldb.d_task_sla_response_flag a144 
on (a12.met_response_sla_flag_key = a144.row_key) 
union
select 'ldb.d_incident_severity a145 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a12 
on (a11.incident_key = a12.row_key) 
join ldb.d_incident_severity a145 
on (a12.severity_src_key = a145.row_key) 
union
select 'ldb.d_incident_state a146 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a12 
on (a11.incident_key = a12.row_key) 
join ldb.d_incident_state a146 
on (a12.state_src_key = a146.row_key) 
union
select 'ldb.d_incident_subcategory a147 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a12 
on (a11.incident_key = a12.row_key) 
join ldb.d_incident_subcategory a147 
on (a12.sub_category_src_key = a147.row_key) 
union
select 'ldb.d_internal_contact_service_offering_manager_c a148 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_application a17 
on (a11.application_key = a17.row_key) join ldb.d_fmr_product_c a116 
on (a17.fmr_product_c_key = a116.row_key) 
join ldb.d_internal_contact_service_offering_manager_c a148 
on (a116.service_offering_manager_c_key = a148.row_key) 
union
select 'ldb.d_calendar_year a149 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a110 
on (a11.date_key = a110.row_key) join ldb.d_calendar_month a111 
on (a110.month_start_date_key = a111.row_key) join ldb.d_calendar_quarter a112 
on (a111.quarter_start_date_key = a112.row_key) 
join ldb.d_calendar_year a149 
on (a112.year_start_date_key = a149.row_key) 
union
select 'ldb.d_internal_contact_business_service_manager_c a150 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_application a17 
on (a11.application_key = a17.row_key) join ldb.d_fmr_product_c a116 
on (a17.fmr_product_c_key = a116.row_key) join ldb.d_fmr_product_line_c a117 
on (a116.fmr_product_line_c_key = a117.row_key) 
join ldb.d_internal_contact_business_service_manager_c a150 
on (a117.business_service_manager_c_key = a150.row_key) 
