 select 'ldb.f_problem' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
union
select 'ldb.d_problem' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_problem         a14
on (a11.problem_key = a14.row_key)
union
select 'ldb.d_configuration_item_problem_incident_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_configuration_item_problem_incident_c         a17
on (a11.incident_configuration_item_key = a17.row_key)
union
select 'ldb.d_problem_close_code_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_problem_close_code_c         a19
on (a11.close_code_src_c_key = a19.row_key)
union
select 'ldb.d_incident_infrastructure_category_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_incident_infrastructure_category_c         a113
on (a11.infrastructure_category_src_c_key = a113.row_key)
union
select 'ldb.d_task_priority_problem_incident_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_task_priority_problem_incident_c         a114
on (a11.incident_priority_src_key = a114.row_key)
union
select 'ldb.d_problem_sub_type_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem             a11 
join ldb.d_problem_sub_type_c         a119
on (a11.sub_type_src_c_key = a119.row_key)
