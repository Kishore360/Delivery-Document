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

select  'ldb.d_calendar_date' as Table_Name,count(a11.row_key) Row_Count 
from 	ldb.f_problem_task a11 
join	ldb.d_calendar_date	a12
on 		(a11.opened_on_key = a12.row_key)
union

select  'ldb.d_problem_task' as Table_Name,count(a11.row_key) Row_Count 
from 	ldb.f_problem_task a11 
join	ldb.d_problem_task	a13
on	 	(a11.problem_task_key = a13.row_key)
union

select  'ldb.d_calendar_month' as Table_Name,count(a11.row_key) Row_Count 
from 	ldb.f_problem_task a11 
join	ldb.d_calendar_date	a12
on 		(a11.opened_on_key = a12.row_key)
join	ldb.d_calendar_month	a14
on 		(a12.month_start_date_key = a14.row_key)
union

select  'ldb.d_task_state' as Table_Name,count(a11.row_key) Row_Count 
from 	ldb.f_problem_task a11 
join	ldb.d_task_state	a13
on 		(a11.state_src_key = a13.row_key)
union

select  'ldb.d_task_state' as Table_Name,count(a11.row_key) Row_Count 
from 	ldb.f_problem_task a11 
join	ldb.d_task_state	a14
on	 	(a11.state_src_key = a14.row_key)
union

select  'ZZMD01' as Table_Name,count(a11.row_key) Row_Count 
from 	ZZMD00	pa11
full outer join	ZZMD01	pa12
on 	(pa11.row_key = pa12.row_key)
union

select  'ZZMD02' as Table_Name,count(a11.row_key) Row_Count 
from 	ZZMD00	pa11
full outer join	ZZMD01	pa12
on 	(pa11.row_key = pa12.row_key)
full outer join	ZZMD02	pa13
on 	(coalesce(pa11.row_key, pa12.row_key) = pa13.row_key)
union

select  'ZZMD03' as Table_Name,count(a11.row_key) Row_Count 
from 	ZZMD00	pa11
full outer join	ZZMD01	pa12
on 	(pa11.row_key = pa12.row_key)
full outer join	ZZMD02	pa13
on 	(coalesce(pa11.row_key, pa12.row_key) = pa13.row_key)
full outer join	ZZMD03	pa14
on 	(coalesce(pa11.row_key, pa12.row_key, pa13.row_key) = pa14.row_key)
union

select  'ldb.d_task_contacttype' as Table_Name,count(a11.row_key) Row_Count 
from 	ZZMD00	pa11
full outer join	ZZMD01	pa12
on 	(pa11.row_key = pa12.row_key)
full outer join	ZZMD02	pa13
on 	(coalesce(pa11.row_key, pa12.row_key) = pa13.row_key)
full outer join	ZZMD03	pa14
on 	(coalesce(pa11.row_key, pa12.row_key, pa13.row_key) = pa14.row_key)
join	ldb.d_task_contacttype	a117
on 	(coalesce(pa11.row_key, pa12.row_key, pa13.row_key, pa14.row_key) = a117.row_key)
union