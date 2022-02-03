select 'ldb.f_problem_task_credit_score_detail a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem_task_credit_score_detail a11 
 union
select 'ldb.d_internal_organization_group a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem_task_credit_score_detail a11 
 join ldb.d_internal_organization_group a12 
	on (a11.assignment_group_key = a12.row_key)  
 union
select 'ldb.d_assignment_group_manager a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem_task_credit_score_detail a11 
 join ldb.d_internal_organization_group a12 
 on (a11.assignment_group_key = a12.row_key) 
	join ldb.d_assignment_group_manager a13 
	on (a12.assignment_group_manager_key = a13.row_key)  
 union
select 'ldb.d_problem_task a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_problem_task_credit_score_detail a11 
 join ldb.d_problem_task a14 
	on (a11.problem_task_key = a14.row_key) 

