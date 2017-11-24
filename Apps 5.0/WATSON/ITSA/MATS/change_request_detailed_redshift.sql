select 'ldb.f_change_request a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
union
select 'ldb.d_environment_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_environment_c a12 
on (a11.environment_c_key = a12.row_key) 
union
select 'ldb.d_tribe_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request a11 
join ldb.d_tribe_c a12 
on (a11.tribe_c_key = a12.row_key) 



