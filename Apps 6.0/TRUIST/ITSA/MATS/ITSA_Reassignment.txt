select 'ldb.f_incident_activity a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11
union
select 'ldb.d_incident a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
union
select 'ldb.d_incident_assignment_group a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_incident_assignment_group a13
on (a12.assignment_group_key = a13.row_key)
union
select 'ldb.d_incident_activity_date a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11
join ldb.d_incident_activity_date a14
on (a11.incident_activity_date_key = a14.row_key)
union
select 'ldb.d_internal_contact_to a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11
join ldb.d_internal_contact_to a15
on (a11.to_assigned_to_key = a15.row_key)
union
select 'ldb.d_internal_organization_group_to a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11
join ldb.d_internal_organization_group_to a16
on (a11.to_assignment_group_key = a16.row_key)
union
select 'ldb.d_internal_contact_from a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11
join ldb.d_internal_contact_from a17
on (a11.from_assigned_to_key = a17.row_key)
union
select 'ldb.d_internal_organization_group_from a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11
join ldb.d_internal_organization_group_from a18
on (a11.from_assignment_group_key = a18.row_key)
union
select 'ldb.d_incident_priority a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_incident_priority a19
on (a12.priority_src_key = a19.row_key)
union
select 'ldb.d_incident_state a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_incident_state a110
on (a12.state_src_key = a110.row_key)