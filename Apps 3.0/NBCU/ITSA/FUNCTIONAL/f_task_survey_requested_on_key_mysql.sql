SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_task.opened_on_key' ELSE 'SUCCESS' END as Message
 FROM nbcu_mdsdb.task_survey_final SRC
 LEFT JOIN nbcu_mdwdb.f_task_survey TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN nbcu_mdwdb.d_calendar_date LKP 
on (LKP.row_id = COALESCE(DATE_FORMAT(convert_tz(SRC.requested_date,'GMT','America/New_York'),'%Y%m%d'),'UNSPECIFIED') 
and LKP.source_id=0
)
WHERE COALESCE(LKP.row_key,-99) <> COALESCE(TRGT.requested_on_key,-99) 