SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_task.opened_on_key' ELSE 'SUCCESS' END as Message
 FROM nbcu_mdsdb.task_survey_final SRC
 LEFT JOIN nbcu_mdwdb.d_survey_instance TRGT 
 ON (SRC.instance =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
WHERE convert_tz(SRC.requested_date,'GMT','America/New_York')<>TRGT.requested_on
