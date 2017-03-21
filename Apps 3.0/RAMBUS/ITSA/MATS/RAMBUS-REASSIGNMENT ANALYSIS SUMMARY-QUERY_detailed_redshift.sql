select'ldb.f_incident_reassignment_analysis_summary_c' as Table_Name, count(a11.incident_key) Row_Count
 from  ldb.f_incident_reassignment_analysis_summary_c       a11 
union
select'ldb.d_incident' as Table_Name, count(a11.incident_key) Row_Count
 from  ldb.f_incident_reassignment_analysis_summary_c       a11 
join ldb.d_incident       a12
on (a11.incident_key = a12.row_key)
union
select'ldb.d_calendar_date_opened' as Table_Name, count(a11.incident_key) Row_Count
 from  ldb.f_incident_reassignment_analysis_summary_c       a11 
join ldb.d_calendar_date_opened       a13
on (a11.opened_on_key = a13.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.incident_key) Row_Count
 from  ldb.f_incident_reassignment_analysis_summary_c       a11 
join ldb.d_calendar_date       a14
on (a11.assigned_on_key = a14.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.incident_key) Row_Count
 from  ldb.f_incident_reassignment_analysis_summary_c       a11 
join ldb.d_internal_organization_group       a15
on (a11.assignment_group_key = a15.row_key)
union
select'ldb.d_configuration_item' as Table_Name, count(a11.incident_key) Row_Count
 from  ldb.f_incident_reassignment_analysis_summary_c       a11 
join ldb.d_configuration_item       a16
on (a11.business_service_c_key = a16.row_key)
union
select'ldb.d_incident_category' as Table_Name, count(a11.incident_key) Row_Count
 from  ldb.f_incident_reassignment_analysis_summary_c       a11 
join ldb.d_incident_category       a17
on (a11.category_src_key = a17.row_key)
union
select'ldb.d_task_contacttype' as Table_Name, count(a11.incident_key) Row_Count
 from  ldb.f_incident_reassignment_analysis_summary_c       a11 
join ldb.d_task_contacttype       a18
on (a11.reported_type_src_key = a18.row_key)
union
select'ldb.d_calendar_month_opened' as Table_Name, count(a11.incident_key) Row_Count
 from  ldb.f_incident_reassignment_analysis_summary_c       a11 
JOIN ldb.d_calendar_date_opened	       a13	ON (a11.opened_on_key = a13.row_key)
join ldb.d_calendar_month_opened       a19
on (a13.month_start_date_key = a19.row_key)
)A)B
