SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_task.business_duration' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.change_task_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.f_change_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE COALESCE(TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',SRC.business_duration),'')<> COALESCE(TRGT.business_duration,'')
 