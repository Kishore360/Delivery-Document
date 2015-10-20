SELECT CASE WHEN max_count<>min_count THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN  max_count<>min_count THEN 'OOTB has Keys Dropped' ELSE 'SUCCESS'  END as Message FROM (
 select max(Row_Count) max_count,Min(Row_Count) min_count from (
select'ldb.f_incident_reassignment_analysis_summary_c' as Table_Name, count(a11.incident_key) Row_Count
 from  ldb.f_incident_reassignment_analysis_summary_c             a11 
union
select'ldb.d_incident' as Table_Name, count(a11.incident_key) Row_Count
 from  ldb.f_incident_reassignment_analysis_summary_c             a11 
join ldb.d_incident         a12
on (a11.incident_key = a12.row_key)
union
select'ldb.d_calendar_date_opened' as Table_Name, count(a11.incident_key) Row_Count
 from  ldb.f_incident_reassignment_analysis_summary_c             a11 
join ldb.d_calendar_date_opened         a13
on (a11.opened_on_key = a13.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.incident_key) Row_Count
 from  ldb.f_incident_reassignment_analysis_summary_c             a11 
join ldb.d_calendar_date         a14
on (a11.assigned_on_key = a14.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.incident_key) Row_Count
 from  ldb.f_incident_reassignment_analysis_summary_c             a11 
join ldb.d_internal_organization_group         a15
on (a11.assignment_group_key = a15.row_key)
union
select'ldb.d_task_contacttype' as Table_Name, count(a11.incident_key) Row_Count
 from  ldb.f_incident_reassignment_analysis_summary_c             a11 
join ldb.d_task_contacttype         a16
on (a11.reported_type_src_key = a16.row_key)
union
select'ldb.d_calendar_month_opened' as Table_Name, count(a11.incident_key) Row_Count
 from  ldb.f_incident_reassignment_analysis_summary_c             a11 
 join ldb.d_calendar_date_opened         a13
on (a11.opened_on_key = a13.row_key)
join ldb.d_calendar_month_opened         a17
on (a13.month_start_date_key = a17.row_key)
)a
)b
