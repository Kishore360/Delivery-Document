select 'ldb.f_change_request_planned_end_date a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11 
join ldb.d_internal_contact a12 
on (a11.opened_by_key = a12.row_key)
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11 
full outer join ldb.d_calendar_date a12 
on (a11.planned_end_on_key = a12.row_key)
union
select 'ldb.d_calendar_month a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_request_planned_end_date a11 
full outer join ldb.d_calendar_date a12 
on (a11.planned_end_on_key = a12.row_key)
full outer join ldb.d_calendar_month a13
on (a12.month_start_date_key = a13.row_key)