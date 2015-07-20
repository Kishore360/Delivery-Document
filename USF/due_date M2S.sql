

SELECT CASE WHEN COUNT(*) >0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN COUNT(*) >0 THEN 'stg_fs_incident has invalid due_on_id ' ELSE 'SUCCESS' END as Message
FROM #MDS_TABLE_SCHEMA.incident_final
WHERE crc32(CONCAT_WS(' ',sys_id ,sourceinstance, 
CASE WHEN due_date IS NULL THEN 'UNSPECIFIED' ELSE date_format(due_date,'%Y%m%d') END ))  
NOT IN (SELECT crc32(CONCAT_WS(' ',row_id ,source_id ,due_on_id ))
FROM #STG_TABLE_SCHEMA.stg_fs_incident );


