SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_configuration_item.os_service_pack' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.cmdb_ci_final WHERE CDCTYPE<>'D') SRC 
 Left join ( SELECT * FROM #MDS_TABLE_SCHEMA.cmdb_ci_service_final WHERE CDCTYPE<>'D') SRC3
ON SRC.sys_id=SRC3.sys_id 
AND SRC.sourceinstance=SRC3.sourceinstance 
left join ( SELECT * FROM #MDS_TABLE_SCHEMA.cmdb_ci_server_final WHERE CDCTYPE<>'D') SRC2
                    ON SRC.sys_id=SRC2.sys_id 
                    AND SRC.sourceinstance=SRC2.sourceinstance  
 LEFT JOIN #DWH_TABLE_SCHEMA.d_configuration_item TRGT 
 ON (SRC.sys_id =TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE COALESCE( SRC2.os_service_pack,'')<> COALESCE(TRGT.os_service_pack,'')