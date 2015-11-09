SELECT CASE WHEN max_count<>min_count THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN  max_count<>min_count THEN 'OOTB has Keys Dropped' ELSE 'SUCCESS'  END as Message FROM (
select max(Row_Count) max_count,Min(Row_Count) min_count from (
select'ldb.f_request_task' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_request_task             a11 
union
-- select'ldb.d_task_contacttype' as Table_Name, count(a11.row_key) Row_Count
-- from  ldb.f_request_task             a11 
-- cross join ldb.d_task_contacttype         a12
-- union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_request_task             a11 
join ldb.d_calendar_date         a13
on (a11.opened_on_key = a13.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_request_task             a11 
 join ldb.d_calendar_date         a13
on (a11.opened_on_key = a13.row_key)
join ldb.d_calendar_month         a14
on (a13.month_start_date_key = a14.row_key)
)a
)b

