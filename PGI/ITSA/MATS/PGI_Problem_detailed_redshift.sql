select'ldb.f_problem' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_internal_contact         a12
on (a11.opened_by_key = a12.row_key)
union
select'ldb.d_calendar_time' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_calendar_time         a13
on (a11.opened_time_key = a13.row_key)
union
select'ldb.d_problem' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_problem         a14
on (a11.problem_key = a14.row_key)
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_internal_contact         a15
on (a11.assigned_to_key = a15.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_internal_organization_group         a16
on (a11.assignment_group_key = a16.row_key)
union
select'ldb.d_problem_closure_code_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_problem_closure_code_c         a17
on (a11.closure_code_src_c_key = a17.row_key)
union
select'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_configuration_item         a18
on (a11.configuration_item_key = a18.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_calendar_date         a19
on (a11.opened_on_key = a19.row_key)
union
select'ldb.d_problem_duplicate_problem' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_problem_duplicate_problem         a110
on (a11.duplicate_problem_number_c_key = a110.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
 join ldb.d_internal_contact         a12
on (a11.opened_by_key = a12.row_key)
join ldb.d_internal_contact_mdm         a111
on (a12.row_current_key = a111.row_current_key)
union
select'ldb.d_problem_highest_level_of_cust_imp_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_problem_highest_level_of_cust_imp_c         a112
on (a11.highest_level_of_cust_impacted_src_c_key = a112.row_key)
union
select'ldb.d_problem_phase_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_problem_phase_c         a113
on (a11.phase_src_c_key = a113.row_key)
union
select'ldb.d_internal_contact_prob_mgmt_pt_of_contact_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_internal_contact_prob_mgmt_pt_of_contact_c         a114
on (a11.prob_mgmt_point_of_contact_c_key = a114.row_key)
union
select'ldb.d_problem_state' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_problem_state         a115
on (a11.state_src_key = a115.row_key)
union
select'ldb.d_problem_root_cause_category_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_problem_root_cause_category_c         a116
on (a11.root_cause_category_src_c_key = a116.row_key)
union
select'ldb.d_problem_source_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_problem_source_c         a117
on (a11.source_src_c_key = a117.row_key)
union
select'ldb.d_internal_contact_submitted_by_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_internal_contact_submitted_by_c         a118
on (a11.submitted_by_c_key = a118.row_key)
union
select'ldb.d_task_priority' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_task_priority         a119
on (a11.priority_src_key = a119.row_key)
union
select'ldb.d_task_contacttype' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_task_contacttype         a120
on (a11.reported_type_src_key = a120.row_key)
union
select'ldb.d_task_urgency' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_task_urgency         a121
on (a11.urgency_src_key = a121.row_key)
