SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_request_task.approval_state_src_key' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT
 FROM mercury_mdsdb.sc_task_final SRC 
 LEFT JOIN mercury_mdwdb.f_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  ) and SRC.cdctype<>'D'
LEFT JOIN mercury_mdwdb.d_lov LKP 
 ON ( concat('APPROVAL','~','SC_TASK','~',upper(approval))= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.approval IS NULL THEN 0 else -1 end)<> (TRGT.approval_state_src_key))temp;
