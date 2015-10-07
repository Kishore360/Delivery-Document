SELECT CASE WHEN max_count<>min_count THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN  max_count<>min_count THEN 'OOTB has Keys Dropped' ELSE 'SUCCESS'  END as Message FROM (
 select max(Row_Count) max_count,Min(Row_Count) min_count from (
select  'ldb.f_incident_reassignment_analysis' as Table_Name, count(a11.incident_key) Row_Count
 from  ldb.f_incident_reassignment_analysis             a11 
union
select  'ldb.d_incident' as Table_Name, count(a11.incident_key) Row_Count
 from  ldb.f_incident_reassignment_analysis             a11 
join ldb.d_incident           a12
on (a11.incident_key = a12.row_key)
union
select  'ldb.d_calendar_date' as Table_Name, count(a11.incident_key) Row_Count
 from  ldb.f_incident_reassignment_analysis             a11 
join ldb.d_calendar_date           a13
on (a11.created_on_key = a13.row_key)
union
select  'ldb.d_internal_organization_group' as Table_Name, count(a11.incident_key) Row_Count
 from  ldb.f_incident_reassignment_analysis             a11 
join ldb.d_internal_organization_group           a14
on (a11.old_assignment_group_key = a14.row_key)
union
select  'ldb.d_internal_organization_group_new' as Table_Name, count(a11.incident_key) Row_Count
 from  ldb.f_incident_reassignment_analysis             a11 
join ldb.d_internal_organization_group_new           a15
on (a11.new_assignment_group_key = a15.row_key)
union
select  'ldb.d_incident_contacttype_c' as Table_Name, count(a11.incident_key) Row_Count
 from  ldb.f_incident_reassignment_analysis             a11 
join ldb.d_incident_contacttype_c           a16
on (a11.reported_type_src_key = a16.row_key)
union
select  'ldb.d_calendar_year' as Table_Name, count(a11.incident_key) Row_Count
 from  ldb.f_incident_reassignment_analysis             a11 
 join ldb.d_calendar_date           a13
on (a11.created_on_key = a13.row_key)
join ldb.d_calendar_year           a17
on (a13.year_start_date_key = a17.row_key)
)a
)b