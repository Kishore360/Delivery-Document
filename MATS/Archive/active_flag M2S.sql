


SELECT CASE WHEN COUNT(*) >0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN COUNT(*) >0 THEN 'fs_incident has invalid active_flag ' ELSE 'SUCCESS' END as Message
FROM #MDS_TABLE_SCHEMA.#MDS_TABLE_NAME
 WHERE crc32(CONCAT_WS(' ',sys_id ,sourceinstance, 
CASE WHEN (active = TRUE) THEN 'Y' ELSE 'N' END ) ) 
NOT IN (SELECT crc32(CONCAT_WS(' ',row_id ,source_id,active_flag))
FROM #TABLE_SCHEMA.#TABLE_NAME );


