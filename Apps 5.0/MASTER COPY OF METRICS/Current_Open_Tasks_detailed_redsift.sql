select	count(a11.row_key) AS Current_Open_Tasks
from	ldb.f_request_task	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.opened_on_key = a12.row_key)
	join	ldb.d_sc_task_state	a13
	  on 	(a11.state_src_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.wh_dimension_code = 'OPEN'
 and a14.lagging_count_of_month between 0 and 11)