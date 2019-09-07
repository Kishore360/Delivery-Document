select 'ldb.f_change_request_region_list_c a11' as Table_name, count(a11.row_key)
from ldb.f_change_request_region_list_c a11
union
select 'ldb.d_change_request a12' as Table_name, count(a11.row_key) 
from ldb.f_change_request_region_list_c a11
join ldb.d_change_request  a12
on (a11.change_request_key = a12.row_key)
union
select 'ldb.d_region_c a13' as table_name, count(a11.row_key)
from ldb.f_change_request_region_list_c a11
join ldb.d_region_c a13
on (a11.region_c_key = a13.row_key)