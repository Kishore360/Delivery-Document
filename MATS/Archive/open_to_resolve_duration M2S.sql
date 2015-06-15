


SELECT CASE WHEN COUNT(*) >0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN COUNT(*) >0 THEN 'fs_incident has invalid open_to_resolve_duration ' ELSE 'SUCCESS' END as Message
FROM #MDS_TABLE_SCHEMA.incident_final
WHERE crc32(CONCAT_WS(' ',sys_id ,sourceinstance , TIMESTAMPDIFF(SECOND,opened_at,resolved_at)) )
NOT IN (SELECT crc32(CONCAT_WS(' ',row_id ,source_id ,open_to_resolve_duration ) )
FROM #TABLE_SCHEMA.fs_incident );

