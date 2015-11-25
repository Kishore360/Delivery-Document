SELECT CASE WHEN max_count<>min_count THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN  max_count<>min_count THEN 'OOTB has Keys Dropped' ELSE 'SUCCESS'  END as Message FROM (
 select max(Row_Count) max_count,Min(Row_Count) min_count from (
 select'ldb.f_problem' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_internal_contact      a12
on (a11.opened_by_key = a12.row_key)
union
select'ldb.d_calendar_time' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_calendar_time      a13
on (a11.opened_time_key = a13.row_key)
union
select'ldb.d_problem' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_problem      a14
on (a11.problem_key = a14.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_calendar_date      a15
on (a11.incident_opened_on_key = a15.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_calendar_date      a16
on (a11.opened_on_key = a16.row_key)
union
select'ldb.d_configuration_item_problem_incident_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_configuration_item_problem_incident_c      a17
on (a11.incident_configuration_item_key = a17.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_internal_organization_group      a18
on (a11.assignment_group_key = a18.row_key)
union
select'ldb.d_problem_close_code_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_problem_close_code_c      a19
on (a11.close_code_src_code_key_c = a19.row_key)
union
select'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_configuration_item      a110
on (a11.configuration_item_key = a110.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
 join ldb.d_internal_contact      a12
on (a11.opened_by_key = a12.row_key)
join ldb.d_internal_contact_mdm      a111
on (a12.row_current_key = a111.row_current_key)
union
select'ldb.d_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_incident      a112
on (a11.initial_incident_key_c = a112.row_key)
union
select'ldb.d_incident_infrastructure_category_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_incident_infrastructure_category_c      a113
on (a11.infrastructure_category_src_key_c = a113.row_key)
union
select'ldb.d_task_priority_problem_incident_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_task_priority_problem_incident_c      a114
on (a11.incident_priority_src_key = a114.row_key)
union
select'ldb.d_problem_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_problem_state      a115
on (a11.state_src_key = a115.row_key)
union
select'ldb.d_task_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_task_priority      a116
on (a11.priority_src_key = a116.row_key)
union
select'ldb.d_task_contacttype' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_task_contacttype      a117
on (a11.reported_type_src_key = a117.row_key)
union
select'ldb.d_task_urgency' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_task_urgency      a118
on (a11.urgency_src_key = a118.row_key)
union
select'ldb.d_problem_sub_type_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_problem_sub_type_c      a119
on (a11.sub_type_src_code_key_c = a119.row_key)
union
select'ldb.d_calendar_week' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
 join ldb.d_calendar_date      a15
on (a11.incident_opened_on_key = a15.row_key)
join ldb.d_calendar_week      a120
on (a15.week_start_date_key = a120.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
 join ldb.d_calendar_date      a16
on (a11.opened_on_key = a16.row_key)
join ldb.d_calendar_month      a121
on (a16.month_start_date_key = a121.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
 join ldb.d_calendar_date      a15
on (a11.incident_opened_on_key = a15.row_key)
join ldb.d_calendar_month      a122
on (a15.month_start_date_key = a122.row_key)
union
select'ldb.d_calendar_quarter' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
 join ldb.d_calendar_date      a15
on (a11.incident_opened_on_key = a15.row_key)
join ldb.d_calendar_quarter      a123
on (a15.quarter_start_date_key = a123.row_key)
union
select'ldb.d_calendar_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
 join ldb.d_calendar_date      a15
on (a11.incident_opened_on_key = a15.row_key)
join ldb.d_calendar_year      a124
on (a15.year_start_date_key = a124.row_key)
)a
)b
