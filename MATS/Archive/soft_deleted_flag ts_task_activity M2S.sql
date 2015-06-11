


SELECT CASE WHEN COUNT(*) >0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN COUNT(*) >0 THEN 'ts_task_activity has invalid soft_deleted_flag ' ELSE 'SUCCESS' END as Message
FROM #MDS_TABLE_SCHEMA.sys_audit_final
WHERE crc32(CONCAT_WS(' ',sys_id ,sourceinstance, 
CASE WHEN (cdctype = 'D' ) THEN 'Y' ELSE 'N' END ))  
NOT IN (SELECT crc32(CONCAT_WS(' ',row_id ,source_id,soft_deleted_flag))
FROM #TABLE_SCHEMA.ts_task_activity );


