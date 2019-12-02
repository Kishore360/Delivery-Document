select 'ldb.f_change_request_region_list_c_fact a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_region_list_c_fact a11
union
select 'ldb.d_change_request a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_region_list_c_fact a11
join ldb.d_change_request a12
on (a11.change_request_key = a12.row_key)
union
select 'ldb.d_region_lkp_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_region_list_c_fact a11
join ldb.d_region_lkp_c a13
on (a11.region_lkp_c_key = a13.row_key)