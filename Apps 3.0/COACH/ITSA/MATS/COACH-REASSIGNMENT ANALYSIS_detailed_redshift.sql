select'ldb.f_incident_reassignment_analysis_c' as Table_Name, count(a11.incident_key) Row_Count
 from  ldb.f_incident_reassignment_analysis_c       a11 
union
select'ldb.d_incident' as Table_Name, count(a11.incident_key) Row_Count
 from  ldb.f_incident_reassignment_analysis_c       a11 
join ldb.d_incident       a12
on (a11.incident_key = a12.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.incident_key) Row_Count
 from  ldb.f_incident_reassignment_analysis_c       a11 
join ldb.d_calendar_date       a13
on (a11.created_on_key = a13.row_key)
union
select'ldb.d_calendar_date_opened' as Table_Name, count(a11.incident_key) Row_Count
 from  ldb.f_incident_reassignment_analysis_c       a11 
join ldb.d_calendar_date_opened       a14
on (a11.opened_on_key = a14.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.incident_key) Row_Count
 from  ldb.f_incident_reassignment_analysis_c       a11 
join ldb.d_internal_organization_group       a15
on (a11.old_assignment_group_key = a15.row_key)
union
select'ldb.d_internal_organization_group_reassignment_c' as Table_Name, count(a11.incident_key) Row_Count
 from  ldb.f_incident_reassignment_analysis_c       a11 
join ldb.d_internal_organization_group_reassignment_c       a16
on (a11.new_assignment_group_key = a16.row_key)
union
select'ldb.d_task_contacttype' as Table_Name, count(a11.incident_key) Row_Count
 from  ldb.f_incident_reassignment_analysis_c       a11 
join ldb.d_task_contacttype       a19
on (a11.reported_type_src_key = a19.row_key)
union
select'ldb.d_calendar_month_opened' as Table_Name, count(a11.incident_key) Row_Count
 from  ldb.f_incident_reassignment_analysis_c       a11 
JOIN ldb.d_calendar_date_opened	       a14	ON (a11.opened_on_key = a14.row_key)
join ldb.d_calendar_month_opened       a20
on (a14.month_start_date_key = a20.row_key)
