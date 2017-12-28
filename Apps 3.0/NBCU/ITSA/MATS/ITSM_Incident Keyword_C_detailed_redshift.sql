
SELECT 'f_incident' AS Table_Name, Count(a11.row_key) as Row_Count
FROM ldb.f_incident a11 
UNION 
SELECT 'f_incident_keyword' AS Table_Name, count(a11.row_key) as Row_Count
FROM ldb.f_incident a11
JOIN ldb.f_incident_keyword a12 
ON 
(a11.assigned_to_key = a12.assigned_to_key AND 
a11.assignment_group_key = a12.assignment_group_key AND 
a11.company_key = a12.company_key AND
a11.configuration_item_key = a12.configuration_item_key AND
a11.customer_key = a12.customer_key  AND 
a11.domain_key = a12.domain_key AND
a11.impact_src_key = a12.impact_src_key AND
a11.incident_key = a12.table_row_key  AND 
a11.location_key = a12.location_key  AND 
a11.opened_by_key = a12.opened_by_key AND 
a11.opened_time_key = a12.opened_time_key AND 
a11.priority_src_key = a12.priority_src_key AND 
a11.reported_type_src_key = a12.reported_type_src_key AND 
a11.urgency_src_key = a12.urgency_src_key)
UNION 
select 'ldb.f_incident a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
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
select 'ldb.d_configuration_item a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_configuration_item a16 
on (a11.configuration_item_key = a16.row_key) 
union
select 'ldb.d_calendar_date a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a17 
on (a11.opened_on_key = a17.row_key) 
union
select 'ldb.d_internal_contact_mdm a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a14 
on (a11.opened_by_key = a14.row_key) 
join ldb.d_internal_contact_mdm a18 
on (a14.row_current_key = a18.row_current_key) 
union
select 'ldb.d_employee_location a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact a14 
on (a11.opened_by_key = a14.row_key) join ldb.d_internal_contact_mdm a18 
on (a14.row_current_key = a18.row_current_key) 
join ldb.d_employee_location a19 
on (a18.location_key = a19.row_key) 
union
select 'ldb.d_incident a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a110 
on (a11.incident_key = a110.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_contact_assigned_to a111 
on (a11.assigned_to_key = a111.row_key) 
union
select 'ldb.d_internal_organization_group a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a112 
on (a11.assignment_group_key = a112.row_key) 
union
select 'ldb.d_internal_organization_legalentity a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_legalentity a113 
on (a11.company_key = a113.row_key) 
union
select 'ldb.d_customer_mdm a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_customer a13 
on (a11.customer_key = a13.row_key) 
join ldb.d_customer_mdm a114 
on (a13.row_current_key = a114.row_current_key) 
union
select 'ldb.d_domain a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_domain a115 
on (a11.domain_key = a115.row_key) 
union
select 'ldb.d_calendar_time_hour a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_time a15 
on (a11.opened_time_key = a15.row_key) 
join ldb.d_calendar_time_hour a116 
on (a15.hour_24_format_num = a116.hour_24_format_num) 
union
select 'ldb.d_task_impact a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_task_impact a117 
on (a11.impact_src_key = a117.row_key) 
union
select 'ldb.d_location a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_location a118 
on (a11.location_key = a118.row_key) 
union
select 'ldb.d_task_priority a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_task_priority a119 
on (a11.priority_src_key = a119.row_key) 
union
select 'ldb.d_task_contacttype a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_task_contacttype a120 
on (a11.reported_type_src_key = a120.row_key) 
union
select 'ldb.d_task_urgency a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_task_urgency a121 
on (a11.urgency_src_key = a121.row_key) 
union
select 'ldb.d_incident_category a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.f_incident_keyword a12 
on (a11.assigned_to_key = a12.assigned_to_key and a11.assignment_group_key = a12.assignment_group_key and 
a11.company_key = a12.company_key and a11.configuration_item_key = a12.configuration_item_key and 
a11.customer_key = a12.customer_key and a11.domain_key = a12.domain_key and 
a11.impact_src_key = a12.impact_src_key and a11.incident_key = a12.table_row_key and 
a11.location_key = a12.location_key and a11.opened_by_key = a12.opened_by_key and 
a11.opened_on_key = a12.opened_on_key and a11.opened_time_key = a12.opened_time_key and 
a11.priority_src_key = a12.priority_src_key and a11.reported_type_src_key = a12.reported_type_src_key and 
a11.urgency_src_key = a12.urgency_src_key) 
join ldb.d_incident_category a122 
on (a12.category_src_key = a122.row_key)
union
select 'ldb.d_incident_close_code a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.f_incident_keyword a12 
on (a11.assigned_to_key = a12.assigned_to_key and a11.assignment_group_key = a12.assignment_group_key and 
a11.company_key = a12.company_key and a11.configuration_item_key = a12.configuration_item_key and 
a11.customer_key = a12.customer_key and a11.domain_key = a12.domain_key and 
a11.impact_src_key = a12.impact_src_key and a11.incident_key = a12.table_row_key and 
a11.location_key = a12.location_key and a11.opened_by_key = a12.opened_by_key and 
a11.opened_on_key = a12.opened_on_key and a11.opened_time_key = a12.opened_time_key and 
a11.priority_src_key = a12.priority_src_key and a11.reported_type_src_key = a12.reported_type_src_key and 
a11.urgency_src_key = a12.urgency_src_key) 
join ldb.d_incident_close_code a123 
on (a12.close_code_src_key = a123.row_key) 
union
select 'ldb.d_incident_severity a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.f_incident_keyword a12 
on (a11.assigned_to_key = a12.assigned_to_key and a11.assignment_group_key = a12.assignment_group_key and 
a11.company_key = a12.company_key and a11.configuration_item_key = a12.configuration_item_key and 
a11.customer_key = a12.customer_key and a11.domain_key = a12.domain_key and 
a11.impact_src_key = a12.impact_src_key and a11.incident_key = a12.table_row_key and 
a11.location_key = a12.location_key and a11.opened_by_key = a12.opened_by_key and 
a11.opened_on_key = a12.opened_on_key and a11.opened_time_key = a12.opened_time_key and 
a11.priority_src_key = a12.priority_src_key and a11.reported_type_src_key = a12.reported_type_src_key and 
a11.urgency_src_key = a12.urgency_src_key) 
join ldb.d_incident_severity a124 
on (a12.severity_src_key = a124.row_key)  
union
select 'ldb.d_incident_state a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.f_incident_keyword a12 
on (a11.assigned_to_key = a12.assigned_to_key and a11.assignment_group_key = a12.assignment_group_key and 
a11.company_key = a12.company_key and a11.configuration_item_key = a12.configuration_item_key and 
a11.customer_key = a12.customer_key and a11.domain_key = a12.domain_key and 
a11.impact_src_key = a12.impact_src_key and a11.incident_key = a12.table_row_key and 
a11.location_key = a12.location_key and a11.opened_by_key = a12.opened_by_key and 
a11.opened_on_key = a12.opened_on_key and a11.opened_time_key = a12.opened_time_key and 
a11.priority_src_key = a12.priority_src_key and a11.reported_type_src_key = a12.reported_type_src_key and 
a11.urgency_src_key = a12.urgency_src_key) 
join ldb.d_incident_state a125 
on (a12.state_src_key = a125.row_key) 
union
select 'ldb.d_incident_subcategory a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.f_incident_keyword a12 
on (a11.assigned_to_key = a12.assigned_to_key and a11.assignment_group_key = a12.assignment_group_key and 
a11.company_key = a12.company_key and a11.configuration_item_key = a12.configuration_item_key and 
a11.customer_key = a12.customer_key and a11.domain_key = a12.domain_key and 
a11.impact_src_key = a12.impact_src_key and a11.incident_key = a12.table_row_key and 
a11.location_key = a12.location_key and a11.opened_by_key = a12.opened_by_key and 
a11.opened_on_key = a12.opened_on_key and a11.opened_time_key = a12.opened_time_key and 
a11.priority_src_key = a12.priority_src_key and a11.reported_type_src_key = a12.reported_type_src_key and 
a11.urgency_src_key = a12.urgency_src_key) 
join ldb.d_incident_subcategory a126 
on (a12.sub_category_src_key = a126.row_key) 
union
select 'ldb.d_calendar_month a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a17 
on (a11.opened_on_key = a17.row_key) 
join ldb.d_calendar_month a127 
on (a17.month_start_date_key = a127.row_key) 


