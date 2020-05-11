select 'ldb.f_problem_last_approval_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_last_approval_c a11
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_last_approval_c a11
join ldb.d_calendar_date a12
on (a11.opened_on_key = a12.row_key)
union
select 'ldb.d_segment_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_last_approval_c a11
join ldb.d_segment_c a13
on (a11.segment_c_key = a13.row_key)
union
select 'ldb.d_problem a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_last_approval_c a11
join ldb.d_problem a14
on (a11.problem_key = a14.row_key)
union
select 'ldb.d_problem_last_approval_tribe_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_last_approval_c a11
join ldb.d_problem_last_approval_tribe_c a15
on (a11.tribe_c_key = a15.row_key)
union
select 'ldb.d_lov_segment_type_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_last_approval_c a11
join ldb.d_segment_c a13
on (a11.segment_c_key = a13.row_key)
join ldb.d_lov_segment_type_c a16
on (a13.segment_type_c_key = a16.row_key)