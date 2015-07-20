

SELECT CASE WHEN COUNT(1) >0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN COUNT(1) >0 THEN 'stg_fs_incident has invalid closed_on_id ' ELSE 'SUCCESS' END as Message
 FROM usf_mdsdb.#MDS_TABLE_NAME 
WHERE crc32(CONCAT_WS(' ',sys_id ,sourceinstance,
 CASE WHEN closed_at IS NULL THEN 'UNSPECIFIED' ELSE date_format(closed_at,'%Y%m%d') END ))
NOT IN (SELECT crc32(CONCAT_WS(' ',row_id ,source_id ,closed_on_id ))
FROM usf_workdb.#STG_TABLE_NAME );

