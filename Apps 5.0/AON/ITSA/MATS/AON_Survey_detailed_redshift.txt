select 'ldb.f_incident_activity a12 ' as Table_name, count(a12.row_key) Row_Count 
from ldb.f_incident_activity a12 
union
select 'ldb.d_internal_contact_to a16 ' as Table_name, count(a12.row_key) Row_Count
from
 ldb.f_incident_activity a12 
 join ldb.d_internal_contact_to a16 
on (a12.to_assigned_to_key = a16.row_key) 
union
select 'ldb.d_internal_organization_group_to a17 ' as Table_name, count(a12.row_key) Row_Count
from ldb.f_incident_activity a12 
join ldb.d_internal_organization_group_to a17 
on (a12.to_assignment_group_key = a17.row_key) 
union
select 'ldb.d_internal_contact_from a18 ' as Table_name, count(a12.row_key) Row_Count
from ldb.f_incident_activity a12 
join ldb.d_internal_contact_from a18 
on (a12.from_assigned_to_key = a18.row_key) 
union
select 'ldb.d_internal_organization_group_from a19 ' as Table_name, count(a12.row_key) Row_Count
from  ldb.f_incident_activity a12 
join ldb.d_internal_organization_group_from a19 
on (a12.from_assignment_group_key = a19.row_key) 

