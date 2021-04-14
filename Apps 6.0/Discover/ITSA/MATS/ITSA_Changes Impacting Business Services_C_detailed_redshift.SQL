/* Tables Accessed:
d_change_request
d_cmdb_ci_service_c
d_task_cmdb_ci_c
f_task_cmdb_ci_c */

select 'ldb."f_task_cmdb_ci_c" a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_task_cmdb_ci_c" a11 
 union
select 'ldb."d_task_cmdb_ci_c" a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_task_cmdb_ci_c" a11 
 join "ldb"."d_task_cmdb_ci_c" a12 
	on (a11.task_cmdb_ci_c_key = a12.row_key)  
 union
select 'ldb."d_change_request" a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_task_cmdb_ci_c" a11 
 join "ldb"."d_change_request" a13 
	on (a11.change_request_key = a13.row_key)  
 union
select 'ldb."d_cmdb_ci_service_c" a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb."f_task_cmdb_ci_c" a11 
 join "ldb"."d_cmdb_ci_service_c" a14 
	on (a11.cmdb_ci_service_c_key = a14.row_key) 

