select 'ldb.f_incident_task_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
union
select 'ldb.d_incident_task_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_incident_task_c a12 
on (a11.incident_task_c_key = a12.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_internal_contact_assigned_to a13 
on (a11.assigned_to_key = a13.row_key) 
union
select 'ldb.d_internal_organization_group a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_internal_organization_group a14 
on (a11.assignment_group_key = a14.row_key) 
union
select 'ldb.d_business_service a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_business_service a15 
on (a11.business_service_key = a15.row_key) 
union
select 'ldb.d_internal_contact_opened_by_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_internal_contact_opened_by_c a16 
on (a11.opened_by_key = a16.row_key) 
union
select 'ldb.d_incident a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_incident a17 
on (a11.parent_incident_key = a17.row_key) 
union
select 'ldb.d_internal_contact_task_closed_by a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_internal_contact_task_closed_by a18 
on (a11.closed_by_key = a18.row_key) 
union
select 'ldb.d_location a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_location a19 
on (a11.location_key = a19.row_key) 
union
select 'ldb.d_incident_task_priority a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_task_c a11 
join ldb.d_incident_task_c a12 
on (a11.incident_task_c_key = a12.row_key) 
join ldb.d_incident_task_priority a110 
on (a12.priority_src_key = a110.row_key) 

