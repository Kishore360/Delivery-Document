select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_ci_c             a11 
join ldb.d_calendar_date         a12
on (a11.task_opened_on_key = a12.row_key)
union
select'ldb.d_task' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_ci_c             a11 
join ldb.d_task         a13
on (a11.task_key = a13.row_key)
union
select'ldb.d_configuration_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_ci_c             a11 
join ldb.d_configuration_item         a14
on (a11.configuration_item_key = a14.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_ci_c             a11 
 join ldb.d_calendar_date         a12
on (a11.task_opened_on_key = a12.row_key)
join ldb.d_calendar_month         a15
on (a12.month_start_date_key = a15.row_key)
