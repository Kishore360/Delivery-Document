
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident_incident_key' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.hlx_hpd_help_desk_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_incident TRGT 
 ON (SRC.incident_number=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN #DWH_TABLE_SCHEMA.d_incident LKP 
 ON ( SRC.incident_number = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.status IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.incident_key,'')

