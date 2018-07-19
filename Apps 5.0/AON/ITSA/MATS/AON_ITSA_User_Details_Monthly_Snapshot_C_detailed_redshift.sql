select 'ldb.n_internal_contact_monthly_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.n_internal_contact_monthly_c       a11 
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.n_internal_contact_monthly_c       a11 
join ldb.d_calendar_date       a12
on (a11.n_key = a12.row_key)
union
select'ldb.d_location_user_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.n_internal_contact_monthly_c       a11 
join ldb.d_location_user_c       a13
on (a11.location_key = a13.row_key)
union
select'ldb.d_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.n_internal_contact_monthly_c       a11 
join ldb.d_internal_organization_department       a16
on (a11.department_key = a16.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.n_internal_contact_monthly_c       a11 
 join ldb.d_calendar_date       a12
on (a11.n_key = a12.row_key)
join ldb.d_calendar_month       a14
on (a12.month_start_date_key = a14.row_key)
union
select'ldb.d_calendar_quarter' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.n_internal_contact_monthly_c       a11 
 join ldb.d_calendar_date       a12
on (a11.n_key = a12.row_key)
join ldb.d_calendar_quarter       a15
on (a12.quarter_start_date_key = a15.row_key)
union
select'ldb.d_calendar_year' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.n_internal_contact_monthly_c       a11 
 join ldb.d_calendar_date       a12
on (a11.n_key = a12.row_key)
join ldb.d_calendar_year       a17
on (a12.year_start_date_key = a17.row_key)

