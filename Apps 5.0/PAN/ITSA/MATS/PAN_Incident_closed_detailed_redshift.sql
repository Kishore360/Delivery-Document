select 'ldb.f_incident_closed a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
union
select 'ldb.d_customer a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_customer a12 
on (a11.customer_key = a12.row_key) 
union
select 'ldb.d_internal_contact a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) 
union
select 'ldb.d_calendar_time a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_calendar_time a14 
on (a11.opened_time_key = a14.row_key) 
union
select 'ldb.d_business_service a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_business_service a15 
on (a11.business_service_key = a15.row_key) 
union
select 'ldb.d_calendar_date a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_calendar_date a16 
on (a11.closed_on_key = a16.row_key) 
union
select 'ldb.d_incident a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_incident a17 
on (a11.incident_key = a17.row_key) 
union
select 'ldb.d_configuration_item a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_configuration_item a18 
on (a11.configuration_item_key = a18.row_key) 
union
select 'ldb.d_internal_contact_opened_by_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_internal_contact_opened_by_c a19 
on (a11.opened_by_c_key = a19.row_key) 
union
select 'ldb.d_internal_organization_group a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_internal_organization_group a110 
on (a11.assignment_group_key = a110.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_internal_contact_assigned_to a111 
on (a11.assigned_to_key = a111.row_key) 
union
select 'ldb.d_change_request_caused_by a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_change_request_caused_by a112 
on (a11.caused_by_change_key = a112.row_key) 
union
select 'ldb.d_change_request a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_change_request a113 
on (a11.change_request_key = a113.row_key) 
union
select 'ldb.d_internal_organization_legalentity a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_internal_organization_legalentity a114 
on (a11.company_key = a114.row_key) 
union
select 'ldb.d_customer_mdm a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_customer a12 
on (a11.customer_key = a12.row_key) 
join ldb.d_customer_mdm a115 
on (a12.row_current_key = a115.row_current_key) 
union
select 'ldb.d_internal_organization_department a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_internal_organization_department a116 
on (a11.opened_by_department_key = a116.row_key) 
union
select 'ldb.d_internal_contact_mdm a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) 
join ldb.d_internal_contact_mdm a117 
on (a13.row_current_key = a117.row_current_key) 
union
select 'ldb.d_calendar_time_hour a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_calendar_time a14 
on (a11.opened_time_key = a14.row_key) 
join ldb.d_calendar_time_hour a118 
on (a14.hour_24_format_num = a118.hour_24_format_num) 
union
select 'ldb.d_incident_agebucket a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_incident_agebucket a119 
on (a11.age_key = a119.row_key) 
union
select 'ldb.d_lov_incident_method_of_contact_c a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_lov_incident_method_of_contact_c a120 
on (a11.method_of_contact_c_key = a120.row_key) 
union
select 'ldb.d_flag_c a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_flag_c a121 
on (a11.sd_touch_flag_c_key = a121.row_key) 
union
select 'ldb.d_lov_incident_service_type_c a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_lov_incident_service_type_c a122 
on (a11.service_type_c_key = a122.row_key) 
union
select 'ldb.d_lov_incident_resolver_department_c a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_lov_incident_resolver_department_c a123 
on (a11.resolver_department_c_key = a123.row_key) 
union
select 'ldb.d_task_impact a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_task_impact a124 
on (a11.impact_src_key = a124.row_key) 
union
select 'ldb.d_location a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_location a125 
on (a11.location_key = a125.row_key) 
union
select 'ldb.d_task_priority a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_task_priority a126 
on (a11.priority_src_key = a126.row_key) 
union
select 'ldb.d_task_contacttype a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_task_contacttype a127 
on (a11.reported_type_src_key = a127.row_key) 
union
select 'ldb.d_task_urgency a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_task_urgency a128 
on (a11.urgency_src_key = a128.row_key) 
union
select 'ldb.d_lov_incident_type_c a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_lov_incident_type_c a129 
on (a11.type_c_key = a129.row_key) 
union
select 'ldb.d_lov_incident_who_is_affected_c  a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_lov_incident_who_is_affected_c a130 
on (a11.who_is_affected_c_key = a130.row_key) 
union
select 'ldb.d_business_service_criticality a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_business_service a15 
on (a11.business_service_key = a15.row_key) 
join ldb.d_business_service_criticality a131 
on (a15.criticality_key = a131.row_key) 
union
select 'ldb.d_business_service_used_for a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_business_service a15 
on (a11.business_service_key = a15.row_key) 
join ldb.d_business_service_used_for a132 
on (a15.used_for_src_key = a132.row_key) 
union
select 'ldb.d_incident_category a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_incident a17 
on (a11.incident_key = a17.row_key) 
join ldb.d_incident_category a133 
on (a17.category_src_key = a133.row_key) 
union
select 'ldb.d_incident_close_code a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_incident a17 
on (a11.incident_key = a17.row_key) 
join ldb.d_incident_close_code a134 
on (a17.close_code_src_key = a134.row_key) 
union
select 'ldb.d_incident_severity a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_incident a17 
on (a11.incident_key = a17.row_key) 
join ldb.d_incident_severity a135 
on (a17.severity_src_key = a135.row_key) 
union
select 'ldb.d_incident_state a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_incident a17 
on (a11.incident_key = a17.row_key) 
join ldb.d_incident_state a136 
on (a17.state_src_key = a136.row_key) 
union
select 'ldb.d_incident_subcategory a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_incident a17 
on (a11.incident_key = a17.row_key) 
join ldb.d_incident_subcategory a137 
on (a17.sub_category_src_key = a137.row_key) 
union
select 'ldb.d_internal_organization_group_parent_c a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_internal_organization_group a110 
on (a11.assignment_group_key = a110.row_key) 
join ldb.d_internal_organization_group_parent_c a138 
on (a110.parent_row_key_c = a138.row_key) 
union
select 'ldb.d_calendar_month a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_calendar_date a16 
on (a11.closed_on_key = a16.row_key) 
join ldb.d_calendar_month a139 
on (a16.month_start_date_key = a139.row_key) 
union
select 'ldb.d_calendar_week a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_closed a11 
join ldb.d_calendar_date a16 
on (a11.closed_on_key = a16.row_key) 
join ldb.d_calendar_week a140 
on (a16.week_start_date_key = a140.row_key) 