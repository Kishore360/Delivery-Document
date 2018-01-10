select	sum(a11.response_value)/count(distinct a11.row_key) AS Avg_of_Score
from	ldb.f_task_response_c	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.requested_on_key = a12.row_key)
	join	ldb.d_survey_question	a13
	  on 	(a11.question_key = a13.row_key)
	join	ldb.d_survey_state	a14
	  on 	(a11.survey_state_src_key = a14.row_key)
	join	ldb.d_calendar_month	a15
	  on 	(a12.month_start_date_key = a15.row_key)
	join	ldb.d_question_type	a16
	  on 	(a13.question_type_src_key = a16.row_key)
where	(a14.wh_dimension_code = 'COMPLETED'
 and a11.response_value > 0
 and a16.wh_dimension_code in ('3', 'SCALE')
 and a15.lagging_count_of_month between 0 and 11)