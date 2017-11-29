/* d_calendar_date
d_calendar_month
d_internal_contact_from
d_internal_contact_to
d_internal_contact_updated_by_c
d_internal_organization_group
d_internal_organization_group_from
d_internal_organization_group_new_c
d_internal_organization_group_old_c
d_internal_organization_group_to
d_task done 
d_task_ra_priority_c done 
d_task_state done 
d_task_type done 
f_incident_activity */


SELECT 'f_incident_activity' as TABLE_NAME , Count(1) as Row_Count
FROM ldb.f_incident_activity a 
UNION 
SELECT 'd_task' as TABLE_NAME , Count(1) as Row_Count
FROM ldb.f_incident_activity a
JOIN ldb.d_task b ON a.task_key=b.row_key
UNION 
SELECT 'd_task_type' as TABLE_NAME , Count(1) as Row_Count
FROM ldb.f_incident_activity a
JOIN ldb.d_task b ON a.task_key=b.row_key
JOIN ldb.d_task_type c ON b.task_type_src_key=c.row_key
UNION 
SELECT 'd_task_state' as TABLE_NAME , Count(1) as Row_Count
FROM ldb.f_incident_activity a
JOIN ldb.d_task b ON a.task_key=b.row_key
JOIN ldb.d_task_state c ON b.state_src_key=c.row_key
UNION 
SELECT 'd_task_ra_priority_c' as TABLE_NAME , Count(1) as Row_Count
FROM ldb.f_incident_activity a
JOIN ldb.d_task_ra_priority_c b ON a.priority_src_key=b.row_key
UNION 
select 'ldb.d_internal_organization_group_to a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_internal_organization_group_to a16 on (a11.to_assignment_group_key = a16.row_key) 
UNION 
SELECT 'ldb.d_internal_organization_group_old_c' as Table_Name,count(a11.row_key) as Row_Count
FROM ldb.f_incident_activity a11
JOIN ldb.d_internal_organization_group_old_c a12 ON (a11.old_vendor_c_key=a12.row_key)
UNION 
SELECT 'ldb.d_internal_organization_group_new_c' as Table_Name,count(a11.row_key) as Row_count
FROM ldb.f_incident_activity a11
JOIN ldb.d_internal_organization_group_new_c a12 ON (a11.new_vendor_c_key=a12.row_key)
UNION 
select 'ldb.d_internal_organization_group_from a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_internal_organization_group_from a18 on (a11.from_assignment_group_key = a18.row_key) 
UNION 
select 'ldb.d_internal_organization_group a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_internal_organization_group a14  on (a11.current_assginment_group_key = a14.row_key) 
UNION 
select 'ldb.d_internal_contact_to a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_internal_contact_to a15  on (a11.to_assigned_to_key = a15.row_key) 
UNION 
select 'ldb.d_internal_contact_from a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_internal_contact_from a17 on (a11.from_assigned_to_key = a17.row_key) 
UNION
select 'ldb.d_calendar_month a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_calendar_date a13 on (a11.assigned_on_key = a13.row_key) 
join ldb.d_calendar_month a112 on (a13.month_start_date_key = a112.row_key)
UNION 
select 'ldb.d_calendar_date a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_activity a11 
join ldb.d_calendar_date a13  on (a11.assigned_on_key = a13.row_key) 
UNION 
SELECT 'd_internal_contact_updated_by_c' as TABLE_NAME , Count(1) as Row_Count
FROM ldb.f_incident_activity a
JOIN ldb.d_internal_contact_updated_by_c b ON a.updated_by_c_key=b.row_key



