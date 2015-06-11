


SELECT CASE WHEN COUNT(*) >0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN COUNT(*) >0 THEN 'ts_task_activity has invalid created_time_id ' ELSE 'SUCCESS' END as Message 
FROM #MDS_TABLE_SCHEMA.sys_audit_final 
WHERE crc32(CONCAT_WS(' ',sys_id ,sourceinstance
, CASE WHEN sys_created_on IS NULL THEN 'UNSPECIFIED' ELSE date_format(sys_created_on,'%H%i') END ))  
NOT IN (SELECT crc32(CONCAT_WS(' ',row_id,source_id ,created_time_id ) )
FROM #TABLE_SCHEMA.ts_task_activity );

