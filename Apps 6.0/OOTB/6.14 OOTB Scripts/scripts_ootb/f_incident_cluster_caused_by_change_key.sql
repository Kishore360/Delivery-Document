SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident_cluster.caused_by_change_key' ELSE 'SUCCESS' END as Message
  
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.incident_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_incident_cluster TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN #DWH_TABLE_SCHEMA.d_change_request LKP 
ON SRC.caused_by = LKP.row_id 
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.caused_by IS NULL THEN 0 ELSE -1 END )<> coalesce(TRGT.caused_by_change_key,'')
 
