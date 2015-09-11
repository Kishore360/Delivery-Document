SELECT CASE WHEN max_count<>min_count THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN  max_count<>min_count THEN 'OOTB has Keys Dropped' ELSE 'SUCCESS'  END as Message FROM (
 select max(Row_Count) max_count,Min(Row_Count) min_count from (

select 'f_problem_task' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_problem_task    a11

union

select  'ldb.d_calendar_date' as Table_Name,count(a11.row_key) Row_Count 
from 	ldb.f_problem_task a11 
join	ldb.d_calendar_date	a12
on 		(a11.opened_on_key = a12.row_key)
union

select  'ldb.d_calendar_month' as Table_Name,count(a11.row_key) Row_Count 
from 	ldb.f_problem_task a11 
join	ldb.d_calendar_date	a12
on 		(a11.opened_on_key = a12.row_key)
join	ldb.d_calendar_month	a13
on 		(a12.month_start_date_key = a13.row_key)
union


select  'ldb.d_problem_task' as Table_Name,count(a11.row_key) Row_Count 
from 	ldb.f_problem_task a11 
join	ldb.d_problem_task	a13
on	 	(a11.problem_task_key = a13.row_key)

union

select  'ldb.d_task_state' as Table_Name,count(a11.row_key) Row_Count 
from 	ldb.f_problem_task a11 
join	ldb.d_task_state	a13
on 		(a11.state_src_key = a13.row_key)
union

select  'ldb.d_task_contact_type'as Table_Name,count(a11.row_key) Row_Count 
from 	ldb.f_problem_task a11 
join	ldb.d_task_state	a14
on	 	(a11.reported_type_src_key  = a14.row_key)
)a)b