select 'ldb.f_incident_activity a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11
union
select 'ldb.d_incident_activity_tribe_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11
join ldb.d_incident_activity_tribe_c a13
on (a11.tribe_c_key = a13.row_key)
union
select 'ldb.d_internal_contact_to a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11
join ldb.d_internal_contact_to a18
on (a11.to_assigned_to_key = a18.row_key)
union
select 'ldb.d_internal_organization_group_to a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11
join ldb.d_internal_organization_group_to a19
on (a11.to_assignment_group_key = a19.row_key)
union
select 'ldb.d_internal_contact_from a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11
join ldb.d_internal_contact_from a110
on (a11.from_assigned_to_key = a110.row_key)
union
select 'ldb.d_internal_organization_group_from a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11
join ldb.d_internal_organization_group_from a111
on (a11.from_assignment_group_key = a111.row_key)

union
select 'ldb.f_incident_activity a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11
union
select 'ldb.d_incident_activity_tribe_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11
join ldb.d_incident_activity_tribe_c a13
on (a11.tribe_c_key = a13.row_key)
union
select 'ldb.d_internal_contact_to a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11
join ldb.d_internal_contact_to a18
on (a11.to_assigned_to_key = a18.row_key)
union
select 'ldb.d_internal_organization_group_to a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11
join ldb.d_internal_organization_group_to a19
on (a11.to_assignment_group_key = a19.row_key)
union
select 'ldb.d_internal_contact_from a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11
join ldb.d_internal_contact_from a110
on (a11.from_assigned_to_key = a110.row_key)
union
select 'ldb.d_internal_organization_group_from a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11
join ldb.d_internal_organization_group_from a111
on (a11.from_assignment_group_key = a111.row_key)