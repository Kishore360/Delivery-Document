select 'ldb.f_ksr_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ksr_c a11 
union
select 'ldb.d_ksr_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ksr_c a11 
join ldb.d_ksr_c a12 
on (a11.ksr_c_key = a12.row_key) 
union
select 'ldb.d_calendar_date a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ksr_c a11 
join ldb.d_calendar_date a13 
on (a11.opened_on_key = a13.row_key) 
union
select 'ldb.d_calendar_month a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ksr_c a11 
join ldb.d_calendar_date a13 
on (a11.opened_on_key = a13.row_key) 
join ldb.d_calendar_month a14 
on (a13.month_start_date_key = a14.row_key) 
union
select 'ldb.d_internal_contact_ksr_requested_for_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ksr_c a11 
join ldb.d_internal_contact_ksr_requested_for_c a15 
on (a11.requested_for_key = a15.row_key) 
union
select 'ldb.d_internal_contact_ksr_requested_by_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ksr_c a11 
join ldb.d_internal_contact_ksr_requested_by_c a16 
on (a11.requested_by_key = a16.row_key) 
union
select 'ldb.d_calendar_year a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_ksr_c a11 
join ldb.d_calendar_date a13 
on (a11.opened_on_key = a13.row_key) 
join ldb.d_calendar_year a17 
on (a13.year_start_date_key = a17.row_key) 
