

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request.requested_for_key' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.sc_request_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_request TRGT 
 ON (convert(SRC.sys_id using utf8) =convert(TRGT.row_id using utf8) 
 AND convert(SRC.sourceinstance using utf8)= convert(TRGT.source_id using utf8) )
LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact LKP 
 ON ( CONVERT(concat('INTERNAL_CONTACT~',requested_for) using utf8)= convert(LKP.row_id using utf8)
AND CONVERT(SRC.sourceinstance using utf8)= convert(LKP.source_id using utf8))
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.requested_for IS NULL THEN 0 else '-1' end)<> COALESCE(CONVERT(TRGT.requested_for_key using utf8),'')
