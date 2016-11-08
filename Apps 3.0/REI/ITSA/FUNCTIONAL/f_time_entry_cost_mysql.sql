 select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_task.dormancy_age' ELSE 'SUCCESS' END as Message
 FROM rei_mdwdb.f_time_entry tgt
join rei_mdwdb.d_calendar_date 
on tgt.date_key = d_calendar_date.row_key
JOIN rei_mdwdb.d_internal_contact lkp
ON tgt.user_key = lkp.row_key
where effort_duration * billing_rate<>cost
