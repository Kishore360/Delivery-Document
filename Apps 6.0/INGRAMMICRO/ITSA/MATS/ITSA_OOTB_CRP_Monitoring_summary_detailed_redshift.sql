select 'ldb.f_change_success_model_monitor a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_success_model_monitor a11
union
select 'ldb.d_change_success_model_monitor a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_success_model_monitor a11
join ldb.d_change_success_model_monitor a12
on (a11.change_success_model_monitor_key = a12.row_key)
union
select 'ldb.d_change_request a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_success_model_monitor a11
join ldb.d_change_success_model_monitor a12
on (a11.change_success_model_monitor_key = a12.row_key)
join ldb.d_change_request a13
on (a12.change_request_key = a13.row_key)