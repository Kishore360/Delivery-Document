

SELECT CASE WHEN COUNT(1) >0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN COUNT(1) >0 THEN 'stg_fs_incident has invalid reopened_flag ' ELSE 'SUCCESS' END as Message
FROM <<tenant>>_mdsdb.incident_final
WHERE crc32(CONCAT_WS(' ',sys_id ,sourceinstance, 
CASE WHEN (reopen_count >0) THEN 'Y' ELSE 'N' END) )  
NOT IN (SELECT crc32(CONCAT_WS(' ',row_id ,source_id,reopened_flag ))
FROM <<tenant>>_workdb.stg_fs_incident );

