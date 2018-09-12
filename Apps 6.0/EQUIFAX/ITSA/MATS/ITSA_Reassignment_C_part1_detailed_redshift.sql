select 'ldb.f_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_internal_organization_group       a12
on (a11.assignment_group_key=a12.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_calendar_date       a12
on (a11.date_key=a12.row_key)
union
select'ldb.d_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_incident       a12
on (a11.incident_key=a12.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_calendar_date       a12
on (a11.date_key=a12.row_key)
join ldb.d_calendar_month       a13
on (a12.month_start_date_key=a13.row_key)
union
select'ldb.d_incident_close_code' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_incident       a12
on (a11.incident_key=a12.row_key)
join ldb.d_incident_close_code       a13
on (a12.close_code_src_key=a13.row_key)
union
select'ldb.d_incident_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_incident       a12
on (a11.incident_key=a12.row_key)
join ldb.d_incident_priority       a13
on (a12.priority_src_key=a13.row_key)
union
select'ldb.d_incident_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_incident       a12
on (a11.incident_key=a12.row_key)
join ldb.d_incident_state       a13
on (a12.state_src_key=a13.row_key)
union
select'ldb.d_lov_incident_first_pass_reason_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_incident       a12
on (a11.incident_key=a12.row_key)
join ldb.d_lov_incident_first_pass_reason_c       a13
on (a12.first_pass_reason_c_key=a13.row_key)