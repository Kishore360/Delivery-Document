select 'ldb.f_incident a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
union
select 'ldb.f_incident_keyword a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.f_incident_keyword a12 
on (a11.assigned_to_key = a12.assigned_to_key and a11.assignment_group_key = a12.assignment_group_key and a11.company_key = a12.company_key and a11.configuration_item_key = a12.configuration_item_key and a11.customer_key = a12.customer_key and a11.domain_key = a12.domain_key and a11.impact_src_key = a12.impact_src_key and a11.incident_key = a12.table_row_key and a11.location_key = a12.location_key and a11.opened_by_department_key = a12.opened_by_department_key and a11.opened_by_key = a12.opened_by_key and a11.opened_on_key = a12.opened_on_key and a11.opened_time_key = a12.opened_time_key and a11.priority_src_key = a12.priority_src_key and a11.reported_type_src_key = a12.reported_type_src_key and a11.urgency_src_key = a12.urgency_src_key) 
union
select 'ldb.d_internal_organization_legalentity a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_legalentity a13 
on (a11.company_key = a13.row_key) 
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
select 'ldb.dh_assignment_group_tier_hierarchy a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.dh_assignment_group_tier_hierarchy a17 
on (a11.assignment_group_key = a17.user_group_tier_key) 
union
select 'ldb.dh_assignment_group_type_hierarchy a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.dh_assignment_group_type_hierarchy a18 
on (a11.assignment_group_key = a18.user_group_type_key) 
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
select 'ldb.d_internal_contact_mdm a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a15 
on (a11.opened_by_key = a15.row_key) 
join ldb.d_internal_contact_mdm a111 
on (a15.row_current_key = a111.row_current_key) 
union
select 'ldb.d_employee_location a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a15 
on (a11.opened_by_key = a15.row_key) join ldb.d_internal_contact_mdm a111 
on (a15.row_current_key = a111.row_current_key) 
join ldb.d_employee_location a112 
on (a111.location_key = a112.row_key) 
union
select 'ldb.d_incident a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a113 
on (a11.incident_key = a113.row_key) 
union
select 'ldb.d_internal_contact a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a114 
on (a11.assigned_to_key = a114.row_key) 
union
select 'ldb.d_internal_organization_group a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a115 
on (a11.assignment_group_key = a115.row_key) 
union
select 'ldb.d_customer_mdm a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_customer a14 
on (a11.customer_key = a14.row_key) 
join ldb.d_customer_mdm a116 
on (a14.row_current_key = a116.row_current_key) 
union
select 'ldb.d_domain a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_domain a117 
on (a11.domain_key = a117.row_key) 
union
select 'ldb.d_calendar_time_hour a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_time a16 
on (a11.opened_time_key = a16.row_key) 
join ldb.d_calendar_time_hour a118 
on (a16.hour_24_format_num = a118.hour_24_format_num) 
union
select 'ldb.d_task_impact a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_task_impact a119 
on (a11.impact_src_key = a119.row_key) 
union
select 'ldb.d_location a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_location a120 
on (a11.location_key = a120.row_key) 
union
select 'ldb.d_task_priority a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_task_priority a121 
on (a11.priority_src_key = a121.row_key) 
union
select 'ldb.d_task_contacttype a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_task_contacttype a122 
on (a11.reported_type_src_key = a122.row_key) 
union
select 'ldb.d_task_urgency a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_task_urgency a123 
on (a11.urgency_src_key = a123.row_key) 
union
select 'ldb.d_incident_category a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.f_incident_keyword a12 
on (a11.assigned_to_key = a12.assigned_to_key and a11.assignment_group_key = a12.assignment_group_key and a11.company_key = a12.company_key and a11.configuration_item_key = a12.configuration_item_key and a11.customer_key = a12.customer_key and a11.domain_key = a12.domain_key and a11.impact_src_key = a12.impact_src_key and a11.incident_key = a12.table_row_key and a11.location_key = a12.location_key and a11.opened_by_department_key = a12.opened_by_department_key and a11.opened_by_key = a12.opened_by_key and a11.opened_on_key = a12.opened_on_key and a11.opened_time_key = a12.opened_time_key and a11.priority_src_key = a12.priority_src_key and a11.reported_type_src_key = a12.reported_type_src_key and a11.urgency_src_key = a12.urgency_src_key) 
join ldb.d_incident_category a124 
on (a12.category_src_key = a124.row_key) 
union
select 'ldb.d_incident_close_code a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.f_incident_keyword a12 
on (a11.assigned_to_key = a12.assigned_to_key and a11.assignment_group_key = a12.assignment_group_key and a11.company_key = a12.company_key and a11.configuration_item_key = a12.configuration_item_key and a11.customer_key = a12.customer_key and a11.domain_key = a12.domain_key and a11.impact_src_key = a12.impact_src_key and a11.incident_key = a12.table_row_key and a11.location_key = a12.location_key and a11.opened_by_department_key = a12.opened_by_department_key and a11.opened_by_key = a12.opened_by_key and a11.opened_on_key = a12.opened_on_key and a11.opened_time_key = a12.opened_time_key and a11.priority_src_key = a12.priority_src_key and a11.reported_type_src_key = a12.reported_type_src_key and a11.urgency_src_key = a12.urgency_src_key) 
join ldb.d_incident_close_code a125 
on (a12.close_code_src_key = a125.row_key) 
union
select 'ldb.d_incident_severity a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.f_incident_keyword a12 
on (a11.assigned_to_key = a12.assigned_to_key and a11.assignment_group_key = a12.assignment_group_key and a11.company_key = a12.company_key and a11.configuration_item_key = a12.configuration_item_key and a11.customer_key = a12.customer_key and a11.domain_key = a12.domain_key and a11.impact_src_key = a12.impact_src_key and a11.incident_key = a12.table_row_key and a11.location_key = a12.location_key and a11.opened_by_department_key = a12.opened_by_department_key and a11.opened_by_key = a12.opened_by_key and a11.opened_on_key = a12.opened_on_key and a11.opened_time_key = a12.opened_time_key and a11.priority_src_key = a12.priority_src_key and a11.reported_type_src_key = a12.reported_type_src_key and a11.urgency_src_key = a12.urgency_src_key) 
join ldb.d_incident_severity a126 
on (a12.severity_src_key = a126.row_key) 
union
select 'ldb.d_incident_state a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.f_incident_keyword a12 
on (a11.assigned_to_key = a12.assigned_to_key and a11.assignment_group_key = a12.assignment_group_key and a11.company_key = a12.company_key and a11.configuration_item_key = a12.configuration_item_key and a11.customer_key = a12.customer_key and a11.domain_key = a12.domain_key and a11.impact_src_key = a12.impact_src_key and a11.incident_key = a12.table_row_key and a11.location_key = a12.location_key and a11.opened_by_department_key = a12.opened_by_department_key and a11.opened_by_key = a12.opened_by_key and a11.opened_on_key = a12.opened_on_key and a11.opened_time_key = a12.opened_time_key and a11.priority_src_key = a12.priority_src_key and a11.reported_type_src_key = a12.reported_type_src_key and a11.urgency_src_key = a12.urgency_src_key) 
join ldb.d_incident_state a127 
on (a12.state_src_key = a127.row_key) 
union
select 'ldb.d_incident_subcategory a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.f_incident_keyword a12 
on (a11.assigned_to_key = a12.assigned_to_key and a11.assignment_group_key = a12.assignment_group_key and a11.company_key = a12.company_key and a11.configuration_item_key = a12.configuration_item_key and a11.customer_key = a12.customer_key and a11.domain_key = a12.domain_key and a11.impact_src_key = a12.impact_src_key and a11.incident_key = a12.table_row_key and a11.location_key = a12.location_key and a11.opened_by_department_key = a12.opened_by_department_key and a11.opened_by_key = a12.opened_by_key and a11.opened_on_key = a12.opened_on_key and a11.opened_time_key = a12.opened_time_key and a11.priority_src_key = a12.priority_src_key and a11.reported_type_src_key = a12.reported_type_src_key and a11.urgency_src_key = a12.urgency_src_key) 
join ldb.d_incident_subcategory a128 
on (a12.sub_category_src_key = a128.row_key) 
union
select 'ldb.d_calendar_month a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a110 
on (a11.opened_on_key = a110.row_key) 
join ldb.d_calendar_month a129 
on (a110.month_start_date_key = a129.row_key) 
