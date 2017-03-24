select 'ldb.f_enrollment_terms_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enrollment_terms_c a11 
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enrollment_terms_c a11 
join ldb.d_calendar_date a12 
on (a11.u_start_date_key = a12.row_key) 
union
select 'ldb.d_enrollment_period_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enrollment_terms_c a11 
join ldb.d_enrollment_period_c a13 
on (a11.row_key = a13.row_key) 
union
select 'ldb.d_calendar_month a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_enrollment_terms_c a11 
join ldb.d_calendar_date a12 
on (a11.u_start_date_key = a12.row_key) 
join ldb.d_calendar_month a14 
on (a12.month_start_date_key = a14.row_key) 
