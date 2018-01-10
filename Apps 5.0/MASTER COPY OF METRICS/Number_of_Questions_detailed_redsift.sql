select	COALESCE(min(a11.question_key), 0) AS Number_of_Questions
from	ldb.f_task_response_c	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.requested_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 11
