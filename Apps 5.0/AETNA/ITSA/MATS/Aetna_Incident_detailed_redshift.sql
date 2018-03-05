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
select 'ldb.d_internal_contact_assigned_to a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_assigned_to a15 
on (a11.assigned_to_key = a15.row_key) 
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
select 'ldb.d_change_request a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_change_request a19 
on (a11.change_request_key = a19.row_key) 
union
select 'ldb.d_incident a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a110 
on (a11.incident_key = a110.row_key) 
union
select 'ldb.d_configuration_item a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_configuration_item a111 
on (a11.configuration_item_key = a111.row_key) 
union
select 'ldb.d_parent_incident a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a110 
on (a11.incident_key = a110.row_key) 
join ldb.d_parent_incident a112 
on (a110.parent_incident_key = a112.row_key) 
union
select 'ldb.d_change_request_caused_by a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_change_request_caused_by a113 
on (a11.caused_by_change_key = a113.row_key) 
union
select 'ldb.d_internal_organization_legalentity a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_legalentity a114 
on (a11.company_key = a114.row_key) 
union
select 'ldb.d_location_configuration_item_c a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_location_configuration_item_c a115 
on (a11.configuration_item_key = a115.row_key) 
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
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) 
join ldb.d_internal_organization_department a117 
on (a13.department_key = a117.row_key) 
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
select 'ldb.d_calendar_time_hour a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_time a14 
on (a11.opened_time_key = a14.row_key) 
join ldb.d_calendar_time_hour a120 
on (a14.hour_24_format_num = a120.hour_24_format_num) 
union
select 'ldb.d_incident_contacttype a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_contacttype a121 
on (a11.reported_type_src_key = a121.row_key) 
union
select 'ldb.d_incident_impact a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_impact a122 
on (a11.impact_src_key = a122.row_key) 
union
select 'ldb.d_incident_urgency a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_urgency a123 
on (a11.urgency_src_key = a123.row_key) 
union
select 'ldb.d_location a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_location a124 
on (a11.location_key = a124.row_key) 
union
select 'ldb.d_business_service_criticality a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_business_service a17 
on (a11.business_service_key = a17.row_key) 
join ldb.d_business_service_criticality a125 
on (a17.criticality_key = a125.row_key) 
union
select 'ldb.d_business_service_used_for a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_business_service a17 
on (a11.business_service_key = a17.row_key) 
join ldb.d_business_service_used_for a126 
on (a17.used_for_src_key = a126.row_key) 
union
select 'ldb.d_calendar_month a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a18 
on (a11.opened_on_key = a18.row_key) 
join ldb.d_calendar_month a127 
on (a18.month_start_date_key = a127.row_key) 
union
select 'ldb.d_calendar_week a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a18 
on (a11.opened_on_key = a18.row_key) 
join ldb.d_calendar_week a128 
on (a18.week_start_date_key = a128.row_key) 
union
select 'ldb.d_incident_category a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a110 
on (a11.incident_key = a110.row_key) 
join ldb.d_incident_category a129 
on (a110.category_src_key = a129.row_key) 
union
select 'ldb.d_incident_close_code a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a110 
on (a11.incident_key = a110.row_key) 
join ldb.d_incident_close_code a130 
on (a110.close_code_src_key = a130.row_key) 
union
select 'ldb.d_incident_priority a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a110 
on (a11.incident_key = a110.row_key) 
join ldb.d_incident_priority a131 
on (a110.priority_src_key = a131.row_key) 
union
select 'ldb.d_task_sla_resolution_flag a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a110 
on (a11.incident_key = a110.row_key) 
join ldb.d_task_sla_resolution_flag a132 
on (a110.met_resolution_sla_flag_key = a132.row_key) 
union
select 'ldb.d_task_sla_response_flag a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a110 
on (a11.incident_key = a110.row_key) 
join ldb.d_task_sla_response_flag a133 
on (a110.met_response_sla_flag_key = a133.row_key) 
union
select 'ldb.d_incident_severity a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a110 
on (a11.incident_key = a110.row_key) 
join ldb.d_incident_severity a134 
on (a110.severity_src_key = a134.row_key) 
union
select 'ldb.d_incident_state a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a110 
on (a11.incident_key = a110.row_key) 
join ldb.d_incident_state a135 
on (a110.state_src_key = a135.row_key) 
union
select 'ldb.d_incident_subcategory a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a110 
on (a11.incident_key = a110.row_key) 
join ldb.d_incident_subcategory a136 
on (a110.sub_category_src_key = a136.row_key) 
union
select 'ldb.d_location_caller_c a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a110 
on (a11.incident_key = a110.row_key) 
join ldb.d_location_caller_c a137 
on (a110.caller_key = a137.row_key) 
union
select 'ldb.d_calendar_quarter a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a18 
on (a11.opened_on_key = a18.row_key) 
join ldb.d_calendar_quarter a138 
on (a18.quarter_start_date_key = a138.row_key) 
union
select 'ldb.d_calendar_year a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a18 
on (a11.opened_on_key = a18.row_key) 
join ldb.d_calendar_year a139 
on (a18.year_start_date_key = a139.row_key) 
