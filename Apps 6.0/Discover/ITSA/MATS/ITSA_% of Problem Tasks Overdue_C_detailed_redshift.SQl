/* Tables Accessed:
d_problem_task
d_problem_task_assigned_to_c
d_problem_task_assignment_group_c
d_problem_task_configuration_item_c
d_problem_task_priority_c
f_problem_task_detailed_c */

select 'ldb."f_problem_task_detailed_c" a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem_task_detailed_c" a11 
 union
select 'ldb."d_problem_task" a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem_task_detailed_c" a11 
 join "ldb"."d_problem_task" a12 
	on (a11.problem_task_key = a12.row_key)  
 union
select 'ldb."d_problem_task_assignment_group_c" a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem_task_detailed_c" a11 
 join "ldb"."d_problem_task" a12 
 on (a11.problem_task_key = a12.row_key) 
	join "ldb"."d_problem_task_assignment_group_c" a13 
	on (a12.problem_task_assignment_group_c_key = a13.row_key)  
 union
select 'ldb."d_problem_task_assigned_to_c" a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem_task_detailed_c" a11 
 join "ldb"."d_problem_task" a12 
 on (a11.problem_task_key = a12.row_key) 
	join "ldb"."d_problem_task_assigned_to_c" a14 
	on (a12.problem_task_assigned_to_c_key = a14.row_key)  
 union
select 'ldb."d_problem_task_configuration_item_c" a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem_task_detailed_c" a11 
 join "ldb"."d_problem_task" a12 
 on (a11.problem_task_key = a12.row_key) 
	join "ldb"."d_problem_task_configuration_item_c" a15 
	on (a12.problem_task_configuration_item_c_key = a15.row_key)  
 union
select 'ldb."d_problem_task_priority_c" a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_problem_task_detailed_c" a11 
 join "ldb"."d_problem_task" a12 
 on (a11.problem_task_key = a12.row_key) 
	join "ldb"."d_problem_task_priority_c" a16 
	on (a12.problem_task_priority_c_key = a16.row_key) 

