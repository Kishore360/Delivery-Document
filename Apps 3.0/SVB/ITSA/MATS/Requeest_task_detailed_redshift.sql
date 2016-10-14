 select'f_request_task' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_request_task             a11 
 union
 select'd_internal_contact_requested_for_manager_c' as Table_Name, count(a11.row_key) Row_Count
 from ldb.f_request_task
 join           ldb.d_internal_contact_requested_for   a111
                  on          (a11.request_task_key) = a111.row_key)
join           ldb.d_internal_contact_requested_for_manager_c               a120
                  on          (a111.manager_c_key = a120.row_key)