

SELECT CASE WHEN COUNT(1) >0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN COUNT(1) >0 THEN 'stg_fs_incident has invalid caused_by_change_flag ' ELSE 'SUCCESS' END as Message
FROM usf_mdsdb.incident_final
WHERE crc32(CONCAT_WS(' ',sys_id ,sourceinstance 
, CASE WHEN caused_by IS NOT NULL THEN 'Y' ELSE 'N' END) )
NOT IN (SELECT crc32(CONCAT_WS(' ',row_id ,source_id ,caused_by_change_flag ))
FROM usf_workdb.stg_fs_incident );


