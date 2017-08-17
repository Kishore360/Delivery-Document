select 'ldb.f_incident_activity a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
union
select 'ldb.d_internal_contact_to a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_internal_contact_to a12 
on (a11.to_assigned_to_key = a12.row_key) 
union
select 'ldb.d_internal_organization_group_to a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_internal_organization_group_to a13 
on (a11.to_assignment_group_key = a13.row_key) 
union
select 'ldb.d_internal_contact_from a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_internal_contact_from a14
on (a11.from_assigned_to_key = a14.row_key) 
union
select 'ldb.d_internal_organization_group_from a15' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_internal_organization_group_from a15 
on (a11.from_assignment_group_key = a15.row_key) 

