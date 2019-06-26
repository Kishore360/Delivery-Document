select 'ldb.f_request_task_variable_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task_variable_c a11 
union
select 'ldb.d_request_item a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task_variable_c a11 
join ldb.d_request_item a12 
on (a11.request_item_key = a12.row_key) 
union
select 'ldb.d_request_task a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task_variable_c a11 
join ldb.d_request_task a13 
on (a11.request_task_key = a13.row_key) 
union
select 'ldb.d_request_item_master_item_c a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task_variable_c a11 
join ldb.d_request_item_master_item_c a14 
on (a11.request_item_catalog_item_key = a14.row_key) 
union
select 'ldb.d_lov_request_task_expiry_date_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task_variable_c a11 
join ldb.d_lov_request_task_expiry_date_c a15 
on (a11.expiry_date_src_c_key = a15.row_key) 
union
select 'ldb.d_lov_request_task_valid_to_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task_variable_c a11 
join ldb.d_lov_request_task_valid_to_c a16 
on (a11.valid_to_src_c_key = a16.row_key) 
