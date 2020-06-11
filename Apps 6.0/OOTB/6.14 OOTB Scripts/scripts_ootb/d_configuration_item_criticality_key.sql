SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_configuration_item.criticality_key' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.cmdb_ci_final WHERE CDCTYPE<>'D') SRC 
 Left join ( SELECT * FROM #MDS_TABLE_SCHEMA.cmdb_ci_service_final WHERE CDCTYPE<>'D') SRC3
ON SRC.sys_id=SRC3.sys_id 
AND SRC.sourceinstance=SRC3.sourceinstance 
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP
 ON (upper(concat('CRITICALITY~CMDB_CI~',SRC3.busines_criticality))  =LKP.src_rowid  
 AND SRC3.sourceinstance = LKP.source_id)
 LEFT JOIN #DWH_TABLE_SCHEMA.d_configuration_item TRGT 
 ON (SRC.sys_id  =TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE COALESCE( LKP.row_key,CASE WHEN SRC3.busines_criticality IS NULL THEN 0 ELSE -1 END)<> COALESCE(TRGT.criticality_key ,'')