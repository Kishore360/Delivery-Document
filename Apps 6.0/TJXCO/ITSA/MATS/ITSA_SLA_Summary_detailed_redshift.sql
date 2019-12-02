select 'ldb.f_incident_task_sla' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_task_sla       a11 
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_task_sla       a11 
join ldb.d_internal_organization_group       a12
on (a11.assignment_group_key=a12.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_task_sla       a11 
join ldb.d_calendar_date       a13
on (a11.date_key=a13.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_task_sla       a11 
 join ldb.d_calendar_date       a13
on (a11.date_key=a13.row_key)
join ldb.d_calendar_month       a14
on (a13.month_start_date_key=a14.row_key)
union
select'ldb.d_calendar_quarter' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_task_sla       a11 
  join ldb.d_calendar_date       a13
on (a11.date_key=a13.row_key)
join ldb.d_calendar_month       a14
on (a13.month_start_date_key=a14.row_key)
join ldb.d_calendar_quarter       a15
on (a14.quarter_start_date_key=a15.row_key)
union
select'ldb.d_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_task_sla       a11 
join ldb.d_incident       a16
on (a11.incident_key=a16.row_key)
union
select'ldb.d_task_sla' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_task_sla       a11 
join ldb.d_task_sla       a17
on (a11.sla_key=a17.row_key)
union
select'ldb.d_task_sla_stage' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_task_sla       a11 
join ldb.d_task_sla_stage       a18
on (a11.stage_src_key=a18.row_key)
union
select'ldb.d_incident_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_task_sla       a11 
 join ldb.d_incident       a16
on (a11.incident_key=a16.row_key)
join ldb.d_incident_priority       a19
on (a16.priority_src_key=a19.row_key)
union
select'ldb.d_task_sla_name' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_task_sla       a11 
 join ldb.d_task_sla       a17
on (a11.sla_key=a17.row_key)
join ldb.d_task_sla_name       a110
on (a17.sla_category_key=a110.row_key)
union
select'ldb.d_calendar_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_task_sla       a11 
   join ldb.d_calendar_date       a13
on (a11.date_key=a13.row_key)
join ldb.d_calendar_month       a14
on (a13.month_start_date_key=a14.row_key)
join ldb.d_calendar_quarter       a15
on (a14.quarter_start_date_key=a15.row_key)
join ldb.d_calendar_year       a111
on (a15.year_start_date_key=a111.row_key)



