SELECT CASE WHEN max_count<>min_count THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN  max_count<>min_count THEN 'OOTB has Keys Dropped' ELSE 'SUCCESS'  END as Message FROM (
 select max(Row_Count) max_count,Min(Row_Count) min_count from (
select  'ldb.f_incident_reassignment_analysis_summary' as Table_Name, count(a11.incident_key) Row_Count
 from  ldb.f_incident_reassignment_analysis_summary             a11 
union
select  'ldb.d_incident' as Table_Name, count(a11.incident_key) Row_Count
 from  ldb.f_incident_reassignment_analysis_summary             a11 
join ldb.d_incident           a12
on (a11.incident_key = a12.row_key)
union
select  'ldb.d_calendar_date' as Table_Name, count(a11.incident_key) Row_Count
 from  ldb.f_incident_reassignment_analysis_summary             a11 
join ldb.d_calendar_date           a13
on (a11.assigned_on_key = a13.row_key)
union
select  'ldb.d_internal_organization_group' as Table_Name, count(a11.incident_key) Row_Count
 from  ldb.f_incident_reassignment_analysis_summary             a11 
join ldb.d_internal_organization_group           a14
on (a11.assignment_group_key = a14.row_key)
union
select  'ldb.d_incident_contacttype_c' as Table_Name, count(a11.incident_key) Row_Count
 from  ldb.f_incident_reassignment_analysis_summary             a11 
join ldb.d_incident_contacttype_c           a15
on (a11.reported_type_src_key = a15.row_key)
union
select  'ldb.d_calendar_year' as Table_Name, count(a11.incident_key) Row_Count
 from  ldb.f_incident_reassignment_analysis_summary             a11 
 join ldb.d_calendar_date           a13
on (a11.assigned_on_key = a13.row_key)
join ldb.d_calendar_year           a16
on (a13.year_start_date_key = a16.row_key)
)a
)b
