select 'ldb.f_incident a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
union
select 'ldb.f_incident_activity a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.f_incident_activity a12 
on (a11.assignment_group_key = a12.current_assginment_group_key and 
a11.incident_key = a12.incident_key
and a11.opened_on_key = a12.assigned_on_key) 
union
select 'ldb.d_internal_organization_group a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_internal_organization_group a13 
on (a11.assignment_group_key = a13.row_key) 
union
select 'ldb.d_calendar_date a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a14 
on (a11.opened_on_key = a14.row_key) 
union
select 'ldb.d_incident a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a15 
on (a11.incident_key = a15.row_key) 
union
select 'ldb.d_internal_contact_to a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.f_incident_activity a12 
on (a11.assignment_group_key = a12.current_assginment_group_key and a11.incident_key = a12.incident_key and 
a11.opened_on_key = a12.assigned_on_key) 
join ldb.d_internal_contact_to a16 
on (a12.to_assigned_to_key = a16.row_key) 
union
select 'ldb.d_internal_organization_group_to a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.f_incident_activity a12 
on (a11.assignment_group_key = a12.current_assginment_group_key and a11.incident_key = a12.incident_key and 
a11.opened_on_key = a12.assigned_on_key) 
join ldb.d_internal_organization_group_to a17 
on (a12.to_assignment_group_key = a17.row_key) 
union
select 'ldb.d_internal_contact_from a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.f_incident_activity a12 
on (a11.assignment_group_key = a12.current_assginment_group_key and a11.incident_key = a12.incident_key and 
a11.opened_on_key = a12.assigned_on_key) 
join ldb.d_internal_contact_from a18 
on (a12.from_assigned_to_key = a18.row_key) 
union
select 'ldb.d_internal_organization_group_from a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.f_incident_activity a12 
on (a11.assignment_group_key = a12.current_assginment_group_key and a11.incident_key = a12.incident_key and 
a11.opened_on_key = a12.assigned_on_key) 
join ldb.d_internal_organization_group_from a19 
on (a12.from_assignment_group_key = a19.row_key) 
union
select 'ldb.d_calendar_month a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_calendar_date a14 
on (a11.opened_on_key = a14.row_key) 
join ldb.d_calendar_month a110 
on (a14.month_start_date_key = a110.row_key) 
union
select 'ldb.d_incident_priority a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a15 
on (a11.incident_key = a15.row_key) 
join ldb.d_incident_priority a111 
on (a15.priority_src_key = a111.row_key) 
union
select 'ldb.d_incident_state a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident a11 
join ldb.d_incident a15 
on (a11.incident_key = a15.row_key) 
join ldb.d_incident_state a112 
on (a15.state_src_key = a112.row_key)