select 'ldb.f_problem_task' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_task       a11 
union
select'ldb.d_problem_task' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_task       a11 
join ldb.d_problem_task       a12
on (a11.problem_task_key=a12.row_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_task       a11 
join ldb.d_internal_contact_assigned_to       a13
on (a11.assigned_to_key=a13.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_task       a11 
join ldb.d_internal_organization_group       a14
on (a11.assignment_group_key=a14.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_task       a11 
join ldb.d_calendar_date       a15
on (a11.opened_on_key=a15.row_key)
union
select'ldb.d_problem' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_task       a11 
join ldb.d_problem       a16
on (a11.problem_key=a16.row_key)
union
select'ldb.d_application' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_task       a11 
join ldb.d_application       a17
on (a11.application_key=a17.row_key)
union
select'ldb.d_business_service' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_task       a11 
join ldb.d_business_service       a18
on (a11.business_service_key=a18.row_key)
union
select'ldb.d_configuration_item' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_task       a11 
join ldb.d_configuration_item       a19
on (a11.configuration_item_key=a19.row_key)
union
select'ldb.d_problem_assignment_group' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_task       a11 
join ldb.d_problem_assignment_group       a110
on (a11.problem_assignment_group_key=a110.row_key)
union
select'ldb.d_problem_priority' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_task       a11 
join ldb.d_problem_priority       a111
on (a11.problem_priority_src_key=a111.row_key)
union
select'ldb.d_problem_task_state' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_task       a11 
join ldb.d_problem_task_state       a112
on (a11.state_src_key=a112.row_key)
union
select'ldb.d_lov_problem_task_action_type_c' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_task       a11 
 join ldb.d_problem_task       a12
on (a11.problem_task_key=a12.row_key)
join ldb.d_lov_problem_task_action_type_c       a113
on (a12.action_type_src_c_key=a113.row_key)
union
select'ldb.d_problem_state' as Table_Name, count(1) Row_Count
 from  ldb.f_problem_task       a11 
join ldb.d_problem_state       a114
on (a11.problem_state_src_key=a114.row_key)