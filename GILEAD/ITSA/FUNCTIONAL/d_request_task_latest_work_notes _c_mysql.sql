SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_task.description' ELSE 'SUCCESS' END as Message
 FROM gilead_mdsdb.sc_task_final SRC 
 LEFT JOIN gilead_mdwdb.d_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.u_latest_work_notes    ,'')<> COALESCE(TRGT.latest_work_notes _c ,'')
