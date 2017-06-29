select 'ldb.f_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
join ldb.d_calendar_date a13
on          (a11.opened_on_key = a13.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident       a11 
 join ldb.d_calendar_date a13
on          (a11.opened_on_key = a13.row_key)
join ldb.d_calendar_month a14
on          (a13.month_start_date_key = a14.row_key)