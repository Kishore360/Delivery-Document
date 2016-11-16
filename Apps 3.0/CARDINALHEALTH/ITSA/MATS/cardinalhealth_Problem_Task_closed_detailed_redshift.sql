select 'ldb.f_problem_task_closed_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task_closed_c       a11 
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task_closed_c       a11 
join ldb.d_internal_organization_group       a12
on (a11.assignment_group_key=a12.row_key)
union
select'ldb.d_internal_contact_emp_seniors_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task_closed_c       a11 
 join ldb.d_internal_organization_group       a12
on (a11.assignment_group_key=a12.row_key)
join ldb.d_internal_contact_emp_seniors_c       a13
on (a12.manager_c_key=a13.row_key)
union
select'ldb.d_assignment_group_level0_manager_c_relation' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task_closed_c       a11 
join ldb.d_assignment_group_level0_manager_c_relation       a14
on (a11.assignment_group_key=a14.level0_assigment_group_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task_closed_c       a11 
join ldb.d_calendar_date       a15
on (a11.closed_on_key=a15.row_key)
union
select'ldb.d_internal_organization_causal_assignment_group_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task_closed_c       a11 
join ldb.d_internal_organization_causal_assignment_group_c       a16
on (a11.causal_assignment_group_c_key=a16.row_key)
union
select'ldb.d_calendar_greg_fiscal_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task_closed_c       a11 
join ldb.d_calendar_greg_fiscal_c       a17
on (a11.closed_on_key=a17.greogrian_calendar_key)
union
select'ldb.d_calendar_date_fiscal' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task_closed_c       a11 
 join ldb.d_calendar_greg_fiscal_c       a17
on (a11.closed_on_key=a17.greogrian_calendar_key)
join ldb.d_calendar_date_fiscal       a18
on (a17.fiscal_key=a18.row_key)
union
select'ldb.d_problem_task' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task_closed_c       a11 
join ldb.d_problem_task       a19
on (a11.problem_task_key=a19.row_key)
union
select'ldb.d_configuation_item_affected_ci_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task_closed_c       a11 
join ldb.d_configuation_item_affected_ci_c       a110
on (a11.affected_configuration_item_c_key=a110.row_key)
union
select'ldb.d_internal_contact_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task_closed_c       a11 
join ldb.d_internal_contact_assigned_to       a111
on (a11.assigned_to_key=a111.row_key)
union
select'ldb.d_lov_problem_complexity_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task_closed_c       a11 
join ldb.d_lov_problem_complexity_c       a112
on (a11.complexity_src_c_key=a112.row_key)
union
select'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task_closed_c       a11 
join ldb.d_configuration_item       a113
on (a11.configuration_item_key=a113.row_key)
union
select'ldb.d_problem' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task_closed_c       a11 
join ldb.d_problem       a114
on (a11.problem_key=a114.row_key)
union
select'ldb.d_problem_task_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task_closed_c       a11 
join ldb.d_problem_task_priority       a115
on (a11.priority_src_key=a115.row_key)
union
select'ldb.d_problem_task_reported_type' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task_closed_c       a11 
join ldb.d_problem_task_reported_type       a116
on (a11.reported_type_src_key=a116.row_key)
union
select'ldb.d_problem_task_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task_closed_c       a11 
join ldb.d_problem_task_state       a117
on (a11.state_src_key=a117.row_key)
union
select'ldb.d_internal_contact_requested_for_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task_closed_c       a11 
join ldb.d_internal_contact_requested_for_c       a118
on (a11.requested_for_c_key=a118.row_key)
union
select'ldb.d_rm_status_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task_closed_c       a11 
join ldb.d_rm_status_c       a119
on (a11.status_rm_src_c_key=a119.row_key)
union
select'ldb.d_internal_contact_task_closed_by' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task_closed_c       a11 
join ldb.d_internal_contact_task_closed_by       a120
on (a11.closed_by_key=a120.row_key)
union
select'ldb.d_assignment_group_level0_manager_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task_closed_c       a11 
 join ldb.d_assignment_group_level0_manager_c_relation       a14
on (a11.assignment_group_key=a14.level0_assigment_group_key)
join ldb.d_assignment_group_level0_manager_c       a121
on (a14.level0_manager_c_key=a121.level0_manager_c_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task_closed_c       a11 
 join ldb.d_calendar_date       a15
on (a11.closed_on_key=a15.row_key)
join ldb.d_calendar_month       a128
on (a15.month_start_date_key=a128.row_key)
union
select'ldb.d_internal_contact_causal_assignment_group_director_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task_closed_c       a11 
 join ldb.d_internal_organization_causal_assignment_group_c       a16
on (a11.causal_assignment_group_c_key=a16.row_key)
join ldb.d_internal_contact_causal_assignment_group_director_c       a122
on (a16.director_c_key=a122.row_key)
union
select'ldb.d_internal_contact_assignment_grp_manager_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task_closed_c       a11 
 join ldb.d_internal_organization_causal_assignment_group_c       a16
on (a11.causal_assignment_group_c_key=a16.row_key)
join ldb.d_internal_contact_assignment_grp_manager_c       a123
on (a16.manager_c_key=a123.row_key)
union
select'ldb.d_internal_contact_causal_assignment_group_vp_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task_closed_c       a11 
 join ldb.d_internal_organization_causal_assignment_group_c       a16
on (a11.causal_assignment_group_c_key=a16.row_key)
join ldb.d_internal_contact_causal_assignment_group_vp_c       a124
on (a16.vp_c_key=a124.row_key)
union
select'ldb.d_calendar_fiscal_period' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task_closed_c       a11
 join ldb.d_calendar_greg_fiscal_c       a17
on (a11.closed_on_key=a17.greogrian_calendar_key)
join ldb.d_calendar_date_fiscal       a18
on (a17.fiscal_key=a18.row_key)
join ldb.d_calendar_fiscal_period       a125
on (a18.period_start_date_key=a125.row_key)
union
select'ldb.d_calendar_fiscal_quarter' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task_closed_c       a11 
 join ldb.d_calendar_greg_fiscal_c       a17
on (a11.closed_on_key=a17.greogrian_calendar_key)
join ldb.d_calendar_date_fiscal       a18
on (a17.fiscal_key=a18.row_key)
join ldb.d_calendar_fiscal_quarter       a126
on (a18.quarter_start_date_key=a126.row_key)
union
select'ldb.d_calendar_fiscal_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task_closed_c       a11 
 join ldb.d_calendar_greg_fiscal_c       a17
on (a11.closed_on_key=a17.greogrian_calendar_key)
join ldb.d_calendar_date_fiscal       a18
on (a17.fiscal_key=a18.row_key)
join ldb.d_calendar_fiscal_year       a127
on (a18.year_start_date_key=a127.row_key)







