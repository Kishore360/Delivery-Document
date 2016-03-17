 select'f_problem_task' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task             a11 
 union
 select'd_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task             a11 
join ldb.d_calendar_date         a12
on (a11.opened_on_key = a12.row_key)
union
select'd_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task             a11 
join ldb.d_calendar_date         a12
on (a11.opened_on_key = a12.row_key)
join ldb.d_calendar_month        a13
on (a12.month_start_date_key = a13.row_key)
union
select'd_task_contacttype' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_problem_task             a11 
join ldb.d_task_contacttype         a14
on (a11.reported_type_src_key= a14.row_key)
