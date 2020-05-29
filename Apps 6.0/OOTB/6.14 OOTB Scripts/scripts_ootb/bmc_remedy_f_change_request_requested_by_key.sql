
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for requested_by_key' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.hlx_chg_infrastructure_change_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_change_request TRGT 
 ON (SRC.infrastructure_change_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact LKP 
 ON ( CONCAT('INTERNAL_CONTACT~',SRC.requested_by_person_id) = LKP.row_id  
AND SRC.sourceinstance = LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.SRC.requested_by_person_id IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.requested_by_key,'')
