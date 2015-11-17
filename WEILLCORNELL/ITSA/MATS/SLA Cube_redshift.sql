SELECT CASE WHEN max_count<>min_count THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN  max_count<>min_count THEN 'OOTB has Keys Dropped' ELSE 'SUCCESS'  END as Message FROM (
 select max(Row_Count) max_count,Min(Row_Count) min_count from (
select'ldb.f_incident_task_sla' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_task_sla       a11 
union
select'ldb.d_task_sla_stage' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_task_sla       a11 
join ldb.d_task_sla_stage       a12
on (a11.stage_src_key = a12.row_key)
union
select'ldb.dh_user_group_classification_hierarchy' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_task_sla       a11 
join ldb.dh_user_group_classification_hierarchy       a13
on (a11.assignment_group_key = a13.user_group_key)
union
select'ldb.dh_assignment_group_tier_hierarchy' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_task_sla       a11 
join ldb.dh_assignment_group_tier_hierarchy       a14
on (a11.assignment_group_key = a14.user_group_tier_key)
union
select'ldb.dh_assignment_group_type_hierarchy' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_task_sla       a11 
join ldb.dh_assignment_group_type_hierarchy       a15
on (a11.assignment_group_key = a15.user_group_type_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_task_sla       a11 
join ldb.d_calendar_date       a16
on (a11.start_on_key = a16.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_task_sla       a11 
join ldb.d_internal_organization_group       a17
on (a11.assignment_group_key = a17.row_key)
union
select'ldb.d_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_task_sla       a11 
join ldb.d_incident       a18
on (a11.incident_key = a18.row_key)
union
select'ldb.d_task_sla' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_task_sla       a11 
join ldb.d_task_sla       a19
on (a11.sla_key = a19.row_key)
union
select'ldb.dh_user_group_classification_hierarchy_level1' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_task_sla       a11 
 join ldb.dh_user_group_classification_hierarchy	       a13
on (a11.assignment_group_key = a13.user_group_key)
join ldb.dh_user_group_classification_hierarchy_level1       a110
on (a13.user_group_classification_level1 = a110.user_group_level1_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_task_sla       a11 
 join ldb.d_calendar_date	       a16
on (a11.start_on_key = a16.row_key)
join ldb.d_calendar_month       a111
on (a16.month_start_date_key = a111.row_key)
union
select'ldb.d_calendar_week' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_task_sla       a11 
  join ldb.d_calendar_date	       a16
on (a11.start_on_key = a16.row_key)
join ldb.d_calendar_week       a112
on (a16.week_start_date_key = a112.row_key)
union
select'ldb.d_calendar_quarter' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_task_sla       a11 
  join ldb.d_calendar_date	       a16
on (a11.start_on_key = a16.row_key)
join ldb.d_calendar_quarter       a113
on (a16.quarter_start_date_key = a113.row_key)
)a
)b
