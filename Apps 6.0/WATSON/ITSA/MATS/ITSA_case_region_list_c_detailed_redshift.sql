select 'ldb.f_case_region_list_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_region_list_c a11
union
select 'ldb.d_case a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_region_list_c a11
join ldb.d_case a12
on (a11.case_key = a12.row_key)
union
select 'ldb.d_region_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_region_list_c a11
join ldb.d_region_c a13
on (a11.region_c_key = a13.row_key)