select 'ldb.f_problem a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_date a12
on (a11.date_key = a12.row_key)
union
select 'ldb.d_calendar_month a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_date a12
on (a11.date_key = a12.row_key)
join ldb.d_calendar_month a13
on (a12.month_start_date_key = a13.row_key)
union
select 'ldb.d_calendar_quarter a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_date a12
on (a11.date_key = a12.row_key) join ldb.d_calendar_month a13
on (a12.month_start_date_key = a13.row_key)
join ldb.d_calendar_quarter a14
on (a13.quarter_start_date_key = a14.row_key)
union
select 'ldb.d_problem a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a15
on (a11.problem_key = a15.row_key)
union
select 'ldb.d_calendar_year a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_date a12
on (a11.date_key = a12.row_key) join ldb.d_calendar_month a13
on (a12.month_start_date_key = a13.row_key) join ldb.d_calendar_quarter a14
on (a13.quarter_start_date_key = a14.row_key)
join ldb.d_calendar_year a16
on (a14.year_start_date_key = a16.row_key)