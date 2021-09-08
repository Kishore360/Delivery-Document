select 'ldb.f_change_failure_c	a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure_c	a11 
union
select 'ldb.d_change_failure_c	a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure_c	a11 
join	ldb.d_change_failure_c	a12 
on (a11.change_failure_c_key = a12.row_key) 
union
select 'ldb.d_change_request	a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_failure_c	a11 
join	ldb.d_change_request	a15 
on (coalesce(a11.row_key, a12.row_key) = a15.row_key) 