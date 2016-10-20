
select'f_incident_activity' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_activity             a11 
union
select'd_task_priority' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_activity              a11 
join ldb.d_task_priority         a12
on (a11.priority_src_key = a12.row_key)
 union
select'd_internal_organization_group_to' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_activity              a11 
join ldb.d_internal_organization_group_to         a12
on (a11.to_assignment_group_key  = a12.row_key)
union
select'd_internal_organization_group_from' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_activity              a11 
join ldb.d_internal_organization_group_from         a12
on (a11.from_assignment_group_key = a12.row_key)
 union
select'd_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_activity              a11 
join ldb.d_internal_organization_group         a12
on (a11.current_assginment_group_key  = a12.row_key)
union
select'd_internal_contact_to' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_activity              a11 
join ldb.d_internal_contact_to         a12
on (a11.to_assigned_to_key = a12.row_key)
union
select'd_internal_contact_from' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_activity              a11 
join ldb.d_internal_contact_from         a12
on (a11.from_assigned_to_key = a12.row_key)
union
select'd_incident' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_activity              a11 
join ldb.d_incident         a12
on (a11.incident_key = a12.row_key)
union
select'd_calendar_month' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_activity              a11 
join ldb.d_calendar_date         a12
on (a11.assigned_on_key = a12.row_key)
join ldb.d_calendar_month         a120
on (a12.month_start_date_key   = a120.row_key)
union
select'd_calendar_date' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_activity              a11 
join ldb.d_calendar_date         a12
on (a11.assigned_on_key = a12.row_key)






