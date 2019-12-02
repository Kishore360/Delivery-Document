select 'ldb.f_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident       a11 
join ldb.d_internal_organization_group  a13 on (a11.assignment_group_key=a13.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident   a11 
join ldb.d_calendar_date  a14 on (a11.date_key=a14.row_key)
union
select'ldb.d_incident' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident a11 
join ldb.d_incident  a15 on (a11.incident_key=a15.row_key)
union
select 'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
from ldb.f_incident  a11 
join ldb.d_calendar_date  a14 on (a11.date_key=a14.row_key) 
join ldb.d_calendar_month  a110 on (a14.month_start_date_key=a110.row_key)
union
select 'ldb.d_incident_priority' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident a11 
join ldb.d_incident a15 on (a11.incident_key=a15.row_key) 
join ldb.d_incident_priority a111 on (a15.priority_src_key=a111.row_key)
union
select'ldb.d_incident_state' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_incident a11 
join ldb.d_incident a15 on (a11.incident_key=a15.row_key)
join ldb.d_incident_state a112 on (a15.state_src_key=a112.row_key);

