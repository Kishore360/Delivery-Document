

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.company_key' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.change_request_final SRC
 LEFT JOIN #TABLE_SCHEMA.f_change_request TRGT 
 ON (convert(SRC.sys_id using utf8) =convert(TRGT.row_id using utf8) 
 AND convert(SRC.sourceinstance using utf8)= convert(TRGT.source_id using utf8) )
 LEFT JOIN #TABLE_SCHEMA.d_internal_organization LKP 
 ON ( CONVERT(SRC.company using utf8)= convert(LKP.row_id using utf8)
 
AND CONVERT(SRC.sourceinstance using utf8)= convert(LKP.source_id using utf8))
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.company IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.company_key,'')
