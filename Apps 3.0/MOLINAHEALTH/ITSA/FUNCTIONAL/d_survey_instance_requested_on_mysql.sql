SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_task.opened_on_key' ELSE 'SUCCESS' END as Message
 FROM molinahealth_mdsdb.asmt_assessment_instance_final  SRC
 LEFT JOIN molinahealth_mdwdb.d_survey_instance TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
WHERE convert_tz(SRC.sys_created_on,'GMT','America/Los_Angeles')<>TRGT.requested_on
