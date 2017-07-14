select 'ldb.f_incident_activity' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_activity       a11 
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_activity       a11 
join ldb.d_calendar_date       a12
on (a11.assigned_on_key=a12.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_activity       a11 
join ldb.d_calendar_date       a12
on (a11.assigned_on_key=a12.row_key)
join ldb.d_calendar_month       a13
on (a12.month_start_date_key=a13.row_key)
union
select'ldb.d_calendar_quarter' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_activity       a11 
join ldb.d_calendar_date       a12
on (a11.assigned_on_key=a12.row_key)
join ldb.d_calendar_quarter       a13
on (a12.quarter_start_date_key=a13.row_key)
union
select'ldb.d_calendar_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_activity       a11 
join ldb.d_calendar_date       a12
on (a11.assigned_on_key=a12.row_key)
join ldb.d_calendar_year       a13
on (a12.year_start_date_key=a13.row_key)
union
select'ldb.d_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_activity       a11 
join ldb.d_incident       a12
on (a11.incident_key=a12.row_key)
union
select'ldb.d_incident_contacttype' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_activity       a11 
join ldb.d_incident_contacttype       a12
on (a11.reported_type_src_key=a12.row_key)
union
select'ldb.d_incident_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_activity       a11 
 join ldb.d_incident       a12
on (a11.incident_key=a12.row_key)
join ldb.d_incident_priority       a13
on (a12.priority_src_key=a13.row_key)
union
select'ldb.d_incident_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_activity       a11 
 join ldb.d_incident       a12
on (a11.incident_key=a12.row_key)
join ldb.d_incident_state       a13
on (a12.state_src_key=a13.row_key)
union
select'ldb.d_internal_contact_from' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_activity       a11 
join ldb.d_internal_contact_from       a13
on (a11.from_assigned_to_key=a13.row_key)
union
select'ldb.d_internal_contact_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_activity       a11 
join ldb.d_internal_contact_to       a13
on (a11.to_assignment_group_key=a13.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_activity       a11 
join ldb.d_internal_organization_group       a13
on (a11.current_assginment_group_key=a13.row_key)
union
select'ldb.d_internal_organization_group_from' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_activity       a11 
join ldb.d_internal_organization_group_from       a13
on (a11.from_assignment_group_key=a13.row_key)
union
select'ldb.d_internal_organization_group_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_activity       a11 
join ldb.d_internal_organization_group_to       a13
on (a11.to_assignment_group_key=a13.row_key)
