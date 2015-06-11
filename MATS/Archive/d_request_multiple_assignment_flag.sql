

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request.multiple_assignment_flag' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.sc_request_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_request TRGT 
 ON (convert(SRC.sys_id using utf8) =convert(TRGT.row_id using utf8) 
 AND convert(SRC.sourceinstance using utf8)= convert(TRGT.source_id using utf8) )
 WHERE COALESCE( CONVERT(CASE WHEN SRC.reassignment_count >= 1 then 'Y' else 'N' END using utf8),'')<> COALESCE(CONVERT(TRGT.multiple_assignment_flag using utf8),'')
