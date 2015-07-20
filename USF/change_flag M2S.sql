

SELECT CASE WHEN COUNT(*) >0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN COUNT(*) >0 THEN 'stg_fs_incident has invalid change_flag ' ELSE 'SUCCESS' END as Message
FROM #MDS_TABLE_SCHEMA.incident_final
WHERE crc32(CONCAT_WS(' ',sys_id ,sourceinstance , CASE WHEN rfc IS NOT NULL THEN 'Y' ELSE 'N' END) )
NOT IN (SELECT crc32(CONCAT_WS(' ',row_id ,source_id ,change_flag ))
FROM #STG_TABLE_SCHEMA.stg_fs_incident );


