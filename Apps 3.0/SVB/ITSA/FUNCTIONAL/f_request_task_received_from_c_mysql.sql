SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_request_task.priority_src_code' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT
 FROM svb_mdsdb.sc_task_final SRC 
 LEFT JOIN svb_mdwdb.d_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE  SRC.u_recieved_from<> TRGT.recieved_from_c)temp;
 
