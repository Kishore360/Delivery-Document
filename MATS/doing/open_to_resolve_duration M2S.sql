


SELECT CASE WHEN COUNT(1) >0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN COUNT(1) >0 THEN 'fs_incident has invalid open_to_resolve_duration ' ELSE 'SUCCESS' END as Message
FROM <<tenant>>_mdsdb.incident_final
WHERE crc32(CONCAT_WS(' ',sys_id ,sourceinstance , TIMESTAMPDIFF(SECOND,opened_at,resolved_at)) )
NOT IN (SELECT crc32(CONCAT_WS(' ',row_id ,source_id ,open_to_resolve_duration ) )
FROM <<tenant>>_mdwdb.fs_incident );

