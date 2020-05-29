SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_request_task.source_id' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT
 FROM #MDS_TABLE_SCHEMA.sc_task_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.sourceinstance,0)<> COALESCE(TRGT.source_id ,0))temp;
 
