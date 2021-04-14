/* Tables Accessed:
d_child_task_c
d_child_task_type_c
d_parent_task_c
d_parent_task_type_c
d_task_relationship_type_c
f_task_relationship_c */

select 'ldb."f_task_relationship_c" a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_task_relationship_c" a11 
 union
select 'ldb."d_child_task_c" a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_task_relationship_c" a11 
 join "ldb"."d_child_task_c" a12 
	on (a11.child_task_c_key = a12.row_key)  
 union
select 'ldb."d_parent_task_c" a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_task_relationship_c" a11 
 join "ldb"."d_parent_task_c" a13 
	on (a11.parent_task_c_key = a13.row_key)  
 union
select 'ldb."d_task_relationship_type_c" a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_task_relationship_c" a11 
 join "ldb"."d_task_relationship_type_c" a14 
	on (a11.relationship_type_c_key = a14.row_key)  
 union
select 'ldb."d_child_task_type_c" a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_task_relationship_c" a11 
 join "ldb"."d_child_task_c" a12 
 on (a11.child_task_c_key = a12.row_key) 
	join "ldb"."d_child_task_type_c" a15 
	on (a12.child_task_type_c_key = a15.row_key)  
 union
select 'ldb."d_parent_task_type_c" a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_task_relationship_c" a11 
 join "ldb"."d_parent_task_c" a13 
 on (a11.parent_task_c_key = a13.row_key) 
	join "ldb"."d_parent_task_type_c" a16 
	on (a13.parent_task_type_c_key = a16.row_key) 

