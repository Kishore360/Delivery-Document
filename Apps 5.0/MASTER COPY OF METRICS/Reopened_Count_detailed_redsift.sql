
select	COALESCE(count(distinct a11.row_key), 0) AS Reopened_Count
from	ldb.f_task_response_c	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.requested_on_key = a12.row_key)
	join	ldb.d_task_ra_c	a13
	  on 	(a11.survey_task_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.reopened_c_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 11)