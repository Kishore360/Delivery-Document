select 'ldb.f_caused_by_change a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_caused_by_change a11
union
select 'ldb.d_problem a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_caused_by_change a11
join ldb.d_problem a12
on (a11.problem_key = a12.row_key)
union
select 'ldb.d_calendar_date a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_caused_by_change a11
join ldb.d_calendar_date a13
on (a11.date_key = a13.row_key)
union
select 'ldb.d_caused_by_change_problem a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_caused_by_change a11
join ldb.d_caused_by_change_problem a14
on (a11.problem_caused_by_change_key = a14.row_key)
union
select 'ldb.d_incident a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_caused_by_change a11
join ldb.d_incident a15
on (a11.incident_key = a15.row_key)
union
select 'ldb.d_calendar_month a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_caused_by_change a11
join ldb.d_calendar_date a13
on (a11.date_key = a13.row_key)
join ldb.d_calendar_month a16
on (a13.month_start_date_key = a16.row_key)