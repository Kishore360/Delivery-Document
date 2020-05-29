

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.grand_parent_incident_key' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.incident_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN ( SELECT * FROM #MDS_TABLE_SCHEMA.incident_final WHERE CDCTYPE<>'D') SRC_P
 on (SRC.parent_incident  =SRC_P.sys_id  
 AND SRC.sourceinstance = SRC_P.sourceinstance)
 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_incident TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN #DWH_TABLE_SCHEMA.d_incident LKP 
 ON ( SRC_P.parent_incident = LKP.row_id 
AND SRC_P.sourceinstance = LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC_P.parent_incident IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.grand_parent_incident_key,'')
