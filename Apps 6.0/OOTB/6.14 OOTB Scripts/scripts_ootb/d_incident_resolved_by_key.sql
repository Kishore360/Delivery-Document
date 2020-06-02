SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.resolved_by_key' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.incident_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map L
 ON (SRC.state=L.dimension_code
 AND SRC.sourceinstance=L.source_id AND L.dimension_class = 'STATE~INCIDENT' )
 LEFT JOIN #DWH_TABLE_SCHEMA.d_incident TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact LKP 
ON ( concat('INTERNAL_CONTACT~',coalesce(SRC.resolved_by,SRC.closed_by)) = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id )
LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact LKP1
 ON (SRC.sys_updated_by = LKP1.user_name 
AND SRC.sourceinstance = LKP1.source_id )
 WHERE  CASE WHEN L.dimension_wh_code IN ('RESOLVED','CLOSED') THEN COALESCE(LKP.row_key,LKP1.row_key,CASE WHEN coalesce(SRC.resolved_by,SRC.closed_by,SRC.sys_updated_by) IS NULL THEN 0 else '-1' end) 
 ELSE 0 END <> COALESCE(TRGT.resolved_by_key ,'')
