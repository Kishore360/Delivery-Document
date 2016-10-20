select'f_task_time_worked_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_time_worked_c             a11 
 union
 select'd_task_ra_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_time_worked_c             a11 
join ldb.d_task_ra_c         a12
on (a11.task_key = a12.row_key)
union
select'd_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_time_worked_c             a11 
join ldb.d_internal_contact         a13
on (a11.user_c_key = a13.row_key)
 union
 select'd_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_time_worked_c             a11 
join ldb.d_calendar_date         a14
on (a11.created_on_key = a14.row_key)
union
select'd_internal_contact_mdm' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_time_worked_c             a11 
join ldb.d_internal_contact         a13
on (a11.user_c_key = a13.row_key)
join ldb.d_internal_contact_mdm         a16
on (a13.row_current_key = a16.row_key)
union
 select'd_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_time_worked_c             a11 
join ldb.d_calendar_date         a14
on (a11.created_on_key = a14.row_key)
join ldb.d_calendar_month        a17
on (a14.month_start_date_key = a17.row_key)