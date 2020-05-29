select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.updated_by_key' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.incident_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_incident TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact LKP
 ON (LKP.user_name = SRC.sys_updated_by 
AND SRC.sourceinstance = LKP.source_id )	
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.sys_updated_by IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.updated_by_key ,'')