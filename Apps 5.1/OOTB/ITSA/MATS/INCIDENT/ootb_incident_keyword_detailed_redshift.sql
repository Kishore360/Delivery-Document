select 'ldb.f_incident_keyword a11 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11 
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11 
join ldb.d_calendar_date a12 
on (a11.opened_on_key = a12.row_key) 

union
select 'ldb.dh_assignment_group_tier_hierarchy a14 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11 
join ldb.dh_assignment_group_tier_hierarchy a14 
on (a11.assignment_group_key = a14.user_group_tier_key) 
union
select 'ldb.dh_assignment_group_type_hierarchy a15 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11 
join ldb.dh_assignment_group_type_hierarchy a15 
on (a11.assignment_group_key = a15.user_group_type_key) 
union
select 'ldb.d_configuration_item a16 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11 
join ldb.d_configuration_item a16 
on (a11.configuration_item_key = a16.row_key) 
union
select 'ldb.d_incident a17 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11 
join ldb.d_incident a17 
on (a11.table_row_key = a17.row_key) 
union
select 'ldb.d_internal_organization_group a18 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11 
join ldb.d_internal_organization_group a18 
on (a11.assignment_group_key = a18.row_key) 
union
select 'ldb.d_internal_organization_department a19 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11 
join ldb.d_internal_contact a123 on a11.opened_by_key=a123.row_key
join ldb.d_internal_organization_department a19 
on (a123.department_key = a19.row_key) 

union
select 'ldb.d_incident_priority a112 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11 
join ldb.d_incident_priority a112 
on (a11.priority_src_key = a112.row_key) 
union
select 'ldb.d_calendar_month a113 ' as Table_name, count(1) Row_Count
from ldb.f_incident_keyword a11 
join ldb.d_calendar_date a12 
on (a11.opened_on_key = a12.row_key) 
join ldb.d_calendar_month a113 
on (a12.month_start_date_key = a113.row_key) 