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
select 'ldb.d_problem_configuration_item a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_last_approval_c a11
join ldb.d_problem a14
on (a11.problem_key = a14.row_key)
join ldb.d_problem_configuration_item a15
on (a14.configuration_item_key = a15.row_key)
union
select 'ldb.d_problem_date a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_last_approval_c a11
join ldb.d_problem_date a16
on (a11.problem_date_key = a16.row_key)
union
select 'ldb.d_lov_segment_type_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_last_approval_c a11
join ldb.d_segment_c a13
on (a11.segment_c_key = a13.row_key)
join ldb.d_lov_segment_type_c a17
on (a13.segment_type_c_key = a17.row_key)
union
select 'ldb.d_problem_tribe_c a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_last_approval_c a11
join ldb.d_problem a14
on (a11.problem_key = a14.row_key) join ldb.d_problem_configuration_item a15
on (a14.configuration_item_key = a15.row_key)
join ldb.d_problem_tribe_c a18
on (a15.problem_tribe_c_key = a18.row_key)