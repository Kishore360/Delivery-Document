

SELECT CASE WHEN COUNT(*) >0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN COUNT(*) >0 THEN '#TABLE_NAME has invalid over_due_flag ' ELSE 'SUCCESS' END as Message
FROM #MDS_TABLE_SCHEMA.#MDS_TABLE_NAME 
WHERE crc32(CONCAT_WS(' ',sys_id ,sourceinstance, 
CASE WHEN (active= TRUE AND due_date < sys_created_on) THEN 'Y' ELSE 'N' END) )  
NOT IN (SELECT crc32(CONCAT_WS(' ',row_id ,source_id,over_due_flag ))
FROM #TABLE_SCHEMA.#TABLE_NAME );

