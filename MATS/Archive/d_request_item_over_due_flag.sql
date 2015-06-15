

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_item.over_due_flag' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.sc_req_item_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_o_data_freshness FRESH  ON(FRESH.source_id=SRC.sourceinstance) 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_request_item TRGT 
 ON (convert(SRC.sys_id using utf8) =convert(TRGT.row_id using utf8) 
 AND convert(SRC.sourceinstance using utf8)= convert(TRGT.source_id using utf8) )
 WHERE COALESCE( CONVERT(CASE WHEN SRC.active = 1 and due_date < FRESH.lastupdated then 'Y' else 'N' END using utf8),'')<> COALESCE(CONVERT(TRGT.over_due_flag using utf8),'')

