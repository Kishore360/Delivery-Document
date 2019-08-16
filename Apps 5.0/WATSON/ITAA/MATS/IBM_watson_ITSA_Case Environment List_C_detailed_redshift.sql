select 'ldb.f_case_environment_list_c a11' as Table_name, count(a11.row_key) Row_count
from ldb.f_case_environment_list_c a11
union
select 'ldb.d_environment_c a12' as Table_name, count(a11.row_key) Row_count
from ldb.f_case_environment_list_c a11
join ldb.d_environment_c a12
on (a11.environment_c_key = a12.row_key)
union 
select 'ldb.d_case  a13' as Table_name, count(a11.row_key) Row_count
from ldb.f_case_environment_list_c a11
join ldb.d_case  a13
on (a11.case_key = a13.row_key)
