select 'ldb.f_task_sla a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla a11 
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla a11 
join ldb.d_calendar_date a12 
on (a11.start_on_key = a12.row_key) 
union
select 'ldb.d_task_sla a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla a11 
join ldb.d_task_sla a13 
on (a11.sla_key = a13.row_key) 
union
select 'ldb.d_task a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla a11 
join ldb.d_task a14 
on (a11.task_key = a14.row_key) 
union
select 'ldb.d_task_sla_stage a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla a11 
join ldb.d_task_sla_stage a15 
on (a11.stage_src_key = a15.row_key) 
union
select 'ldb.d_calendar_year a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task_sla a11 
join ldb.d_calendar_date a12 
on (a11.start_on_key = a12.row_key) 
join ldb.d_calendar_year a16 
on (a12.year_start_date_key = a16.row_key) 
