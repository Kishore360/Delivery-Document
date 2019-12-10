select 'ldb.f_request_task a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11
union
select 'ldb.d_request_task a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11

join ldb.d_request_task a12
  on (a11.request_task_key = a12.row_key)
union
select 'ldb.d_lov_request_task_resolution_category_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11
join ldb.d_request_task a12
  on (a11.request_task_key = a12.row_key)
join ldb.d_lov_request_task_resolution_category_c a13
  on (a12.request_task_resolution_category_c_key = a13.row_key)
union
select 'ldb.d_lov_request_task_status_c a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11
join ldb.d_request_task a12
  on (a11.request_task_key = a12.row_key)
join ldb.d_lov_request_task_status_c a14
  on (a12.request_task_status_c_key = a14.row_key)
union
select 'ldb.d_lov_request_task_sub_status_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11
join ldb.d_request_task a12
  on (a11.request_task_key = a12.row_key)
join ldb.d_lov_request_task_sub_status_c a15
  on (a12.request_task_sub_status_c_key = a15.row_key)
union
select 'ldb.d_lov_request_task_transaction_type_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_task a11
join ldb.d_request_task a12
  on (a11.request_task_key = a12.row_key)
join ldb.d_lov_request_task_transaction_type_c a16
  on (a12.request_task_transaction_type_c_key = a16.row_key)