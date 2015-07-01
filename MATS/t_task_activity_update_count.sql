

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for t_task_activity.update_count' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.sys_audit_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.t_task_activity TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.record_checkpoint,'')<> COALESCE(TRGT.update_count ,'')
