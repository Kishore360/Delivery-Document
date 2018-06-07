select 'ldb.f_task_ci_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_ci_c       a11 
union
select'ldb.d_task_ci_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_ci_c       a11 
  join          ldb.d_task_ci_c      a12
                  on          (a11.task_ci_c_key = a12.row_key)
union
select'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_ci_c       a11 
  join          ldb.d_configuration_item_task_ci_c        a13
                  on          (a11.configuration_item_key = a13.row_key)
union
select'ldb.d_task' as Table_Name, count(a11.row_key) Row_Count
  from  ldb.f_task_ci_c       a11 
join          ldb.d_task               a14
                  on          (a11.task_key = a14.row_key)
union
select'ldb.d_task_type' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_ci_c       a11 
                join          ldb.d_task_type      a15
                  on          (a11.type_src_key = a15.row_key)
				  