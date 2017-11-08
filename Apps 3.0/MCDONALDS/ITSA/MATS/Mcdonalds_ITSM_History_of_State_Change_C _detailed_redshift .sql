select 'ldb.d_calendar_date a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_calendar_date a11 
union
select 'ldb.f_incident_state a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_calendar_date a11 
join ldb.f_incident_state a12 
on (a11.row_key = a12.state_on_key) 
union
select 'ldb.d_internal_organization_group a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_calendar_date a11 
join ldb.f_incident_state a12 
on (a11.row_key = a12.state_on_key) 
join ldb.d_internal_organization_group a13 
on (a12.assignment_group_key = a13.row_key) 
union
select 'ldb.d_incident a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_calendar_date a11 
join ldb.f_incident_state a12 
on (a11.row_key = a12.state_on_key) 
join ldb.d_incident a14 
on (a12.incident_key = a14.row_key) 
union
select 'ldb.d_internal_contact_assigned_to a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_calendar_date a11 
join ldb.f_incident_state a12 
on (a11.row_key = a12.state_on_key) 
join ldb.d_internal_contact_assigned_to a15 
on (a12.assigned_to_key = a15.row_key) 
union
select 'ldb.d_task_priority a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_calendar_date a11 
join ldb.f_incident_state a12 
on (a11.row_key = a12.state_on_key) 
join ldb.d_task_priority a16 
on (a12.priority_src_key = a16.row_key) 
union
select 'ldb.d_incident_state_to a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_calendar_date a11 
join ldb.f_incident_state a12 
on (a11.row_key = a12.state_on_key) 
join ldb.d_incident_state_to a17 
on (a12.to_state_src_key = a17.row_key) 
union
select 'ldb.d_incident_state_from a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_calendar_date a11 
join ldb.f_incident_state a12 
on (a11.row_key = a12.state_on_key) 
join ldb.d_incident_state_from a18 
on (a12.from_state_src_key = a18.row_key) 
union
select 'ldb.d_incident_state a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_calendar_date a11 
join ldb.f_incident_state a12 
on (a11.row_key = a12.state_on_key) join ldb.d_incident a14 
on (a12.incident_key = a14.row_key) 
join ldb.d_incident_state a19 
on (a14.state_src_key = a19.row_key) 
union
select 'ldb.d_calendar_month a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.d_calendar_date a11 
join ldb.d_calendar_month a110 
on (a11.month_start_date_key = a110.row_key) 
UNION 
SELECT 'd_scafe_core_realm_c' as Table_Name, count(a.row_key) as Row_count
FROM ldb.f_incident_state a 
JOIN ldb.d_scafe_core_realm_c b ON a.scafe_core_realm_c_key=b.row_key

