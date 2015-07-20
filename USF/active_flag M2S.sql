

SELECT CASE WHEN COUNT(1) >0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN COUNT(1) >0 THEN 'stg_fs_incident has invalid active_flag ' ELSE 'SUCCESS' END as Message
FROM <<tenant>>_mdsdb.#MDS_TABLE_NAME
 WHERE crc32(CONCAT_WS(' ',sys_id ,sourceinstance, 
CASE WHEN (active = TRUE) THEN 'Y' ELSE 'N' END ) ) 
NOT IN (SELECT crc32(CONCAT_WS(' ',row_id ,source_id,active_flag))
FROM <<tenant>>_workdb.#STG_TABLE_NAME );


