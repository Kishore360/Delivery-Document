select 'ldb.f_change_rel_cmdb_ci_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_rel_cmdb_ci_c a11 
union
select 'ldb.d_configuration_item_change_rel_cmdb_ci_configuration_item_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_rel_cmdb_ci_c a11 
join ldb.d_configuration_item_change_rel_cmdb_ci_configuration_item_c a12 
on (a11.configuration_item_c_key = a12.row_key) 
union
select 'ldb.d_change_request a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_rel_cmdb_ci_c a11 
join ldb.d_change_request a13 
on (a11.change_request_c_key = a13.row_key) 