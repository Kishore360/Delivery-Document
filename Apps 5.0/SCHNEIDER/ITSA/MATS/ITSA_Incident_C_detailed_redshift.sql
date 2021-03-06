select 'ldb.f_incident a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
union
select 'ldb.d_calendar_time a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_time a13 
on (a11.opened_time_key = a13.row_key) 
union
select 'ldb.d_incident_customer_region_c a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_customer_region_c a14 
on (a11.location_region_c_key = a14.row_key) 
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
select 'ldb.d_configuration_item a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_configuration_item a110 
on (a11.configuration_item_key = a110.row_key) 
union
select 'ldb.d_incident a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a111 
on (a11.incident_key = a111.row_key) 
union
select 'ldb.d_incident_customer_login_c a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a111 
on (a11.incident_key = a111.row_key) 
join ldb.d_incident_customer_login_c a112 
on (a111.caller_key = a112.row_key) 
union
select 'ldb.d_internal_organization_department a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
join ldb.d_internal_organization_department a113 
on (a12.department_key = a113.row_key) 
union
select 'ldb.d_location a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_location a114 
on (a11.location_key = a114.row_key) 
union
select 'ldb.d_incident_state a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a111 
on (a11.incident_key = a111.row_key) 
join ldb.d_incident_state a115 
on (a111.state_src_key = a115.row_key) 
union
select 'ldb.d_calendar_month a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a18 
on (a11.opened_on_key = a18.row_key) 
join ldb.d_calendar_month a116 
on (a18.month_start_date_key = a116.row_key) 
union
select 'ldb.d_parent_incident a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a111 
on (a11.incident_key = a111.row_key) 
join ldb.d_parent_incident a117 
on (a111.parent_incident_key = a117.row_key) 
union
select 'ldb.d_change_request_caused_by a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_change_request_caused_by a118 
on (a11.caused_by_change_key = a118.row_key) 
union
select 'ldb.d_internal_organization_legalentity a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_legalentity a119 
on (a11.company_key = a119.row_key) 
union
select 'ldb.d_domain a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_domain a120 
on (a11.domain_key = a120.row_key) 
union
select 'ldb.d_internal_contact_mdm a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
join ldb.d_internal_contact_mdm a121 
on (a12.row_current_key = a121.row_current_key) 
union
select 'ldb.d_calendar_time_hour a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_time a13 
on (a11.opened_time_key = a13.row_key) 
join ldb.d_calendar_time_hour a122 
on (a13.hour_24_format_num = a122.hour_24_format_num) 
union
select 'ldb.d_incident_agebucket a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_agebucket a123 
on (a11.age_key = a123.row_key) 
union
select 'ldb.d_incident_contacttype a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_contacttype a124 
on (a11.reported_type_src_key = a124.row_key) 
union
select 'ldb.d_incident_impact a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_impact a125 
on (a11.impact_src_key = a125.row_key) 
union
select 'ldb.d_incident_urgency a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident_urgency a126 
on (a11.urgency_src_key = a126.row_key) 
union
select 'ldb.d_ksr_c a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_ksr_c a127 
on (a11.ksr_c_key = a127.row_key) 
union
select 'ldb.d_business_service_criticality a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_business_service a17 
on (a11.business_service_key = a17.row_key) 
join ldb.d_business_service_criticality a128 
on (a17.criticality_key = a128.row_key) 
union
select 'ldb.d_calendar_week a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a18 
on (a11.opened_on_key = a18.row_key) 
join ldb.d_calendar_week a129 
on (a18.week_start_date_key = a129.row_key) 
union
select 'ldb.d_incident_category a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a111 
on (a11.incident_key = a111.row_key) 
join ldb.d_incident_category a130 
on (a111.category_src_key = a130.row_key) 
union
select 'ldb.d_incident_close_code a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a111 
on (a11.incident_key = a111.row_key) 
join ldb.d_incident_close_code a131 
on (a111.close_code_src_key = a131.row_key) 
union
select 'ldb.d_internal_contact_person_contact_c a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a111 
on (a11.incident_key = a111.row_key) 
join ldb.d_internal_contact_person_contact_c a132 
on (a111.person_contact_c_key = a132.row_key) 
union
select 'ldb.d_incident_priority a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a111 
on (a11.incident_key = a111.row_key) 
join ldb.d_incident_priority a133 
on (a111.priority_src_key = a133.row_key) 
union
select 'ldb.d_task_sla_resolution_flag a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a111 
on (a11.incident_key = a111.row_key) 
join ldb.d_task_sla_resolution_flag a134 
on (a111.met_resolution_sla_flag_key = a134.row_key) 
union
select 'ldb.d_task_sla_response_flag a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a111 
on (a11.incident_key = a111.row_key) 
join ldb.d_task_sla_response_flag a135 
on (a111.met_response_sla_flag_key = a135.row_key) 
union
select 'ldb.d_incident_subcategory a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a111 
on (a11.incident_key = a111.row_key) 
join ldb.d_incident_subcategory a136 
on (a111.sub_category_src_key = a136.row_key) 
union
select 'ldb.d_incident_service_type a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a111 
on (a11.incident_key = a111.row_key) 
join ldb.d_incident_service_type a137 
on (a111.service_type_key = a137.row_key) 
union
select 'ldb.d_internal_contact_master_employee_c a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key) 
join ldb.d_internal_contact_master_employee_c a138 
on (a12.bmc_row_key_c = a138.row_key) 
union
select 'ldb.d_calendar_quarter a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a18 
on (a11.opened_on_key = a18.row_key) 
join ldb.d_calendar_quarter a139 
on (a18.quarter_start_date_key = a139.row_key) 
union
select 'ldb.d_calendar_year a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a18 
on (a11.opened_on_key = a18.row_key) 
join ldb.d_calendar_year a140 
on (a18.year_start_date_key = a140.row_key) 
union
select 'ldb.d_internal_contact_customer_c a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_customer_c        a141
on (a11.caller_c_key = a141.row_key) 
union
select 'ldb.d_lov_service_type_c a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a111 
on (a11.incident_key = a111.row_key) 
join ldb.d_lov_service_type_c        a142
on (a111.service_type_key = a142.row_key) 
