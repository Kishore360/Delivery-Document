
		SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_task.task_name_c' ELSE 'SUCCESS' END as Message
FROM qualcomm_mdsdb.sc_task_final SRC 
 LEFT JOIN qualcomm_mdwdb.d_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE SRC.u_task_name  <> TRGT.task_name_c;