select 'ldb.f_problem_impacted_parties_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_impacted_parties_c a11 
union
select 'ldb.d_impacted_parties_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_impacted_parties_c a11 
join ldb.d_impacted_parties_c a12 
on (a11.impacted_parties_c_key = a12.row_key) 
union
select 'ldb.d_problem a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem_impacted_parties_c a11 
join ldb.d_problem a13 
on (a11.problem_key = a13.row_key) 
