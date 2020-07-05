select 'ldb.f_problem_environment_list_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_environment_list_c a11
union
select 'ldb.d_environment_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_environment_list_c a11
join ldb.d_environment_c a12
on (a11.environment_c_key = a12.row_key)
union
select 'ldb.d_problem_environment_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_environment_list_c a11
join ldb.d_problem_environment_c a13
on (a11.problem_environment_c_key = a13.row_key)
union
select 'ldb.d_problem a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_environment_list_c a11
join ldb.d_problem a14
on (a11.problem_key = a14.row_key)