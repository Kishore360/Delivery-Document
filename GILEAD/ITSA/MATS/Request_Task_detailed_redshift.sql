 select'f_request_task' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task             a11 
 union
 select'd_request_task' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task             a11 
join ldb.d_request_task         a12
on (a11.request_task_key = a12.row_key)
union
 select'd_request_task_closure_code_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task             a11 
 join ldb.d_request_task         a12
on (a11.request_task_key = a12.row_key)
join ldb.d_request_task_closure_code_c         a13
on (a12.closure_code_c_key = a13.row_key)
union
 select'd_request_task_hold_type_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task             a11 
 join ldb.d_request_task         a12
on (a11.request_task_key = a12.row_key)
join ldb.d_request_task_hold_type_c         a13
on (a12.hold_type_c_key = a13.row_key)


