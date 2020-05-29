
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_facility_request.approval_state_src_key' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.facilities_request_final WHERE CDCTYPE<>'D') SRC
 LEFT JOIN #DWH_TABLE_SCHEMA.f_facility_request TRGT 
 ON (SRC.sys_id  =TRGT.row_id  
 AND SRC.sourceinstance = TRGT.source_id  )
 LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
 ON ( CONCAT('APPROVAL','~','FACILITIES','~',UPPER(approval)) = LKP.src_rowid 
 
AND SRC.sourceinstance = LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.approval IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.approval_state_src_key,'')
