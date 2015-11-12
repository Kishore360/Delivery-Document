SELECT CASE WHEN max_count<>min_count THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN  max_count<>min_count THEN 'OOTB has Keys Dropped' ELSE 'SUCCESS'  END as Message FROM (
 select max(Row_Count) max_count,Min(Row_Count) min_count from (
select 'ldb.f_problem_task' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task             a11 
union
select 'ldb.d_calendar_time' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task             a11 
join ldb.d_calendar_time         a12
on (a11.opened_time_key = a12.row_key)
union
select 'ldb.d_problem' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task             a11 
join ldb.d_problem         a13
on (a11.problem_key = a13.row_key)
union
select 'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task             a11 
join ldb.d_calendar_date         a14
on (a11.incident_opened_on_key = a14.row_key)
union
select 'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task             a11 
join ldb.d_calendar_date         a15
on (a11.opened_on_key = a15.row_key)
union
select 'ldb.d_configuration_item_problem_incident_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task             a11 
join ldb.d_configuration_item_problem_incident_c         a16
on (a11.incident_configuration_item_key = a16.row_key)
union
select 'ldb.d_problem_task' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task             a11 
join ldb.d_problem_task         a17
on (a11.problem_task_key = a17.row_key)
union
select 'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task             a11 
join ldb.d_internal_contact         a18
on (a11.assigned_to_key = a18.row_key)
union
select 'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task             a11 
join ldb.d_internal_organization_group         a19
on (a11.assignment_group_key = a19.row_key)
union
select 'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task             a11 
join ldb.d_configuration_item         a110
on (a11.configuration_item_key = a110.row_key)
union
select 'ldb.d_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task             a11 
join ldb.d_incident         a111
on (a11.initial_incident_c_key = a111.row_key)
union
select 'ldb.d_incident_infrastructure_category_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task             a11 
join ldb.d_incident_infrastructure_category_c         a112
on (a11.infrastructure_category_src_c_key = a112.row_key)
union
select 'ldb.d_internal_organization_problem_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task             a11 
join ldb.d_internal_organization_problem_c         a113
on (a11.problem_assignment_group_key = a113.row_key)
union
select 'ldb.d_configuration_item_problem_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task             a11 
join ldb.d_configuration_item_problem_c         a114
on (a11.problem_configuration_item_key = a114.row_key)
union
select 'ldb.d_task_priority_problem_incident_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task             a11 
join ldb.d_task_priority_problem_incident_c         a115
on (a11.incident_priority_src_key = a115.row_key)
union
select 'ldb.d_task_priority_problem_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task             a11 
join ldb.d_task_priority_problem_c         a116
on (a11.problem_priority_src_key = a116.row_key)
union
select 'ldb.d_task_contacttype_problem_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task             a11 
join ldb.d_task_contacttype_problem_c         a117
on (a11.problem_reported_type_src_key = a117.row_key)
union
select 'ldb.d_task_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task             a11 
join ldb.d_task_state         a118
on (a11.state_src_key = a118.row_key)
union
select 'ldb.d_task_urgency_problem_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task             a11 
join ldb.d_task_urgency_problem_c         a119
on (a11.problem_urgency_src_key = a119.row_key)
union
select 'ldb.d_problem_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task             a11 
join ldb.d_problem_state         a120
on (a11.problem_state_src_key = a120.row_key)
union
select 'ldb.d_task_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task             a11 
join ldb.d_task_priority         a121
on (a11.priority_src_key = a121.row_key)
union
select 'ldb.d_task_contacttype' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task             a11 
join ldb.d_task_contacttype         a122
on (a11.reported_type_src_key = a122.row_key)
union
select 'ldb.d_task_urgency' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task             a11 
join ldb.d_task_urgency         a123
on (a11.urgency_src_key = a123.row_key)
union
select 'ldb.d_calendar_week' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task             a11
 join ldb.d_calendar_date         a14
on (a11.incident_opened_on_key = a14.row_key)
join ldb.d_calendar_week         a124
on (a14.week_start_date_key = a124.row_key)
union
select 'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task             a11 
 join ldb.d_calendar_date         a15
on (a11.opened_on_key = a15.row_key)
join ldb.d_calendar_month         a125
on (a15.month_start_date_key = a125.row_key)
union
select 'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task             a11 
 join ldb.d_calendar_date         a14
on (a11.incident_opened_on_key = a14.row_key)
join ldb.d_calendar_month         a126
on (a14.month_start_date_key = a126.row_key)
union
select 'ldb.d_calendar_quarter' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task             a11 
 join ldb.d_calendar_date         a14
on (a11.incident_opened_on_key = a14.row_key)
join ldb.d_calendar_quarter         a127
on (a14.quarter_start_date_key = a127.row_key)
union
select 'ldb.d_calendar_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task             a11
 join ldb.d_calendar_date         a14
on (a11.incident_opened_on_key = a14.row_key)
join ldb.d_calendar_year         a128
on (a14.year_start_date_key = a128.row_key)
)a
)b
