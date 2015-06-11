


SELECT CASE WHEN COUNT(*) >0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN COUNT(*) >0 THEN '#TABLE_NAME has invalid #COL_NAME ' ELSE 'SUCCESS' END as Message
FROM #MDS_TABLE_SCHEMA.#BASE_TABLE BASE
JOIN #MDS_TABLE_SCHEMA.#BASE2_TABLE BASE2
ON(#JOIN_CONDITION)
WHERE crc32(CONCAT_WS(' ',#BASE_ROW_ID,BASE.sourceinstance,COALESCE(#COALESCE)))
NOT IN (SELECT crc32(CONCAT_WS(' ',row_id ,source_id ,#COL_NAME ))
FROM #TABLE_SCHEMA.#TABLE_NAME );
