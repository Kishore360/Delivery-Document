


SELECT CASE WHEN COUNT(*) >0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN COUNT(*) >0 THEN '#TABLE_NAME has invalid created_on_id ' ELSE 'SUCCESS' END as Message
FROM #MDS_TABLE_SCHEMA.#MDS_TABLE_NAME 
WHERE crc32(CONCAT_WS(' ',sys_id ,sourceinstance, 
CASE WHEN opened_at IS NULL THEN 'UNSPECIFIED' ELSE date_format(opened_at,'%Y%m%d') END ))
NOT IN (SELECT crc32(CONCAT_WS(' ',row_id ,source_id ,opened_on_id ) )
FROM #TABLE_SCHEMA.#TABLE_NAME );

