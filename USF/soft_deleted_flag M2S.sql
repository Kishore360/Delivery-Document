
SELECT CASE WHEN COUNT(1) >0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN COUNT(1) >0 THEN '#STG_TABLE_NAME has invalid soft_deleted_flag ' ELSE 'SUCCESS' END as Message
FROM usf_mdsdb.#MDS_TABLE_NAME 
WHERE crc32(CONCAT_WS(' ',sys_id ,sourceinstance, 
CASE WHEN (cdctype = 'D' ) THEN 'Y' ELSE 'N' END )  )
NOT IN (SELECT crc32(CONCAT_WS(' ',row_id ,source_id,soft_deleted_flag ))
FROM usf_workdb.#STG_TABLE_NAME );
