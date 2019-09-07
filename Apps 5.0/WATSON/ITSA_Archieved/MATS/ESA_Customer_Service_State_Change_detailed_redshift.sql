select 'ldb.f_case_state_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_state_c a11 
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_state_c a11 
join ldb.d_calendar_date a12 
on (a11.state_on_key = a12.row_key) 
union
select 'ldb.d_case a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_state_c a11 
join ldb.d_case a13 
on (a11.case_key = a13.row_key)
union
select 'ldb.d_calendar_month a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_state_c a11 
join ldb.d_calendar_date a12 
on (a11.state_on_key = a12.row_key) 
join ldb.d_calendar_month a14 
on (a12.month_start_date_key = a14.row_key)
union
select 'ldb.d_lov_case_state_from_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_state_c a11 
join ldb.d_lov_case_state_from_c a15 
on (a11.from_state_src_key = a15.row_key)
union
select 'ldb.d_lov_case_state_to_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_state_c a11 
join ldb.d_lov_case_state_to_c a16 
on (a11.to_state_src_key = a16.row_key)
union
select 'ldb.d_case_state a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_state_c a11
join ldb.d_case a13
on (a11.case_key = a13.row_key) 
join ldb.d_case_state a17 
on (a13.state_src_key = a17.row_key)
