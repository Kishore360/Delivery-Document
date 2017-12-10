select 'ldb.f_incident a11 ' as Table_name, count(a11.row_key) Row_Count									
from ldb.f_incident a11 									
 union

				  select'd_internal_contact_manager_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident             a11 
join ldb.d_internal_contact_opened_by_c       a115
on (a11.opened_by_c_key = a115.row_key)
join ldb.d_internal_contact_manager_c       a116
on (a115.manager_c_key = a116.row_key)

union
select 'ldb.f_incident a11 ' as Table_name, count(a11.row_key) Row_Count									
from ldb.f_incident a11
join ldb.d_category_c a12 on a11.category_5_c_key=a12.row_key

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
select 'ldb.d_internal_contact_employee_type_c a14 ' as Table_name, count(a11.row_key) Row_Count									
from ldb.f_incident a11 									
join ldb.d_internal_contact_employee_type_c a14 									
on (a11.opened_by_c_key = a14.row_key) 									
union									
select 'ldb.d_calendar_time a15 ' as Table_name, count(a11.row_key) Row_Count									
from ldb.f_incident a11 									
join ldb.d_calendar_time a15 									
on (a11.opened_time_key = a15.row_key) 									
union									
select 'ldb.d_business_service a16 ' as Table_name, count(a11.row_key) Row_Count									
from ldb.f_incident a11 									
join ldb.d_business_service a16 									
on (a11.business_service_key = a16.row_key) 									
union									
select 'ldb.d_calendar_date a17 ' as Table_name, count(a11.row_key) Row_Count									
from ldb.f_incident a11 									
join ldb.d_calendar_date a17 									
on (a11.opened_on_key = a17.row_key) 									
union									
select 'ldb.d_incident a18 ' as Table_name, count(a11.row_key) Row_Count									
from ldb.f_incident a11 									
join ldb.d_incident a18 									
on (a11.incident_key = a18.row_key) 									
union									
select 'ldb.d_configuration_item a19 ' as Table_name, count(a11.row_key) Row_Count									
from ldb.f_incident a11 									
join ldb.d_configuration_item a19 									
on (a11.configuration_item_key = a19.row_key) 									
union									
select 'ldb.d_internal_contact_opened_by_c a110 ' as Table_name, count(a11.row_key) Row_Count									
from ldb.f_incident a11 									
join ldb.d_internal_contact_opened_by_c a110 									
on (a11.opened_by_c_key = a110.row_key) 									
union									
select 'ldb.d_internal_organization_group a111 ' as Table_name, count(a11.row_key) Row_Count									
from ldb.f_incident a11 									
join ldb.d_internal_organization_group a111 									
on (a11.assignment_group_key = a111.row_key) 									
union									
select 'ldb.d_internal_contact_assigned_to a112 ' as Table_name, count(a11.row_key) Row_Count									
from ldb.f_incident a11 									
join ldb.d_internal_contact_assigned_to a112 									
on (a11.assigned_to_key = a112.row_key) 									
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
select 'ldb.d_internal_contact_mdm a118 ' as Table_name, count(a11.row_key) Row_Count									
from ldb.f_incident a11 									
join ldb.d_internal_contact a13 									
on (a11.opened_by_key = a13.row_key) 									
join ldb.d_internal_contact_mdm a118 									
on (a13.row_current_key = a118.row_current_key) 									
union									
select 'ldb.d_duration_c a119 ' as Table_name, count(a11.row_key) Row_Count									
from ldb.f_incident a11 									
join ldb.d_duration_c a119 									
on (a11.opened_by_employee_duration = a119.duration_c_key) 									
union									
select 'ldb.d_lov_employee_type_c a120 ' as Table_name, count(a11.row_key) Row_Count									
from ldb.f_incident a11 									
join ldb.d_internal_contact_employee_type_c a14 									
on (a11.opened_by_c_key = a14.row_key) 									
join ldb.d_lov_employee_type_c a120 									
on (a14.employee_type_c_key = a120.row_key) 									
union									
select 'ldb.d_calendar_time_hour a121 ' as Table_name, count(a11.row_key) Row_Count									
from ldb.f_incident a11 									
join ldb.d_calendar_time a15 									
on (a11.opened_time_key = a15.row_key) 									
join ldb.d_calendar_time_hour a121 									
on (a15.hour_24_format_num = a121.hour_24_format_num) 									
union									
select 'ldb.d_incident_agebucket a122 ' as Table_name, count(a11.row_key) Row_Count									
from ldb.f_incident a11 									
join ldb.d_incident_agebucket a122 									
on (a11.age_key = a122.row_key) 									
union									
select 'ldb.d_lov_method_of_contact_view_c a123 ' as Table_name, count(a11.row_key) Row_Count									
from ldb.f_incident a11 									
join ldb.d_lov_method_of_contact_view_c a123 									
on (a11.method_of_contact_c_key = a123.row_key) 									
union									
select 'ldb.d_flag_c a124 ' as Table_name, count(a11.row_key) Row_Count									
from ldb.f_incident a11 									
join ldb.d_flag_c a124 									
on (a11.sd_touch_flag_c_key = a124.row_key) 									
union									
select 'ldb.d_lov_service_type_view_c a125 ' as Table_name, count(a11.row_key) Row_Count									
from ldb.f_incident a11 									
join ldb.d_lov_service_type_view_c a125 									
on (a11.service_type_c_key = a125.row_key) 									
union									
select 'ldb.d_lov_resolver_department_view_c a126 ' as Table_name, count(a11.row_key) Row_Count									
from ldb.f_incident a11 									
join ldb.d_lov_resolver_department_view_c a126 									
on (a11.resolver_department_c_key = a126.row_key) 									
union									
select 'ldb.d_task_impact a127 ' as Table_name, count(a11.row_key) Row_Count									
from ldb.f_incident a11 									
join ldb.d_task_impact a127 									
on (a11.impact_src_key = a127.row_key) 									
union									
select 'ldb.d_location a128 ' as Table_name, count(a11.row_key) Row_Count									
from ldb.f_incident a11 									
join ldb.d_location a128 									
on (a11.location_key = a128.row_key) 									
union									
select 'ldb.d_task_priority a129 ' as Table_name, count(a11.row_key) Row_Count									
from ldb.f_incident a11 									
join ldb.d_task_priority a129 									
on (a11.priority_src_key = a129.row_key) 									
union									
select 'ldb.d_task_contacttype a130 ' as Table_name, count(a11.row_key) Row_Count									
from ldb.f_incident a11 									
join ldb.d_task_contacttype a130 									
on (a11.reported_type_src_key = a130.row_key) 									
union									
select 'ldb.d_task_urgency a131 ' as Table_name, count(a11.row_key) Row_Count									
from ldb.f_incident a11 									
join ldb.d_task_urgency a131 									
on (a11.urgency_src_key = a131.row_key) 									
union									
select 'ldb.d_lov_type_view_c a132 ' as Table_name, count(a11.row_key) Row_Count									
from ldb.f_incident a11 									
join ldb.d_lov_type_view_c a132 									
on (a11.type_c_key = a132.row_key) 									
union									
select 'ldb.d_lov_who_is_affected_view_c a133 ' as Table_name, count(a11.row_key) Row_Count									
from ldb.f_incident a11 									
join ldb.d_lov_who_is_affected_view_c a133 									
on (a11.who_is_affected_c_key = a133.row_key) 									
union									
select 'ldb.d_business_service_criticality a134 ' as Table_name, count(a11.row_key) Row_Count									
from ldb.f_incident a11 									
join ldb.d_business_service a16 									
on (a11.business_service_key = a16.row_key) 									
join ldb.d_business_service_criticality a134 									
on (a16.criticality_key = a134.row_key) 									
union									
select 'ldb.d_business_service_used_for a135 ' as Table_name, count(a11.row_key) Row_Count									
from ldb.f_incident a11 									
join ldb.d_business_service a16 									
on (a11.business_service_key = a16.row_key) 									
join ldb.d_business_service_used_for a135 									
on (a16.used_for_src_key = a135.row_key) 									
union									
select 'ldb.d_incident_category a136 ' as Table_name, count(a11.row_key) Row_Count									
from ldb.f_incident a11 									
join ldb.d_incident a18 									
on (a11.incident_key = a18.row_key) 									
join ldb.d_incident_category a136 									
on (a18.category_src_key = a136.row_key) 									
union									
select 'ldb.d_incident_close_code a137 ' as Table_name, count(a11.row_key) Row_Count									
from ldb.f_incident a11 									
join ldb.d_incident a18 									
on (a11.incident_key = a18.row_key) 									
join ldb.d_incident_close_code a137 									
on (a18.close_code_src_key = a137.row_key) 									
union									
select 'ldb.d_incident_severity a138 ' as Table_name, count(a11.row_key) Row_Count									
from ldb.f_incident a11 									
join ldb.d_incident a18 									
on (a11.incident_key = a18.row_key) 									
join ldb.d_incident_severity a138 									
on (a18.severity_src_key = a138.row_key) 									
union									
select 'ldb.d_incident_state a139 ' as Table_name, count(a11.row_key) Row_Count									
from ldb.f_incident a11 									
join ldb.d_incident a18 									
on (a11.incident_key = a18.row_key) 									
join ldb.d_incident_state a139 									
on (a18.state_src_key = a139.row_key) 									
union									
select 'ldb.d_incident_subcategory a140 ' as Table_name, count(a11.row_key) Row_Count									
from ldb.f_incident a11 									
join ldb.d_incident a18 									
on (a11.incident_key = a18.row_key) 									
join ldb.d_incident_subcategory a140 									
on (a18.sub_category_src_key = a140.row_key) 									
union									
select 'ldb.d_internal_organization_group_parent_c a141 ' as Table_name, count(a11.row_key) Row_Count									
from ldb.f_incident a11 									
join ldb.d_internal_organization_group a111 									
on (a11.assignment_group_key = a111.row_key) 									
join ldb.d_internal_organization_group_parent_c a141 									
on (a111.parent_row_key_c = a141.row_key) 									
union									
select 'ldb.d_calendar_month a142 ' as Table_name, count(a11.row_key) Row_Count									
from ldb.f_incident a11 									
join ldb.d_calendar_date a17 									
on (a11.opened_on_key = a17.row_key) 									
join ldb.d_calendar_month a142 									
on (a17.month_start_date_key = a142.row_key) 									
union									
select 'ldb.d_calendar_week a143 ' as Table_name, count(a11.row_key) Row_Count									
from ldb.f_incident a11 									
join ldb.d_calendar_date a17 									
on (a11.opened_on_key = a17.row_key) 									
join ldb.d_calendar_week a143 									
on (a17.week_start_date_key = a143.row_key) 									
