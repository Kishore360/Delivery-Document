select 'ldb.f_catalog_variable_log_view_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_catalog_variable_log_view_c a11 
union
select 'ldb.d_catalog_variable_log_view_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_catalog_variable_log_view_c a11 
join ldb.d_catalog_variable_log_view_c a12 
on (a11.catalog_variable_log_dim_c_key = a12.row_key) 
union
select 'ldb.d_request_item_view_catalog_variable_log_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_catalog_variable_log_view_c a11 
join ldb.d_request_item_view_catalog_variable_log_c a13 
on (a11.request_item_number_c_key = a13.row_key) 
union
select 'ldb.d_request_item_requested_c a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_catalog_variable_log_view_c a11 
join ldb.d_request_item_requested_c a14 
on (a11.request_item_number_c_key = a14.row_key) 
union
select 'ldb.d_request_view_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_catalog_variable_log_view_c a11 
join ldb.d_request_item_view_catalog_variable_log_c a13 
on (a11.request_item_number_c_key = a13.row_key) 
join ldb.d_request_view_c a15 
on (a13.request_c_key = a15.row_key) 
