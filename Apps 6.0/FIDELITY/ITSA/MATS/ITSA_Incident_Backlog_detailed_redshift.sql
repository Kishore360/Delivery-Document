select 'ldb.f_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident  a11 
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident  a11 
join ldb.d_calendar_date  a12
on (a11.date_key=a12.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident  a11 
join ldb.d_internal_organization_group  a13
on (a11.assignment_group_key=a13.row_key)
union
select'ldb.d_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident  a11 
join ldb.d_incident  a14
on (a11.incident_key=a14.row_key)
union
select'ldb.d_incident_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident  a11 
 join ldb.d_incident  a14
on (a11.incident_key=a14.row_key)
join ldb.d_incident_priority  a15
on (a14.priority_src_key=a15.row_key)
union
select'ldb.d_incident_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident  a11 
 join ldb.d_incident  a14
on (a11.incident_key=a14.row_key)
join ldb.d_incident_state  a16
on (a14.state_src_key=a16.row_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident  a11 
join ldb.d_internal_contact_assigned_to  a17
on (a11.assigned_to_key=a17.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident  a11 
 join ldb.d_calendar_date  a12
on (a11.date_key=a12.row_key)
join ldb.d_calendar_month  a18
on (a12.month_start_date_key=a18.row_key);
