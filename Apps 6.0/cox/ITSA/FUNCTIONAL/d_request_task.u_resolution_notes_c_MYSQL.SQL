SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_request_task.u_resolution_notes_c' ELSE 'SUCCESS' END as Message 
 FROM cox_mdsdb.sc_task_final  SRC JOIN cox_mdwdb.d_request_task TRGT ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )
 WHERE SRC.u_resolution_notes <>(TRGT.u_resolution_notes_c) 
