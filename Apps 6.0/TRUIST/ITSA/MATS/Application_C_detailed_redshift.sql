select 'ldb.f_archer_application_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_archer_application_c a11
union
select 'ldb.d_archer_application_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_archer_application_c a11
join ldb.d_archer_application_c a12
on (a11.archer_application_c_key = a12.row_key)