SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_task.opened_on_key' ELSE 'SUCCESS' END as Message
FROM 
molinahealth_mdsdb.asmt_assessment_instance_final a11
LEFT JOIN molinahealth_mdwdb.f_task_survey TRGT 
 ON (a11.sys_id =TRGT.row_id  
 AND a11.sourceinstance= TRGT.source_id  )
WHERE a11.trigger_table<>TRGT.TASK_TYPE