 select 'ldb.f_task_group_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_group_c a11 
union 
 select'ldb.d_change_request' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_group_c a11 
join ldb.d_change_request a12
on (a11.change_request_key=a12.row_key)
union 
 select'ldb.d_task' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_group_c a11 
join ldb.d_task a13
on (a11.task_key=a13.row_key)
union 
 select'ldb.d_internal_organization_group' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_group_c a11 
join ldb.d_internal_organization_group a14
on (a11.assignment_group_key=a14.row_key)
union 
 select'ldb.d_task_type' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_group_c a11 
 join ldb.d_task a13
on (a11.task_key=a13.row_key)
join ldb.d_task_type a15
on (a13.task_type_src_key=a15.row_key)

