SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_task.opened_on_key' ELSE 'SUCCESS' END as Message
FROM 
nbcu_mdsdb.task_survey_final a11
left join 
nbcu_mdsdb.task_final SRC
on a11.task = SRC.sys_id
 LEFT JOIN nbcu_mdwdb.f_task_survey TRGT 
 ON (a11.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
WHERE SRC.sys_class_name<>TRGT.TASK_TYPE