SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.hlx_hpd_help_desk_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_incident TRGT 
 ON (SRC.incident_number=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN #DWH_TABLE_SCHEMA.d_service LKP 
 ON ( concat('BUSINESS_SERVICE~',serviceci) = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id )
WHERE case when SRC.serviceci IS NULL THEN 0
 when SRC.serviceci IS not NULL 
 then LKP.row_key else -1 end<>COALESCE(TRGT.business_service_key ,'')
 
 
