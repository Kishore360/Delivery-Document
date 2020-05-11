select 'ldb.f_problem a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_date a12
on (a11.opened_on_key = a12.row_key)
union
select 'ldb.d_problem a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_problem a13
on (a11.problem_key = a13.row_key)
union
select 'ldb.f_problem_journal_c a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.f_problem_journal_c a14
on (a11.problem_key = a14.problem_key)
union
select 'ldb.d_calendar_month a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.d_calendar_date a12
on (a11.opened_on_key = a12.row_key)
join ldb.d_calendar_month a15
on (a12.month_start_date_key = a15.row_key)
union
select 'ldb.d_problem_journal_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11
join ldb.f_problem_journal_c a14
on (a11.problem_key = a14.problem_key)
join ldb.d_problem_journal_c a16
on (a14.problem_journal_c_key = a16.row_key)