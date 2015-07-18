

SELECT CASE WHEN COUNT(1) >0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN COUNT(1) >0 THEN 'stg_fs_incident has invalid open_to_close_duration ' ELSE 'SUCCESS' END as Message
FROM <<tenant>>_mdsdb.#MDS_TABLE_NAME 
WHERE crc32(CONCAT_WS(' ',sys_id ,sourceinstance ,
 TIMESTAMPDIFF(SECOND,opened_at,closed_at))) 
NOT IN (SELECT crc32(CONCAT_WS(' ',row_id ,source_id ,open_to_close_duration ))
FROM <<tenant>>_workdb.#STG_TABLE_NAME );

