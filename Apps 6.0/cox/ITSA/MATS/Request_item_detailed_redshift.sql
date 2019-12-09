select 'ldb.f_request_item_closed a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11
union
select 'ldb.d_request a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11
join ldb.d_request a122
  on (a11.request_key = a122.row_key)
union
select 'ldb.d_request_item a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11
join ldb.d_request_item a12
  on (a11.request_item_key = a12.row_key)
union
select 'ldb.d_req_item_opened_by a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11
join ldb.d_request_item a12
  on (a11.request_item_key = a12.row_key)
join ldb.d_req_item_opened_by a13
  on (a12.opened_by_key = a13.row_key)
union
select 'ldb.d_lov_request_item_approval_status_c a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11
join ldb.d_request_item a12
  on (a11.request_item_key = a12.row_key)
join ldb.d_lov_request_item_approval_status_c a14
  on (a12.request_item_approval_status_c_key = a14.row_key)
union
select 'ldb.d_lov_request_item_status_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11
join ldb.d_request_item a12
  on (a11.request_item_key = a12.row_key)
join ldb.d_lov_request_item_status_c a15
  on (a12.request_item_status_c_key = a15.row_key)
union
select 'ldb.d_lov_request_item_sub_status1_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11
join ldb.d_request_item a12
  on (a11.request_item_key = a12.row_key)
join ldb.d_lov_request_item_sub_status1_c a16
  on (a12.request_item_sub_status1_c_key = a16.row_key)
union
select 'ldb.d_lov_request_item_sub_status_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11
join ldb.d_request_item a12
  on (a11.request_item_key = a12.row_key)
join ldb.d_lov_request_item_sub_status_c a17
  on (a12.request_item_sub_status_c_key = a17.row_key)
union
select 'ldb.d_lov_request_status_c a144 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_request_item_closed a11
join ldb.d_request a12
  on (a11.request_key = a12.row_key)
join ldb.d_lov_request_status_c a144
  on (a12.request_status_c_key = a144.row_key)