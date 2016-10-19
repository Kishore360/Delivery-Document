select'f_task_ci_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_ci_c             a11 
 union
 select'd_task_ra_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_ci_c             a11 
join ldb.d_task_ra_c         a12
on (a11.task_key = a12.row_key)
union
select'd_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_ci_c             a11 
join ldb.d_configuration_item         a13
on (a11.configuration_item_key = a13.row_key)