
select 'ldb.f_incident_activity a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
union
select 'ldb.d_incident a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_incident a12 
on (a11.incident_key = a12.row_key) 
union
select 'ldb.d_calendar_date a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_calendar_date a13 
on (a11.assigned_on_key = a13.row_key) 
union
select 'ldb.d_internal_contact_to a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_internal_contact_to a14 
on (a11.to_assigned_to_key = a14.row_key) 
union
select 'ldb.d_internal_contact_from a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_internal_contact_from a15 
on (a11.from_assigned_to_key = a15.row_key) 
union
select 'ldb.d_internal_organization_group a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_internal_organization_group a16 
on (a11.current_assginment_group_key = a16.row_key) 
union
select 'ldb.d_business_service a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_business_service a17 
on (a11.business_service_key = a17.row_key) 
union
select 'ldb.d_internal_organization_group_to a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_internal_organization_group_to a18 
on (a11.to_assignment_group_key = a18.row_key) 
union
select 'ldb.d_internal_organization_group_from a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_internal_organization_group_from a19 
on (a11.from_assignment_group_key = a19.row_key) 
union
select 'ldb.d_task_priority a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_task_priority a110 
on (a11.priority_src_key = a110.row_key) 
union
select 'ldb.d_incident_state a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_incident a12 
on (a11.incident_key = a12.row_key) 
join ldb.d_incident_state a111 
on (a12.state_src_key = a111.row_key) 
union
select 'ldb.d_calendar_month a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_calendar_date a13 
on (a11.assigned_on_key = a13.row_key) 
join ldb.d_calendar_month a112 
on (a13.month_start_date_key = a112.row_key) 
UNION 
SELECT 'd_scafe_core_realm_c' as Table_Name, count(a.row_key) as Row_count
FROM ldb.f_incident_activity a 
JOIN ldb.d_scafe_core_realm_c b ON a.scafe_core_realm_c_key=b.row_key
