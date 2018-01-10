select sum(WJXBFS1) as No_Responses from (
select	COALESCE(count(distinct a11.row_key), 0) AS WJXBFS1
from	ldb.f_task_response_c	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.requested_on_key = a12.row_key)
	join	ldb.d_survey_state	a13
	  on 	(a11.survey_state_src_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.wh_dimension_code = 'COMPLETED'  and 
 a14.lagging_count_of_month between 0 and 11)
and  a11.response='No' group by a11.row_key)a