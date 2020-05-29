SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_facility_request.urgency_src_key' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.facilities_request_final WHERE CDCTYPE<>'D') SRC
 LEFT JOIN #DWH_TABLE_SCHEMA.f_facility_request TRGT 
 ON (SRC.sys_id  =TRGT.row_id  
 AND SRC.sourceinstance = TRGT.source_id  )
 LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
 ON ( CONCAT('URGENCY','~','FACILITIES',UPPER(urgency)) = LKP.src_rowid 
 
AND SRC.sourceinstance = LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.urgency IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.urgency_src_key,'')
 /*
 LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_depenedent LKP1 
 ON ( concat('URGENCY','~','FACILITIES','~','~',UPPER(urgency),'~',upper(cmdb_ci)) = LKP1.row_id 
 AND SRC.sourceinstance = LKP1.source_id )
 and LKP2.dimension_class='URGENCY~FACILITIES~DEPENDENT'
 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP2 
 ON LKP1.lov_rowid = LKP2.src_rowid 
AND SRC.sourceinstance = LKP2.source_id )
 
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
 ON ( CONCAT('URGENCY','~','FACILITIES','~',UPPER(urgency)) = LKP.src_rowid 
AND SRC.sourceinstance = LKP.source_id )

 WHERE COALESCE(LKP2.row_key,LKP.row_key,CASE WHEN SRC.urgency IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.urgency_src_key ,'')
*/
