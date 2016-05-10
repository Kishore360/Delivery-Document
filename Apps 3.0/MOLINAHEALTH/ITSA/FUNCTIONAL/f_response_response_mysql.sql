SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_task.opened_on_key' ELSE 'SUCCESS' END as Message
FROM molinahealth_mdsdb.asmt_assessment_instance_question_final SRC
 LEFT JOIN molinahealth_mdwdb.f_response TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
WHERE replace(SRC.string_value,'\n','') <>TRGT.response





