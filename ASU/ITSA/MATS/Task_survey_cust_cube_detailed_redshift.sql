select 'f_task_survey' as Table_Name,count(a.row_key) Row_Count
from ldb.f_task_survey    a
union
select  'd_calendar_date ' as Table_Name,count(a.row_key) Row_Count
from ldb.f_task_survey  a
join  asu_mdwdb.d_calendar_date  b
on  (a.completed_on_key = b.row_key)
UNION
select  'd_calendar_date 1' as Table_Name,count(a.row_key) Row_Count
from ldb.f_problem    a
join  asu_mdwdb.d_calendar_date   b
on  (a.requested_on_key = b.row_key)
