

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.unplanned_flag' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.change_request_final SRC 
 LEFT JOIN #TABLE_SCHEMA.d_change_request TRGT 
 ON (convert(SRC.sys_id using utf8) =convert(TRGT.row_id using utf8) 
 AND convert(SRC.sourceinstance using utf8)= convert(TRGT.source_id using utf8) )
 WHERE CONVERT(CASE WHEN  SRC.`type` = 'Emergency' OR SRC.start_date IS NULL
 THEN 'Y' ELSE 'N' END using utf8)<> CONVERT(TRGT.unplanned_flag using utf8)
