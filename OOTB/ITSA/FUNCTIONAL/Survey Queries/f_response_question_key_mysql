SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_task.opened_on_key' ELSE 'SUCCESS' END as Message
 FROM nbcu_mdsdb.survey_response_final SRC
 LEFT JOIN nbcu_mdwdb.f_response TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
left join nbcu_mdwdb.d_survey_question LKP
on (COALESCE(SRC.question,'UNSPECIFIED')= LKP.row_id and SRC.sourceinstance=LKP.source_id)
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.question IS NULL THEN 0 else -1 end)<>TRGT.question_key


