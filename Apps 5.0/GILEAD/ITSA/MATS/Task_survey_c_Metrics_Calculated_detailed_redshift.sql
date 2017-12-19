SELECT 
'COMPLETED_SURVEY',
count(distinct a.row_key) as Survey_sent
FROM ldb.f_task_response_c a 
JOIN ldb.d_survey_state b ON a.survey_state_src_key=b.row_key
JOIN ldb.d_calendar_date c ON a.requested_on_key=c.row_key
WHERE c.lagging_count_of_month between 0 and 11 and b.wh_dimension_code='COMPLETED'
union 
SELECT 
'OUTSTANDING_SURVEY',
count(distinct a.row_key) as Survey_sent
FROM ldb.f_task_response_c a 
JOIN ldb.d_survey_state b ON a.survey_state_src_key=b.row_key
JOIN ldb.d_calendar_date c ON a.requested_on_key=c.row_key
WHERE c.lagging_count_of_month between 0 and 11 and b.wh_dimension_code='REQUESTED'
union
SELECT 'cSAT_SCORE',avg(case when a.response_value<0 then 0 else a.response_value end  ) as Avg_Incidents_CSAT_Score
FROM ldb.f_task_response_c a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key 
JOIN ldb.d_calendar_date c ON a.requested_on_key=c.row_key
WHERE c.lagging_count_of_month between 0 and 12
Union

SELECT 
'SURVEY_SENT',
count(distinct a.row_key) as Survey_sent
FROM ldb.f_task_response_c a 
JOIN ldb.d_survey_state b ON a.survey_state_src_key=b.row_key
JOIN ldb.d_calendar_date c ON a.requested_on_key=c.row_key
WHERE c.lagging_count_of_month between 0 and 11
union
SELECT 
'Response_Rate',
a.Completed_Survey/b.Survey_Sent*100.0 as Response_Rate
FROM 
(
SELECT 
'COMPLETED_SURVEY',
count(distinct a.row_key)*1.00 as Completed_Survey
FROM ldb.f_task_response_c a 
JOIN ldb.d_survey_state b ON a.survey_state_src_key=b.row_key
JOIN ldb.d_calendar_date c ON a.requested_on_key=c.row_key
WHERE c.lagging_count_of_month between 0 and 11 and b.wh_dimension_code='COMPLETED' 

) a 
CROSS JOIN 
( 
SELECT 
'SURVEY_SENT',
count(distinct a.row_key)*1.00 as Survey_sent
FROM ldb.f_task_response_c a 
JOIN ldb.d_survey_state b ON a.survey_state_src_key=b.row_key
JOIN ldb.d_calendar_date c ON a.requested_on_key=c.row_key
WHERE c.lagging_count_of_month between 0 and 11 
)b 


