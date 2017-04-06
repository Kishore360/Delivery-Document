select 'ldb.f_enrollment_terms_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_enrollment_terms_c       a11 
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_enrollment_terms_c       a11 
join ldb.d_calendar_date       a12
on (a11.u_start_date_key=a12.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_enrollment_terms_c       a11
 join ldb.d_calendar_date       a12
on (a11.u_start_date_key=a12.row_key)
join ldb.d_calendar_month       a13
on (a12.month_start_date_key=a13.row_key)
union
select'ldb.d_calendar_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_enrollment_terms_c       a11
  join ldb.d_calendar_date       a12
on (a11.u_start_date_key=a12.row_key)
join ldb.d_calendar_year       a14
on (a12.year_start_date_key=a14.row_key)
union
select'ldb.d_enrollment_period_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_enrollment_terms_c       a11 
join ldb.d_enrollment_period_c       a16
on (a11.row_key=a16.row_key)
