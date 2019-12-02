SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_request_task.request_task_transaction_type_c_key' ELSE 'SUCCESS' END as Message
 FROM cox_mdsdb.sc_task_final  SRC JOIN cox_mdwdb.d_request_task TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )  
 LEFT JOIN cox_mdwdb.d_lov LKP ON ( concat( 'TRANSACTION_TYPE_C~SC_TASK~' ,upper( SRC.u_transaction_type)) = LKP.row_id AND SRC.sourceinstance = LKP.source_id ) 
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_transaction_type IS NULL THEN 0 else -1 end)<>(TRGT.request_task_transaction_type_c_key) 
