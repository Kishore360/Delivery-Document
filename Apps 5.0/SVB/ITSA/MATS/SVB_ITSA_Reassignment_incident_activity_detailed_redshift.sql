select 'ldb.f_incident_activity' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_activity       a11 
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_activity       a11 
join ldb.d_calendar_date a13
on          (a11.assigned_on_key = a13.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_activity       a11 
 join ldb.d_calendar_date a13
on          (a11.assigned_on_key = a13.row_key)
join ldb.d_calendar_month a14
on          (a13.month_start_date_key = a14.row_key)
union
select'ldb.d_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_activity       a11 
join ldb.d_incident a13
on          (a11.incident_key = a13.row_key)
union
select'ldb.d_incident_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_activity       a11
 join ldb.d_incident a13
on          (a11.incident_key = a13.row_key)
join ldb.d_incident_priority a14
on          (a13.priority_src_key = a14.row_key)
union
select'ldb.d_incident_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_activity       a11
 join ldb.d_incident a13
on          (a11.incident_key = a13.row_key)
join ldb.d_incident_state a14
on          (a13.state_src_key = a14.row_key)
union
select'ldb.d_internal_contact_from' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_activity       a11 
join ldb.d_internal_contact_from a13
on          (a11.from_assigned_to_key = a13.row_key)
union
select'ldb.d_internal_contact_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_activity       a11 
join ldb.d_internal_contact_to a13
on          (a11.to_assignment_group_key = a13.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_activity       a11 
join ldb.d_internal_organization_group a13
on          (a11.current_assginment_group_key = a13.row_key)
union
select'ldb.d_internal_organization_group_from' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_activity       a11 
join ldb.d_internal_organization_group_from a13
on          (a11.from_assignment_group_key = a13.row_key)
union
select'ldb.d_internal_organization_group_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_activity       a11 
join ldb.d_internal_organization_group_to a13
on          (a11.to_assignment_group_key = a13.row_key)