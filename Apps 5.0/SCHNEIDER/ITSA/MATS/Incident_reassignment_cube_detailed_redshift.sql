select'f_incident_activity' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_activity             a11 
union
select'd_calendar_date' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_activity             a11 
join ldb.d_calendar_date         a12
on (a11.assigned_on_key = a12.row_key)
union
select'd_calendar_month' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_activity             a11
join ldb.d_calendar_date         a12
on (a11.assigned_on_key = a12.row_key)
join ldb.d_calendar_month         a13
on (a12.month_start_date_key = a13.row_key)
union
select'd_internal_contact_to' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_activity             a11 
join ldb.d_internal_contact_to       a13
on (a11.to_assigned_to_key = a13.row_key)
union
select'd_internal_organization_group_to' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_activity             a11 
join ldb.d_internal_organization_group_to       a14
on (a11.to_assignment_group_key = a14.row_key)
union
select'd_internal_contact_from' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_activity             a11
join ldb.d_internal_contact_from       a14
on (a11.from_assigned_to_key = a14.row_key)
union
select'd_internal_organization_group_from' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_activity             a11
join ldb.d_internal_organization_group_from       a14
on (a11.from_assignment_group_key = a14.row_key)
union
select'd_incident' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_activity             a11
join ldb.d_incident       a14
on (a11.incident_key = a14.row_key)
select'd_incident_priority' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_activity             a11
join ldb.d_incident   a13
on (a11.incident_key = a13.row_key)
join ldb.d_incident_priority       a21
on (a13.priority_src_key = a21.row_key)
select'd_incident_state' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_activity             a11
join ldb.d_incident   a13
on (a11.incident_key = a13.row_key)
join ldb.d_incident_state       a21
on (a13.state_src_key = a21.row_key)
select'd_internal_contact_from' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_activity             a11
join ldb.d_internal_contact_from     a110
on (a11.from_assigned_to_key = a110.row_key)
select'd_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident_activity             a11
join ldb.d_internal_organization_group     a110
on (a11.current_assginment_group_key = a110.row_key)




