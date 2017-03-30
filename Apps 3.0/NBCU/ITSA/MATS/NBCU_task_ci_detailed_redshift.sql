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
union
select'd_internal_contact_executive_supervisor_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_ci_c             a11 
join ldb.d_configuration_item         a13
on (a11.configuration_item_key = a13.row_key)
join ldb.d_internal_contact_executive_supervisor_c         a14
on (a13.executive_sponsor_c_key = a14.row_key)
union
select'd_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_ci_c             a11 
join ldb.d_calendar_date         a15
on (a11.task_opened_on_key = a15.row_key)
union
select'd_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_task_ci_c             a11 
join ldb.d_calendar_date         a15
on (a11.task_opened_on_key = a15.row_key)
join ldb.d_calendar_month        a16
on (a15.month_start_date_key = a16.row_key)
