select 'ldb.f_catalog_variable_log_c' as Table_Name, count(a.row_key) Row_Count
from  wow_mdwdb.f_catalog_variable_log_c a 
union
select 'ldb.d_request_item' as Table_Name, count(a.row_key) Row_Count
from  wow_mdwdb.f_catalog_variable_log_c a 
join ldb.d_request_item b
on (a.request_item_number_c_key =b.row_key)

