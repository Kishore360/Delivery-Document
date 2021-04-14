/* Tables Accessed:
d_change_task
d_change_task_assigned_to_c
d_change_task_assignment_group_c
d_change_task_configuration_item_c
d_change_task_priority
f_change_task_detailed_c */

select 'ldb."f_change_task_detailed_c" a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task_detailed_c" a11 
 union
select 'ldb."d_change_task" a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task_detailed_c" a11 
 join "ldb"."d_change_task" a12 
	on (a11.change_task_key = a12.row_key)  
 union
select 'ldb."d_change_task_assignment_group_c" a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task_detailed_c" a11 
 join "ldb"."d_change_task" a12 
 on (a11.change_task_key = a12.row_key) 
	join "ldb"."d_change_task_assignment_group_c" a13 
	on (a12.change_task_assignment_group_c_key = a13.row_key)  
 union
select 'ldb."d_change_task_assigned_to_c" a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task_detailed_c" a11 
 join "ldb"."d_change_task" a12 
 on (a11.change_task_key = a12.row_key) 
	join "ldb"."d_change_task_assigned_to_c" a14 
	on (a12.change_task_assigned_to_c_key = a14.row_key)  
 union
select 'ldb."d_change_task_configuration_item_c" a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task_detailed_c" a11 
 join "ldb"."d_change_task" a12 
 on (a11.change_task_key = a12.row_key) 
	join "ldb"."d_change_task_configuration_item_c" a15 
	on (a12.change_task_configuration_item_c_key = a15.row_key)  
 union
select 'ldb."d_change_task_priority" a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_change_task_detailed_c" a11 
 join "ldb"."d_change_task" a12 
 on (a11.change_task_key = a12.row_key) 
	join "ldb"."d_change_task_priority" a16 
	on (a12.priority_src_key = a16.row_key) 

