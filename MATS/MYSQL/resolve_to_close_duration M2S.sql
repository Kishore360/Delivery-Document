


SELECT CASE WHEN COUNT(1) >0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN COUNT(1) >0 THEN 'fs_incident has invalid resolve_to_close_duration ' ELSE 'SUCCESS' END as Message
FROM <<tenant>>_mdsdb.incident_final
WHERE crc32(CONCAT_WS(' ',sys_id ,sourceinstance , TIMESTAMPDIFF(SECOND,resolved_at,closed_at)))
NOT IN (SELECT crc32(CONCAT_WS(' ',row_id ,source_id ,resolve_to_close_duration ))
FROM <<tenant>>_workdb.fs_incident );

