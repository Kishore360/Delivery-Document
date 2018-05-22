--ALL CORRECT --
select	'Avg of Incidents CSAT Score'as metrics,avg(a11.response_value) AS value 
from	ldb.f_incident_response	a11
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
where	(task_type='INCIDENT' and  a15.lagging_count_of_month between 0 and 11)
 UNION
 select 'Completed Survey' as metrics,count(distinct a11.row_key) as value
 from	ldb.f_incident_response	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.requested_on_key = a12.row_key)
	  join	ldb.d_survey_state	a14
	  on 	(a11.survey_state_src_key = a14.row_key)
	join	ldb.d_calendar_month	a15
	  on 	(a12.month_start_date_key = a15.row_key)
	  where	a14.wh_dimension_code = 'COMPLETED'
  and a15.lagging_count_of_month between 0 and 11
 UNION
  select 'Outstanding Survey' as metrics,count(distinct a11.row_key) as value
 from	ldb.f_incident_response	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.requested_on_key = a12.row_key)
	  join	ldb.d_survey_state	a14
	  on 	(a11.survey_state_src_key = a14.row_key)
	join	ldb.d_calendar_month	a15
	  on 	(a12.month_start_date_key = a15.row_key)
	  where	a14.wh_dimension_code = 'REQUESTED'
   and a15.lagging_count_of_month between 0 and 11
  union
  select 'Response Rate' as metrics ,a.abc/b.abc*100.0 as value from
  ( select count(distinct a11.row_key)*1.0 as abc
 from	ldb.f_incident_response	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.requested_on_key = a12.row_key)
	  join	 ldb.d_survey_state	a14
	  on 	(a11.survey_state_src_key = a14.row_key)
	join	ldb.d_calendar_month	a15
	  on 	(a12.month_start_date_key = a15.row_key)
	  where	(a14.wh_dimension_code = 'COMPLETED'
 and a11.response_value > 0
  and a15.lagging_count_of_month between 0 and 11))a
  cross join 
  (select count(distinct a11.row_key)*1.0 as abc
 from	ldb.f_incident_response	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.requested_on_key = a12.row_key)
	 	join	ldb.d_calendar_month	a15
	  on 	(a12.month_start_date_key = a15.row_key)
	  where	(a15.lagging_count_of_month between 0 and 11))b
  
  UNION
    select 'Survey Sent' as metrics,count(distinct  a11.row_key) as value
 from	ldb.f_incident_response	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.requested_on_key = a12.row_key)
	 	join	ldb.d_calendar_month	a15
	  on 	(a12.month_start_date_key = a15.row_key)
	  where	a15.lagging_count_of_month between 0 and 11