

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.due_on' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.change_request_final SRC 
 LEFT JOIN #TABLE_SCHEMA.d_change_request TRGT 
 ON (convert(SRC.sys_id using utf8) =convert(TRGT.row_id using utf8) 
 AND convert(SRC.sourceinstance using utf8)= convert(TRGT.source_id using utf8) )
 WHERE COALESCE( CONVERT(SRC.due_date using utf8),'')<> COALESCE(CONVERT(TRGT.due_on using utf8),'')
