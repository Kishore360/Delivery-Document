-- DERVIED METRIC TO BE WRITTEN


select	'Avg of Score'as metrics,sum(a11.response_value)/count(distinct a11.row_key) AS value --***data not matching 
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
 and a15.lagging_count_of_month between 0 and 12)
 UNION
 
 select 'Completed Survey' as metrics,count(distinct a11.row_key)  as value
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
	where a14.wh_dimension_code = 'COMPLETED'
 and a11.response_value > 0 and a15.lagging_count_of_month between 0 and 12
  and a16.wh_dimension_code in ('3', 'SCALE')
 UNION
 select	'Number of Questions'as metrics,COALESCE(min(a11.question_key), 0) AS value -- ***data not matching 
from	ldb.f_task_response_c	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.requested_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 12
UNION
  select 'Outstanding Survey' as metrics,count(1) as value
 from	ldb.f_task_response_c	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.requested_on_key = a12.row_key)
	  join	ldb.d_survey_state	a14
	  on 	(a11.survey_state_src_key = a14.row_key)
	join	ldb.d_calendar_month	a15
	  on 	(a12.month_start_date_key = a15.row_key)
	  where	(a14.wh_dimension_code = 'REQUESTED'
 and a11.response_value > 0
  and a15.lagging_count_of_month between 0 and 12)
 union
select	'Reopened Count'as metrics,COALESCE(count(distinct a11.row_key), 0) AS value
from	ldb.f_task_response_c	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.requested_on_key = a12.row_key)
	join	ldb.d_task_ra_c	a13
	  on 	(a11.survey_task_key = a13.row_key)
	join	ldb.d_calendar_month	a14
	  on 	(a12.month_start_date_key = a14.row_key)
where	(a13.reopened_c_flag = 'Y'
 and a14.lagging_count_of_month between 0 and 12)
 
 union
  select 'Response Rate' as metrics ,(a.abc*1.0/b.abc*1.0) as value
  ( select COALESCE(count(distinct a11.row_key), 0) as abc
 from	ldb.f_task_response_c	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.requested_on_key = a12.row_key)
	  join	ldb.d_survey_state	a14
	  on 	(a11.survey_state_src_key = a14.row_key)
	join	ldb.d_calendar_month	a15
	  on 	(a12.month_start_date_key = a15.row_key)
	  where	(a14.wh_dimension_code = 'COMPLETED'
 and a11.response_value > 0
  and a15.lagging_count_of_month between 0 and 12))a
  cross join 
  (select COALESCE(count(distinct a11.row_key), 0) as abc
 from	ldb.f_task_response_c	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.requested_on_key = a12.row_key)
	 	join	ldb.d_calendar_month	a15
	  on 	(a12.month_start_date_key = a15.row_key)
	  where	(a15.lagging_count_of_month between 0 and 12))b
  
  UNION
    select 'Survey Sent' as metrics,count(1) as value
 from	ldb.f_task_response_c	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.requested_on_key = a12.row_key)
	 	join	ldb.d_calendar_month	a15
	  on 	(a12.month_start_date_key = a15.row_key)
	  where	(a15.lagging_count_of_month between 0 and 12)