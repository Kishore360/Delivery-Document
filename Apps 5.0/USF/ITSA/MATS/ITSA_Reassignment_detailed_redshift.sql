select 'ldb.f_incident_activity a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
union
select 'ldb.d_incident a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_incident a14 
on (a11.incident_key = a14.row_key) 
union
select 'ldb.d_internal_contact_from a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_internal_contact_from a15 
on (a11.from_assigned_to_key = a15.row_key) 
union
select 'ldb.d_internal_contact_to a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_internal_contact_to a16
on (a11.to_assigned_to_key = a16.row_key) 
union
select 'ldb.d_calendar_date a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_calendar_date a17 
on (a11.assigned_on_key = a17.row_key) 
union
select 'ldb.d_internal_organization_group a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_internal_organization_group a18 
on (a11.current_assginment_group_key = a18.row_key) 
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
union
select 'ldb.d_incident_activity_current_assignment_group_c a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_incident_activity_current_assignment_group_c a114 
on (a11.assignment_group_key = a114.row_key) 
union
select 'ldb.d_incident_priority a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_incident_priority a115 
on (a11.priority_src_key = a115.row_key) 
union
select 'ldb.d_incident_state a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_incident a14 
on (a11.incident_key = a14.row_key) 
join ldb.d_incident_state a117 
on (a14.state_src_key = a117.row_key) 
union
select 'ldb.d_calendar_month a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_calendar_date a17 
on (a11.assigned_on_key = a17.row_key) 
join ldb.d_calendar_month a119 
on (a17.month_start_date_key = a119.row_key) 
