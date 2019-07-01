select 'ldb.f_task_ci_application_c a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_task_ci_application_c a11 
union
select 'ldb.d_task_ci_c a12 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_task_ci_application_c a11 
 join ldb.d_task_ci_c a12 
 on (a11.task_ci_c_key = a12.row_key)  
union
select 'ldb.d_configuration_item a13 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_task_ci_application_c a11 
 join ldb.d_configuration_item a13 
 on (a11.task_ci_item_c_key = a13.row_key)  
union
select 'ldb.d_affected_ci_application_c a14 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_task_ci_application_c a11 
 join ldb.d_affected_ci_application_c a14 
 on (a11.application_key = a14.row_key)  
union
select 'ldb.d_change_request a15 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_task_ci_application_c a11 
 join ldb.d_change_request a15 
 on (a11.task_ci_change_c_key = a15.row_key)  
union
select 'ldb.d_incident a16 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_task_ci_application_c a11 
 join ldb.d_incident a16 
 on (a11.task_ci_incident_c_key = a16.row_key)  
union
select 'ldb.d_request_item a17 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_task_ci_application_c a11 
 join ldb.d_request_item a17 
 on (a11.task_ci_request_item_c_key = a17.row_key)  

