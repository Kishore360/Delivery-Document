select 'ldb.f_incident_activity a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
union
select 'ldb.d_internal_contact_to a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_internal_contact_to a15 
on (a11.to_assigned_to_key = a15.row_key) 
union
select 'ldb.d_internal_contact_from a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_internal_contact_from a16 
on (a11.from_assigned_to_key = a16.row_key) 
union
select 'ldb.d_internal_organization_group_to a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_internal_organization_group_to a19 
on (a11.to_assignment_group_key = a19.row_key) 
union
select 'ldb.d_internal_organization_group_from a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_internal_organization_group_from a110 
on (a11.from_assignment_group_key = a110.row_key) 