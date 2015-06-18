


SELECT CASE WHEN COUNT(1) >0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN COUNT(1) >0 THEN 'fs_incident has invalid due_on_id ' ELSE 'SUCCESS' END as Message
FROM <<tenant>>_mdsdb.incident_final
WHERE crc32(CONCAT_WS(' ',sys_id ,sourceinstance, 
CASE WHEN due_date IS NULL THEN 'UNSPECIFIED' ELSE date_format(due_date,'%Y%m%d') END ))  
NOT IN (SELECT crc32(CONCAT_WS(' ',row_id ,source_id ,due_on_id ))
FROM <<tenant>>_mdwdb.fs_incident );


