


SELECT CASE WHEN COUNT(1) >0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN COUNT(1) >0 THEN 'fs_incident has invalid change_flag ' ELSE 'SUCCESS' END as Message
FROM <<tenant>>_mdsdb.incident_final
WHERE crc32(CONCAT_WS(' ',sys_id ,sourceinstance , CASE WHEN rfc IS NOT NULL THEN 'Y' ELSE 'N' END) )
NOT IN (SELECT crc32(CONCAT_WS(' ',row_id ,source_id ,change_request_id ))
FROM <<tenant>>_workdb.fs_incident );


