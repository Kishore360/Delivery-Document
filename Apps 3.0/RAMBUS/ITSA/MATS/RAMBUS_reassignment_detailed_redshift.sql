select 'ldb.f_incident_activity a12 ' as Table_name, count(a12.row_key) Row_Count
from ldb.f_incident_activity a12 
union
select 'ldb.d_incident a13 ' as Table_name, count(a12.row_key) Row_Count
from ldb.f_incident_activity a12 

join ldb.d_incident a13 
on (a12.incident_key = a13.row_key) 
union
select 'ldb.d_internal_organization_group a14 ' as Table_name, count(a12.row_key) Row_Count
from ldb.f_incident_activity a12 

join ldb.d_internal_organization_group a14 
on (a12.current_assginment_group_key = a14.row_key) 
union
select 'ldb.d_configuration_item a15 ' as Table_name, count(a12.row_key) Row_Count
from ldb.f_incident_activity a12 

join ldb.d_configuration_item a15 
on (a12.business_service_c_key = a15.row_key) 
union
select 'ldb.d_incident_category a16 ' as Table_name, count(a12.row_key) Row_Count
from ldb.f_incident_activity a12 

join ldb.d_incident_category a16 
on (a12.category_src_key = a16.row_key) 
union
select 'ldb.d_calendar_date a17 ' as Table_name, count(a12.row_key) Row_Count
from ldb.f_incident_activity a12 

join ldb.d_calendar_date a17 
on (a12.assigned_on_key = a17.row_key) 
union
select 'ldb.d_internal_contact_to a18 ' as Table_name, count(a12.row_key) Row_Count
from ldb.f_incident_activity a12 

join ldb.d_internal_contact_to a18 
on (a12.to_assigned_to_key = a18.row_key) 
union
select 'ldb.d_internal_organization_group_to a19 ' as Table_name, count(a12.row_key) Row_Count
from ldb.f_incident_activity a12 

join ldb.d_internal_organization_group_to a19 
on (a12.to_assignment_group_key = a19.row_key) 
union
select 'ldb.d_internal_contact_from a120 ' as Table_name, count(a12.row_key) Row_Count
from ldb.f_incident_activity a12 

join ldb.d_internal_contact_from a120 
on (a12.from_assigned_to_key = a120.row_key) 
union
select 'ldb.d_internal_organization_group_from a121 ' as Table_name, count(a12.row_key) Row_Count
from ldb.f_incident_activity a12 

join ldb.d_internal_organization_group_from a121 
on (a12.from_assignment_group_key = a121.row_key) 
union
select 'ldb.d_incident_contacttype a122 ' as Table_name, count(a12.row_key) Row_Count
from ldb.f_incident_activity a12 

join ldb.d_incident_contacttype a122 
on (a12.reported_type_src_key = a122.row_key) 
union
select 'ldb.d_task_priority a123 ' as Table_name, count(a12.row_key) Row_Count
from ldb.f_incident_activity a12 

join ldb.d_task_priority a123 
on (a12.priority_src_key = a123.row_key) 
union
select 'ldb.d_incident_state a124 ' as Table_name, count(a12.row_key) Row_Count
from ldb.f_incident_activity a12 
join ldb.d_incident a13 
on (a12.incident_key = a13.row_key) 
join ldb.d_incident_state a124 
on (a13.state_src_key = a124.row_key) 