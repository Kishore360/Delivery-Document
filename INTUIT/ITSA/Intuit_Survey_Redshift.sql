SELECT CASE WHEN max_count<>min_count THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN  max_count<>min_count THEN 'OOTB has Keys Dropped' ELSE 'SUCCESS'  END as Message FROM (
 select max(Row_Count) max_count,Min(Row_Count) min_count from (
select'ldb.f_incident_response' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response             a11 
union
select'ldb.d_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response             a11 
join ldb.d_internal_organization_department      a12
on (a11.taken_by_department_key = a12.row_key)
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response             a11 
join ldb.d_internal_contact      a13
on (a11.sent_to_key = a13.row_key)
union
select'ldb.d_internal_organization_department_incident_task_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response             a11 
join ldb.d_internal_organization_department_incident_task_c      a14
on (a11.incident_task_department_key = a14.row_key)
union
select'ldb.d_internal_contact_caller_incident_task_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response             a11 
join ldb.d_internal_contact_caller_incident_task_c      a15
on (a11.incident_task_opened_by_key = a15.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response             a11 
join ldb.d_calendar_date      a16
on (a11.requested_on_key = a16.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response             a11 
 join ldb.d_calendar_date      a16
on (a11.requested_on_key = a16.row_key)
join ldb.d_calendar_month      a17
on (a16.month_start_date_key = a17.row_key)
)a
)b

