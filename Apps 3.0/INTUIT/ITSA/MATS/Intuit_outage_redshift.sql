SELECT CASE WHEN max_count<>min_count THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN  max_count<>min_count THEN 'OOTB has Keys Dropped' ELSE 'SUCCESS'  END as Message FROM (
 select max(Row_Count) max_count,Min(Row_Count) min_count from (
select 'ldb.f_outage_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_outage_c             a11 
union
select 'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_outage_c             a11 
join ldb.d_internal_contact         a12
on (a11.opened_by_key = a12.row_key)
union
select 'ldb.d_outage_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_outage_c             a11 
join ldb.d_outage_c         a13
on (a11.outage_key = a13.row_key)
union
select 'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_outage_c             a11 
join ldb.d_configuration_item         a14
on (a11.incident_configuration_item_key = a14.row_key)
union
select 'ldb.d_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_outage_c             a11 
join ldb.d_incident         a15
on (a11.incident_row_key = a15.row_key)
union
select 'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_outage_c             a11 
join ldb.d_calendar_date         a16
on (a11.outage_start_key = a16.row_key)
union
select 'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_outage_c             a11 
join ldb.d_configuration_item         a17
on (a11.configuration_item_key = a17.row_key)
union
select 'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_outage_c             a11 
join ldb.d_configuration_item         a18
on (a11.business_service_c_key = a18.row_key)
union
select 'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_outage_c             a11 
 join ldb.d_internal_contact         a12
on (a11.opened_by_key = a12.row_key)
join ldb.d_internal_contact_mdm         a19
on (a12.row_current_key = a19.row_current_key)
union
select 'ldb.d_incident_close_code' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_outage_c             a11 
join ldb.d_incident_close_code         a110
on (a11.close_code_src_key = a110.row_key)
union
select 'ldb.d_outage_severity_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_outage_c             a11 
join ldb.d_outage_severity_c         a111
on (a11.outage_severity_src_key = a111.row_key)
union
select 'ldb.d_incident_symptom_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_outage_c             a11 
join ldb.d_incident_symptom_c         a112
on (a11.symptom_src_c_key = a112.row_key)
union
select 'ldb.d_task_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_outage_c             a11 
join ldb.d_task_priority         a113
on (a11.priority_src_key = a113.row_key)
union
select 'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_outage_c             a11 
 join ldb.d_calendar_date         a16
on (a11.outage_start_key = a16.row_key)
join ldb.d_calendar_month         a114
on (a16.month_start_date_key = a114.row_key)
union
select 'ldb.d_calendar_week' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_outage_c             a11 
 join ldb.d_calendar_date         a16
on (a11.outage_start_key = a16.row_key)
join ldb.d_calendar_week         a115
on (a16.week_start_date_key = a115.row_key)
union
select 'ldb.d_calendar_quarter' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_outage_c             a11 
 join ldb.d_calendar_date         a16
on (a11.outage_start_key = a16.row_key)
join ldb.d_calendar_quarter         a116
on (a16.quarter_start_date_key = a116.row_key)
union
select 'ldb.d_calendar_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_outage_c             a11 
 join ldb.d_calendar_date         a16
on (a11.outage_start_key = a16.row_key)
join ldb.d_calendar_year         a117
on (a16.year_start_date_key = a117.row_key)
)a
)b

