select 'ldb.f_incident_keyword a11 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11 
union
select 'ldb.d_internal_organization_legalentity a13 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11 
join ldb.d_internal_organization_legalentity a13 
on (a11.company_key = a13.row_key) 
union
select 'ldb.d_customer a14 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11 
join ldb.d_customer a14 
on (a11.customer_key = a14.row_key) 
union
select 'ldb.d_internal_contact a15 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11 
join ldb.d_internal_contact a15 
on (a11.opened_by_key = a15.row_key) 
union
select 'ldb.d_calendar_time a16 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11 
join ldb.d_calendar_time a16 
on (a11.opened_time_key = a16.row_key) 
union
select 'ldb.d_configuration_item a17 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11 
join ldb.d_configuration_item a17 
on (a11.configuration_item_key = a17.row_key) 
union
select 'ldb.d_calendar_date a18 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11 
join ldb.d_calendar_date a18 
on (a11.opened_on_key = a18.row_key) 
union
select 'ldb.d_internal_contact_mdm a19 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11 
join ldb.d_internal_contact a15 
on (a11.opened_by_key = a15.row_key) 
join ldb.d_internal_contact_mdm a19 
on (a15.row_current_key = a19.row_current_key) 
union
select 'ldb.d_employee_location a110 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11 
join ldb.d_internal_contact a15 
on (a11.opened_by_key = a15.row_key) join ldb.d_internal_contact_mdm a19 
on (a15.row_current_key = a19.row_current_key) 
join ldb.d_employee_location a110 
on (a19.location_key = a110.row_key) 
union
select 'ldb.d_incident a111 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11 
join ldb.d_incident a111 
on (a11.incident_key = a111.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a112 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11 
join ldb.d_internal_contact_assigned_to a112 
on (a11.assigned_to_key = a112.row_key) 
union
select 'ldb.d_internal_organization_group a113 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11 
join ldb.d_internal_organization_group a113 
on (a11.assignment_group_key = a113.row_key) 
union
select 'ldb.d_customer_mdm a114 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11 
join ldb.d_customer a14 
on (a11.customer_key = a14.row_key) 
join ldb.d_customer_mdm a114 
on (a14.row_current_key = a114.row_current_key) 
union
select 'ldb.d_domain a115 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11 
join ldb.d_domain a115 
on (a11.domain_key = a115.row_key) 
union
select 'ldb.d_calendar_time_hour a116 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11 
join ldb.d_calendar_time a16 
on (a11.opened_time_key = a16.row_key) 
join ldb.d_calendar_time_hour a116 
on (a16.hour_24_format_num = a116.hour_24_format_num) 
union
select 'ldb.d_task_impact a118 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11 
join ldb.d_task_impact a118 
on (a11.impact_src_key = a118.row_key) 
union
select 'ldb.d_location a119 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11 
join ldb.d_location a119 
on (a11.location_key = a119.row_key) 
union
select 'ldb.d_task_priority a120 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11 
join ldb.d_task_priority a120 
on (a11.priority_src_key = a120.row_key) 
union
select 'ldb.d_task_contacttype a121 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11 
join ldb.d_task_contacttype a121 
on (a11.reported_type_src_key = a121.row_key) 
union
select 'ldb.d_task_urgency a122 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11 
join ldb.d_task_urgency a122 
on (a11.urgency_src_key = a122.row_key) 
union
select 'ldb.d_incident_category a123 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11 

join ldb.d_incident_category a123 
on (a11.category_src_key = a123.row_key) 
union
select 'ldb.d_incident_close_code a124 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11 

join ldb.d_incident_close_code a124 
on (a11.close_code_src_key = a124.row_key) 
union
select 'ldb.d_incident_severity a125 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11 

join ldb.d_incident_severity a125 
on (a11.severity_src_key = a125.row_key) 
union
select 'ldb.d_incident_state a126 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11 

join ldb.d_incident_state a126 
on (a11.state_src_key = a126.row_key) 
union
select 'ldb.d_incident_subcategory a127 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11 

join ldb.d_incident_subcategory a127 
on (a11.sub_category_src_key = a127.row_key) 
