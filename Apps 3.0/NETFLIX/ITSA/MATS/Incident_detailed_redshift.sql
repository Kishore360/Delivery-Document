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
select 'ldb.dh_assignment_group_tier_hierarchy a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.dh_assignment_group_tier_hierarchy a15 
on (a11.assignment_group_key = a15.user_group_tier_key) 
union
select 'ldb.dh_assignment_group_type_hierarchy a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.dh_assignment_group_type_hierarchy a16 
on (a11.assignment_group_key = a16.user_group_type_key) 
union
select 'ldb.d_configuration_item a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_configuration_item a17 
on (a11.configuration_item_key = a17.row_key) 
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
select 'ldb.d_internal_contact_assigned_to a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_assigned_to a110 
on (a11.assigned_to_key = a110.row_key) 
union
select 'ldb.d_internal_organization_group a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a111 
on (a11.assignment_group_key = a111.row_key) 
union
select 'ldb.d_internal_organization_legalentity a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_legalentity a112 
on (a11.company_key = a112.row_key) 
union
select 'ldb.d_customer_mdm a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_customer a12 
on (a11.customer_key = a12.row_key) 
join ldb.d_customer_mdm a113 
on (a12.row_current_key = a113.row_current_key) 
union
select 'ldb.d_internal_organization_department a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_department a114 
on (a11.opened_by_department_key = a114.row_key) 
union
select 'ldb.d_domain a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_domain a115 
on (a11.domain_key = a115.row_key) 
union
select 'ldb.d_internal_contact_mdm a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a13 
on (a11.opened_by_key = a13.row_key) 
join ldb.d_internal_contact_mdm a116 
on (a13.row_current_key = a116.row_current_key) 
union
select 'ldb.d_calendar_time_hour a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_time a14 
on (a11.opened_time_key = a14.row_key) 
join ldb.d_calendar_time_hour a117 
on (a14.hour_24_format_num = a117.hour_24_format_num) 
union
select 'ldb.d_task_impact a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_task_impact a118 
on (a11.impact_src_key = a118.row_key) 
union
select 'ldb.d_location a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_location a119 
on (a11.location_key = a119.row_key) 
union
select 'ldb.d_task_priority a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_task_priority a120 
on (a11.priority_src_key = a120.row_key) 
union
select 'ldb.d_task_contacttype a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_task_contacttype a121 
on (a11.reported_type_src_key = a121.row_key) 
union
select 'ldb.d_task_urgency a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_task_urgency a122 
on (a11.urgency_src_key = a122.row_key) 
union
select 'ldb.d_incident_category a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a19 
on (a11.incident_key = a19.row_key) 
join ldb.d_incident_category a123 
on (a19.category_src_key = a123.row_key) 
union
select 'ldb.d_incident_close_code a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a19 
on (a11.incident_key = a19.row_key) 
join ldb.d_incident_close_code a124 
on (a19.close_code_src_key = a124.row_key) 
union
select 'ldb.d_incident_severity a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a19 
on (a11.incident_key = a19.row_key) 
join ldb.d_incident_severity a125 
on (a19.severity_src_key = a125.row_key) 
union
select 'ldb.d_incident_state a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a19 
on (a11.incident_key = a19.row_key) 
join ldb.d_incident_state a126 
on (a19.state_src_key = a126.row_key) 
union
select 'ldb.d_incident_subcategory a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a19 
on (a11.incident_key = a19.row_key) 
join ldb.d_incident_subcategory a127 
on (a19.sub_category_src_key = a127.row_key) 
union
select 'ldb.d_calendar_month a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a18 
on (a11.opened_on_key = a18.row_key) 
join ldb.d_calendar_month a128 
on (a18.month_start_date_key = a128.row_key) 
union
select 'ldb.d_calendar_week a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a18 
on (a11.opened_on_key = a18.row_key) 
join ldb.d_calendar_week a129 
on (a18.week_start_date_key = a129.row_key) 
