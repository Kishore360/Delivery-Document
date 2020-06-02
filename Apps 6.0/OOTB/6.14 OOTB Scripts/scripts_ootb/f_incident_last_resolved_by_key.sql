

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.last_resolved_by_key' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.incident_final WHERE CDCTYPE<>'D') SRC 
JOIN #DWH_TABLE_SCHEMA.d_lov_map L
 ON (SRC.state=L.dimension_code
 AND SRC.sourceinstance=L.source_id AND L.dimension_class = 'STATE~INCIDENT' 
 AND L.dimension_wh_code IN ('CLOSED','RESOLVED')) 
LEFT JOIN #DWH_TABLE_SCHEMA.f_incident TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact LKP 
 ON ( concat('INTERNAL_CONTACT~',resolved_by) = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id )
LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact LKP1 
 ON ( concat('INTERNAL_CONTACT~',closed_by) = LKP1.row_id 
 AND SRC.sourceinstance = LKP1.source_id )
LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact LKP2
 ON (SRC.sys_updated_by = LKP2.user_name 
AND SRC.sourceinstance = LKP2.source_id )	
 WHERE COALESCE(LKP.row_key,LKP1.row_key,LKP2.row_key,CASE WHEN (SRC.resolved_by IS NULL and SRC.closed_by is null and SRC.sys_updated_by is null) THEN 0 else '-1' end)<> COALESCE(TRGT.last_resolved_by_key ,'')
