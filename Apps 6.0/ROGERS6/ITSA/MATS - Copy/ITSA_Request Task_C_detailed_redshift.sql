select 'ldb.f_request_task	a11 ' as Table_name, count(1) Row_Count
from ldb.f_request_task	a11 
union
select 'ldb.d_internal_contact	a12 ' as Table_name, count(1) Row_Count
from ldb.f_request_task	a11 
join	ldb.d_internal_contact	a12 
on (a11.opened_by_key = a12.row_key) 
union
select 'ldb.d_calendar_date	a13 ' as Table_name, count(1) Row_Count
from ldb.f_request_task	a11 
join	ldb.d_calendar_date	a13 
on (a11.opened_on_key = a13.row_key) 
union
select 'ldb.d_request_task	a14 ' as Table_name, count(1) Row_Count
from ldb.f_request_task	a11 
join	ldb.d_request_task	a14 
on (a11.request_task_key = a14.row_key) 
union
select 'ldb.d_calendar_month	a15 ' as Table_name, count(1) Row_Count
from ldb.f_request_task	a11 
join	ldb.d_calendar_date	a13 
on (a11.opened_on_key = a13.row_key) 
join	ldb.d_calendar_month	a15 
on (a13.month_start_date_key = a15.row_key) 