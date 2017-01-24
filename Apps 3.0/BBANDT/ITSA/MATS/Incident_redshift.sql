select 'ldb.f_incident a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
union
select 'ldb.d_software_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_software_c a12 
on (a11.archer_id_c_key = a12.row_key) 
union
select 'ldb.d_customer a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_customer a13 
on (a11.customer_key = a13.row_key) 
union
select 'ldb.d_internal_contact a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a14 
on (a11.opened_by_key = a14.row_key) 
union
select 'ldb.d_calendar_time a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_time a15 
on (a11.opened_time_key = a15.row_key) 
union
select 'ldb.d_internal_organization_group a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a16 
on (a11.assignment_group_key = a16.row_key) 
union
select 'ldb.d_business_service a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_business_service a17 
on (a11.business_service_key = a17.row_key) 
union
select 'ldb.d_calendar_date a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a18 
on (a11.opened_on_key = a18.row_key) 
union
select 'ldb.d_incident a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a19 
on (a11.incident_key = a19.row_key) 
union
select 'ldb.d_configuration_item a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_configuration_item a110 
on (a11.configuration_item_key = a110.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_assigned_to a111 
on (a11.assigned_to_key = a111.row_key) 
union
select 'ldb.d_task_priority a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_task_priority a112 
on (a11.priority_src_key = a112.row_key) 
union
select 'ldb.d_change_request_caused_by a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_change_request_caused_by a113 
on (a11.caused_by_change_key = a113.row_key) 
union
select 'ldb.d_change_request a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_change_request a114 
on (a11.change_request_key = a114.row_key) 
union
select 'ldb.d_internal_organization_legalentity a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_legalentity a115 
on (a11.company_key = a115.row_key) 
union
select 'ldb.d_customer_mdm a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_customer a13 
on (a11.customer_key = a13.row_key) 
join ldb.d_customer_mdm a116 
on (a13.row_current_key = a116.row_current_key) 
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
join ldb.d_internal_contact a14 
on (a11.opened_by_key = a14.row_key) 
join ldb.d_internal_contact_mdm a119 
on (a14.row_current_key = a119.row_current_key) 
union
select 'ldb.d_calendar_time_hour a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_time a15 
on (a11.opened_time_key = a15.row_key) 
join ldb.d_calendar_time_hour a120 
on (a15.hour_24_format_num = a120.hour_24_format_num) 
union
select 'ldb.d_incident_resolution_ci_c a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_resolution_ci_c a121 
on (a11.resolution_ci_c_key = a121.row_key) 
union
select 'ldb.d_internal_contact a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a122 
on (a11.last_resolved_by_key = a122.row_key) 
union
select 'ldb.d_task_impact a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_task_impact a123 
on (a11.impact_src_key = a123.row_key) 
union
select 'ldb.d_location a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_location a124 
on (a11.location_key = a124.row_key) 
union
select 'ldb.d_task_contacttype a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_task_contacttype a125 
on (a11.reported_type_src_key = a125.row_key) 
union
select 'ldb.d_task_urgency a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_task_urgency a126 
on (a11.urgency_src_key = a126.row_key) 
union
select 'ldb.d_assignment_group_manager_c a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a16 
on (a11.assignment_group_key = a16.row_key) 
join ldb.d_assignment_group_manager_c a127 
on (a16.manager_c_key = a127.row_key) 
union
select 'ldb.d_business_service_criticality a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_business_service a17 
on (a11.business_service_key = a17.row_key) 
join ldb.d_business_service_criticality a128 
on (a17.criticality_key = a128.row_key) 
union
select 'ldb.d_business_service_used_for a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_business_service a17 
on (a11.business_service_key = a17.row_key) 
join ldb.d_business_service_used_for a129 
on (a17.used_for_src_key = a129.row_key) 
union
select 'ldb.d_incident_cause_code_c a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a19 
on (a11.incident_key = a19.row_key) 
join ldb.d_incident_cause_code_c a130 
on (a19.cause_code_c_key = a130.row_key) 
union
select 'ldb.d_incident_category a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a19 
on (a11.incident_key = a19.row_key) 
join ldb.d_incident_category a131 
on (a19.category_src_key = a131.row_key) 
union
select 'ldb.d_incident_close_code a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a19 
on (a11.incident_key = a19.row_key) 
join ldb.d_incident_close_code a132 
on (a19.close_code_src_key = a132.row_key) 
union
select 'ldb.d_cost_center a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_assigned_to a111 
on (a11.assigned_to_key = a111.row_key) 
join ldb.d_cost_center a133 
on (a111.cost_center_key = a133.row_key) 
union
select 'ldb.d_incident_severity a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a19 
on (a11.incident_key = a19.row_key) 
join ldb.d_incident_severity a134 
on (a19.severity_src_key = a134.row_key) 
union
select 'ldb.d_incident_state a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a19 
on (a11.incident_key = a19.row_key) 
join ldb.d_incident_state a135 
on (a19.state_src_key = a135.row_key) 
union
select 'ldb.d_incident_subcategory a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a19 
on (a11.incident_key = a19.row_key) 
join ldb.d_incident_subcategory a136 
on (a19.sub_category_src_key = a136.row_key) 
union
select 'ldb.d_calendar_month a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a18 
on (a11.opened_on_key = a18.row_key) 
join ldb.d_calendar_month a137 
on (a18.month_start_date_key = a137.row_key) 
union
select 'ldb.d_incident_resolution_code_c a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a19 
on (a11.incident_key = a19.row_key) 
join ldb.d_incident_resolution_code_c a138 
on (a19.resolution_code_c_key = a138.row_key) 
