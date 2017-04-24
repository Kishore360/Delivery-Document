SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_request_task.contact_type_src_key' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT 
 FROM svb_mdsdb.sc_task_final SRC 
 LEFT JOIN svb_mdwdb.d_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN svb_mdwdb.d_lov LKP 
 ON ( concat('CONTACT_TYPE','~','SC_TASK',contact_type)= LKP.row_id
AND SRC.sourceinstance= LKP.source_id ) 
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.contact_type IS NULL THEN 0 else -1 end)<> (TRGT.contact_type_src_c_key))temp;
 
