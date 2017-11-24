select 'ldb.d_tribe_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 
join ldb.d_tribe_c a12 
on (a11.tribe_c_key = a12.row_key) 
union
select 'ldb.f_problem a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_problem a11 