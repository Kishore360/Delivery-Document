SELECT CASE WHEN cnt>0 > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt>0 >0 THEN 'MDS to DWH data validation failed for f_task_survey.sent_to_key' ELSE 'SUCCESS' END as Message
 FROM (select count(1) as cnt from nbcu_mdsdb.task_survey_final SRC 
 LEFT JOIN nbcu_mdwdb.f_task_survey TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN nbcu_mdwdb.d_internal_contact LKP 
 ON ( CONCAT('INTERNAL_CONTACT~',SRC.sent_to)= LKP.row_id
AND SRC.sourceinstance= LKP.source_id )
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.sent_to IS NULL THEN 0 else -1 end)<> TRGT.sent_to_key
and TRGT.soft_deleted_flag='N')ma